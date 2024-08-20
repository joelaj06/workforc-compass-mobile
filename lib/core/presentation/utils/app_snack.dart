import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class AppSnack {
  static void show({
    required String title,
    required String message,
    SnackStatus? status,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        duration: const Duration(milliseconds: 3000),
        icon: Icon(
          status == null
              ? Ionicons.checkmark_done_circle_outline
              : status == SnackStatus.info
                  ? Ionicons.alert_circle_outline
                  : Ionicons.close_circle_outline,
          color: status == null
              ? Colors.green
              : status == SnackStatus.info
                  ? Colors.orange
                  : Colors.red,
        ),
        snackStyle: SnackStyle.GROUNDED,
      ),
    );
  }
}

enum SnackStatus { success, error, info }
