import 'dart:core';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';


class DataFormatter{

  static String getVerboseDateTimeRepresentation(DateTime dateTime) {
    final DateTime now = DateTime.now();
    // final DateTime justNow = DateTime.now().subtract(const Duration(minutes: 1));
    final DateTime localDateTime = dateTime.toLocal();

    /*if (!localDateTime.difference(justNow).isNegative) {
      return 'Just now';
    }*/

    final String roughTimeString = DateFormat('jm').format(dateTime);
    if (localDateTime.day == now.day && localDateTime.month == now.month && localDateTime.year == now.year) {
      return roughTimeString;
    }

    final DateTime yesterday = now.subtract(const Duration(days: 1));

    if (localDateTime.day == yesterday.day && localDateTime.month == yesterday.month && localDateTime.year == yesterday.year) {
      return 'Yesterday, $roughTimeString';
    }

    if (now.difference(localDateTime).inDays < 4) {
      final String weekday = DateFormat('EEEE').format(localDateTime);

      return '$weekday, $roughTimeString';
    }

    return '${DateFormat('yMd').format(dateTime)}, $roughTimeString';

  }

  static String formatDate(String dateString){
    //2022-01-21T05:00:00Z
    if(dateString.isEmpty) {
      return dateString;
    }else{
    final DateTime now = DateTime.parse(dateString);
    final String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(now);
    return formattedDate;

    }
  }


  static DateTime getStartOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  static DateTime getEndOfMonth(DateTime date) {
    final DateTime startOfNextMonth = (date.month < 12)
        ? DateTime(date.year, date.month + 1, 1)
        : DateTime(date.year + 1, 1, 1);
    return startOfNextMonth.subtract(const Duration(seconds: 1));
  }


  static String formatDateToString(String date){
    // ==> 'Wednesday, January 10, 2012'
    if(date == '') {
      return 'N/A';
    }
    final DateTime parsedDate = DateTime.parse(date);
    return DateFormat.yMMMMEEEEd().format(parsedDate);
  }

  static String formatDateAndTimeToString(String dateString){
    final DateTime now = DateTime.parse(dateString);
    final String formattedDateToString = DateFormat('EE MMMM dd, yyyy HH:mm').format(now);
    return formattedDateToString;
  }

  static String formatDateAndTimeToStringDigit(String dateString){
    if(dateString.isEmpty){
      return dateString;
    }
    final DateTime now = DateTime.parse(dateString);
    final String formattedDateToString = DateFormat('dd-MM-yyyy HH:mm').format(now);
    return formattedDateToString;
  }

 static String formatDateOnly(DateTime date) {
    final DateFormat dateFormatter = DateFormat('dd-MM-yyyy');
    return dateFormatter.format(date);
  }


  static String formatDigitGrouping(double num){
    final List<String> value = <String>[];
    final NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    final String number = num.toStringAsFixed(2);
    final String wholeNumber = number.split('.')[0];
    final String decimalNumber = number.split('.')[1];
    final double formattedNumber = double.parse(wholeNumber);
    final String numberInString =  myFormat.format(formattedNumber);
    value.add(numberInString);
    value.add(decimalNumber);
    final String digit = value.join('.');
    return digit;
  }
  static NumberFormat getLocalCurrencyFormatter(BuildContext context, {bool includeSymbol = true}){
    final NumberFormat formatter = NumberFormat.currency(
        locale: Localizations.localeOf(context).toString(),name:'Ghana Cedis',
        symbol: includeSymbol ? 'GH¢ ' : '',decimalDigits: 2);
    return formatter;
  }
  static NumberFormat getCurrencyFormatter(BuildContext context){
    final NumberFormat formatter = NumberFormat.currency(
        locale: Localizations.localeOf(context).toString(),name:'Ghana Cedis',
        symbol: '',decimalDigits: 2);
    return formatter;
  }


}