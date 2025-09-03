

import 'dart:io' show Platform, InternetAddress;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppDeviceUtility {
  AppDeviceUtility._(); 

  // =====================
  // 1) Keyboard helpers
  // =====================

  
  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  static double getKeyboardHeight(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }

  // =====================
  // 2) Screen / responsive
  // =====================

  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double pixelRatio(BuildContext context) => MediaQuery.of(context).devicePixelRatio;
  static double statusBarHeight(BuildContext context) => MediaQuery.of(context).padding.top;

  static double appBarHeight() => kToolbarHeight;

  static double bottomNavBarHeight() => kBottomNavigationBarHeight;

  static bool isLandscape(BuildContext context) => MediaQuery.of(context).orientation == Orientation.landscape;

  static int responsiveGridCount(BuildContext context) {
    final w = screenWidth(context);
    if (w >= 1200) return 3; // large desktop/tablet landscape
    if (w >= 800) return 2; // tablet
    if (w >= 600) return 1; // large phones
    return 1; // small phone
  }



  // =====================
  // 3) System UI (status bar / fullscreen)
  // =====================

  static void setStatusBarColor(Color color, {Brightness iconBrightness = Brightness.dark}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: iconBrightness,
        statusBarBrightness: iconBrightness, 
      ),
    );
  }

  static Future<void> setFullScreen(bool enable) async {
    await SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  static Future<void> hideStatusBar() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static Future<void> showStatusBar() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: SystemUiOverlay.values);
  }

  static Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  // =====================
  // 4) Haptic / vibration
  // =====================

  static Future<void> vibrateShort() async {
    await HapticFeedback.selectionClick();
  }

  static Future<void> vibrateDouble(Duration gap) async {
    HapticFeedback.vibrate();
    await Future.delayed(gap);
    HapticFeedback.vibrate();
  }

  // =====================
  // 5) Platform helpers
  // =====================


  static bool isAndroid() => !kIsWeb && Platform.isAndroid;

  static bool isIOS() => !kIsWeb && Platform.isIOS;

  static bool isMobile() => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  // =====================
  // 6) Connectivity / Internet
  // =====================

  static Future<bool> hasInternetConnection({Duration timeout = const Duration(seconds: 5)}) async {
    try {
      final conn = await Connectivity().checkConnectivity();
      if (conn == ConnectivityResult.none) return false;

      if (kIsWeb) {
        return true;
      }

      final result = await InternetAddress.lookup('example.com').timeout(timeout);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  // =====================
  // 7) URL / Phone / Email / WhatsApp / Maps / Share
  // ====================

  static Future<void> openUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) throw Exception('Invalid URL: $url');

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> callPhone(String phone) async {
    final tel = 'tel:$phone';
    await openUrl(tel);
  }

  


   


  static Future<void> openMap({double? lat, double? lng, String? query}) async {
    if (lat != null && lng != null) {
      final googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
      await openUrl(googleMapsUrl);
      return;
    }

    if (query != null && query.isNotEmpty) {
      final q = Uri.encodeComponent(query);
      final googleSearchUrl = 'https://www.google.com/maps/search/?api=1&query=$q';
      await openUrl(googleSearchUrl);
      return;
    }

    throw Exception('Either lat/lng or query must be provided to openMap');
  }

  static Future<void> shareText(String text, {String? subject}) async {
    await Share.share(text, subject: subject);
  }


  // =====================
  // 8) Chat helpers 
  // =====================

 
  static void navigateToChat(BuildContext context,
      {required String chatId, required String agentId, String? agentName}) {
    Navigator.pushNamed(context, '/chat', arguments: {
      'chatId': chatId,
      'agentId': agentId,
      'agentName': agentName,
    });
  }


  static void onMessageSentSuccess(BuildContext context) {
    vibrateShort();
    hideKeyboard();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('')),
    );
  }

  

  // =====================
  // 9) Helpers for image quality & caching
  // =====================

  static String chooseImageQualityByPixelRatio(BuildContext context) {
    final ratio = pixelRatio(context);
    if (ratio >= 3.0) return 'high';
    if (ratio >= 2.0) return 'medium';
    return 'low';
  }

 
}
