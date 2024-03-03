import 'package:al_sadeem_app/core/config/extensions/all_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunction {
  static Future<bool> urlLauncherApplication(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      return await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: const WebViewConfiguration(
          enableDomStorage: false,
          enableJavaScript: false,
        ),
      );
    } else {
      throw Exception('Unable to launch url');
    }
  }

  /// Returns a list of time intervals based on the given time range:[branchTime].
  ///
  /// output example: `['10AM - 12PM', '12PM - 2PM', '2PM - 4PM', '4PM - 6PM', '6PM - 8PM']`.
  static List<String> getTimeIntervals(String branchTime, String locale) {
    // Split the time range into start and end times
    List<String> times = branchTime.split(" - ");
    String startTime = times[0];
    String endTime = times[1];

    // Use DateFormat for parsing
    final format = DateFormat('hh:mm a');
    DateTime start = format.parse(startTime);
    DateTime end = format.parse(endTime);

    // Calculate total hours
    int totalHours = end.difference(start).inHours;

    // Generate two-hour intervals with special handling for the last interval
    List<String> intervals = [];
    if (totalHours > 0) {
      while (start.isBefore(end) || start == end) {
        DateTime nextInterval;
        if (totalHours % 2 != 0 && start.add(const Duration(hours: 2)).isAfter(end)) {
          // Adjust the last interval to 3 hours if total hours is odd
          nextInterval = end;
        } else {
          nextInterval = start.add(const Duration(hours: 2));
        }

        final startFormatted = start.formatTime(locale: locale, format: 'h a');
        final nextIntervalFormatted = nextInterval.formatTime(locale: locale, format: 'h a');

        intervals.add("$startFormatted - $nextIntervalFormatted");
        start = nextInterval;

        // Update total hours after adjusting the last interval
        totalHours = end.difference(start).inHours;
      }
    } else {
      final startFormatted = start.formatTime(locale: locale, format: 'h a');
      final endFormatted = end.formatTime(locale: locale, format: 'h a');

      // Special handling for the case when branch time is exactly 24 hours
      intervals.add("$startFormatted - $endFormatted");
    }

    return intervals;
  }
}
