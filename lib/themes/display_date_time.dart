import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
String formatFromString({
  required String value,
  String? displayedFormat,
  int year = 0,
  int month = 0,
  int day = 0,
  int hour = 0,
  int minute = 0,
  int second = 0,
}) {
  final format = displayedFormat ?? 'dd.MM.yyyy, HH:mm:ss';
  String displayedValue = '';
  if (value.isNotEmpty) {
    final dateTime = DateTime.tryParse(value);
    final dateTimeLocal = dateTime!.toLocal();
    final customDateTime = DateTime(
      dateTimeLocal.year + year,
      dateTimeLocal.month + month,
      dateTimeLocal.day + day,
      dateTimeLocal.hour + hour,
      dateTimeLocal.minute + minute,
      dateTimeLocal.second + second,
    );
    displayedValue = DateFormat(format).format(customDateTime);
  }
  return displayedValue;
}

String formatFromInt({
  required int value,
  String? displayedFormat,
  int year = 0,
  int month = 0,
  int day = 0,
  int hour = 0,
  int minute = 0,
  int second = 0,
}) {
  final format = displayedFormat ?? 'dd.MM.yyyy, HH:mm:ss';
  String displayedValue = '';
  if (value != 0) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(value.toInt());
    final dateTimeLocal = dateTime.toLocal();
    final customDateTime = DateTime(
      dateTimeLocal.year + year,
      dateTimeLocal.month + month,
      dateTimeLocal.day + day,
      dateTimeLocal.hour + hour,
      dateTimeLocal.minute + minute,
      dateTimeLocal.second + second,
    );
    displayedValue = DateFormat(format).format(customDateTime);
  }
  return displayedValue;
}

String timeAgoFromNow(dynamic value, BuildContext context) {
  late DateTime dateTimeLocal;
  if (value is int) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(value.toInt());
    dateTimeLocal = dateTime.toLocal();
  } else if (value is String) {
    final dateTime = DateTime.tryParse(value)!;
    dateTimeLocal = dateTime.toLocal();
  } else if (value is DateTime) {
    dateTimeLocal = value.toLocal();
  }
  final difference = DateTime.now().toLocal().difference(dateTimeLocal);
  if (difference.inDays > 365) {
    final year = (difference.inDays / 365).floor();
    final yearString = year == 1 ? 'year' : 'years';
    final endString = ' $yearString ago';
    return year.toString() + endString.toLowerCase();
  } else if (difference.inDays > 30) {
    final month = (difference.inDays / 30).floor();
    final monthString = month == 1 ? 'month' : 'months';
    final endString = ' $monthString ago';
    return month.toString() + endString.toLowerCase();
  } else if (difference.inDays > 7) {
    final week = (difference.inDays / 7).floor();
    final weekString = week == 1 ? 'week' : 'weeks';
    final endString = ' $weekString ago';
    return week.toString() + endString.toLowerCase();
  } else if (difference.inDays > 0) {
    final dayString = difference.inDays == 1 ? 'day' : 'days';
    final endString = ' $dayString ago';
    return difference.inDays.toString() + endString.toLowerCase();
  } else if (difference.inHours > 0) {
    final hourString = difference.inHours == 1 ? 'hour' : 'hours';
    final endString = ' $hourString ago';
    return difference.inHours.toString() + endString.toLowerCase();
  } else if (difference.inMinutes > 0) {
    final minuteString = difference.inMinutes == 1 ? 'minute' : 'minutes';
    final endString = ' $minuteString ago';
    return difference.inMinutes.toString() + endString.toLowerCase();
  } else if (difference.inSeconds > 0) {
    final secondString = difference.inSeconds == 1 ? 'second' : 'seconds';
    final endString = ' $secondString ago';
    return difference.inSeconds.toString() + endString.toLowerCase();
  } else {
    return 'just now';
  }
}

String intToTimeLeft({
  required int value,
  bool isMinute = false,
}) {
  int h, m, s;
  h = isMinute ? 0 : value ~/ 3600;
  m = ((value - h * 3600)) ~/ 60;
  s = value - (h * 3600) - (m * 60);
  final hours = h.toString().padLeft(2, '0');
  final minute = m.toString().padLeft(2, '0');
  final seconds = s.toString().padLeft(2, '0');
  String result =
      isMinute || h == 0 ? '$minute:$seconds' : '$hours:$minute:$seconds';
  return result;
}
