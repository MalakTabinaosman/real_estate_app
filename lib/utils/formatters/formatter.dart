
import 'package:intl/intl.dart';

class AppFormatters {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String formatCurrency(double amount, {String currencySymbol = '\$'}) {
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: currencySymbol,
      decimalDigits: 0, 
    ).format(amount);
  }

  static String formatArea(double area) {
    return '${area.toStringAsFixed(0)} m²';
  }

  static String formatPhoneNumber(String phoneNumber, String countryCode) {
    if (phoneNumber.startsWith('0')) {
      phoneNumber = phoneNumber.substring(1);
    }

    if (phoneNumber.length == 10) {
      String part1 = phoneNumber.substring(0, 3);
      String part2 = phoneNumber.substring(3, 6);
      String part3 = phoneNumber.substring(6);
      return '+$countryCode $part1 $part2 $part3';
    } else if (phoneNumber.length == 11) {
      String part1 = phoneNumber.substring(0, 4);
      String part2 = phoneNumber.substring(4, 7);
      String part3 = phoneNumber.substring(7);
      return '+$countryCode $part1 $part2 $part3';
    }

    return '+$countryCode $phoneNumber';
  }

  static String formatAddress(String street, String city) {
    return '$street, $city';
  }

  static String formatLastUpdated(DateTime updatedDate) {
    final now = DateTime.now();
    final difference = now.difference(updatedDate);

    if (difference.inDays > 0) {
      return 'Last updated: ${difference.inDays} day(s) ago';
    } else if (difference.inHours > 0) {
      return 'Last updated: ${difference.inHours} hour(s) ago';
    } else {
      return 'Last updated: just now';
    }
  }
}
