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
        titleText: Text(
            status == SnackStatus.success
                ? 'Success'
                : status == SnackStatus.info
                    ? 'Info'
                    : 'Error',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
        //  message: message,
        duration: const Duration(milliseconds: 3000),
        messageText: Text(message, style: const TextStyle(color: Colors.black)),
        icon: Icon(
          status == null
              ? Ionicons.checkmark_done_circle
              : status == SnackStatus.info
                  ? Ionicons.alert_circle
                  : Ionicons.close_circle,
          color: status == null
              ? Colors.green
              : status == SnackStatus.info
                  ? Colors.orange
                  : Colors.red,
        ),
        snackStyle: SnackStyle.FLOATING,
        /* borderColor: status == null
            ? Colors.green
            : status == SnackStatus.info
            ? Colors.orange
            : Colors.red,*/
        backgroundColor: Colors.white.withOpacity(0.4),
        snackPosition: SnackPosition.TOP,
        borderWidth: 3.0,
        //overlayBlur: 2.0,
        barBlur: 2.0,
        // padding: AppPaddings.mA,
        margin: const EdgeInsets.all(8.0),
        borderRadius: 10,
      ),
    );
  }
}

enum SnackStatus { success, error, info }
