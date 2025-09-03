
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppHelperFunction {
  static Color? getColor(String value) {
    switch (value.toLowerCase()) {
      case "white":
        return Colors.white;
      case "black":
        return Colors.black;
      case "red":
        return Colors.red;
      case "green":
        return Colors.green;
      case "blue":
        return Colors.blue;
      case "yellow":
        return Colors.yellow;
      case "orange":
        return Colors.orange;
      case "purple":
        return Colors.purple;
      case "pink":
        return Colors.pink;
      case "grey":
        return Colors.grey;
      case "brown":
        return Colors.brown;
      case "cyan":
        return Colors.cyan;
      case "teal":
        return Colors.teal;
      case "indigo":
        return Colors.indigo;
      case "amber":
        return Colors.amber;
      case "lime":
        return Colors.lime;
      case "deeporange":
        return Colors.deepOrange;
      case "deeppurple":
        return Colors.deepPurple;
      default:
        return null;
    }
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)} ...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size sizeScreen(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

 
  static String formatAddress(String street, String city) {
    return '$street, $city';
  }

  static Future<void> openMap(double lat, double lng) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not open map';
    }
  }

  static String defaultPropertyImage(String? imageUrl) {
    return imageUrl ?? 'assets/images/default_property.png';
  }

  static Future<bool> confirmDelete(BuildContext context) async {
    bool confirmed = false;
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirm"),
        content: const Text("Are you sure you want to delete this property?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("Delete"),
            onPressed: () {
              confirmed = true;
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
    return confirmed;
  }
}
