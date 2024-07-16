
import 'package:flutter/material.dart';

class KeyboardStateListener extends WidgetsBindingObserver {
  bool isKeyboardOpen = false;
  VoidCallback? onKeyboardStateChanged;
  late final BuildContext context;

  void addListener(VoidCallback callback) {
    onKeyboardStateChanged = callback;
    WidgetsBinding.instance.addObserver(this);
  }

  void removeListener() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    WidgetsBinding.instance.addPostFrameCallback((_) {

      final bool keyboardVisible = View.of(context).viewInsets.bottom > 0;
      if (keyboardVisible != isKeyboardOpen) {
        isKeyboardOpen = keyboardVisible;
        if (onKeyboardStateChanged != null) {
          onKeyboardStateChanged!();
        }
      }
    });
  }
}
