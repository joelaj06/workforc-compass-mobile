import 'dart:core';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';


class DataFormatter{
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


  static String formatDateToString(String date){
    // ==> 'Wednesday, January 10, 2012'
    if(date == '') {
      return date;
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