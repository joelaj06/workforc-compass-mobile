import 'package:flutter/material.dart';

import '../../utils/app_padding.dart';
import '../../utils/app_spacing.dart';
import '../app_button.dart';

/// Basic layout for indicating that an exception occurred.
class ExceptionIndicator extends StatelessWidget {
  const ExceptionIndicator({
    required this.title,
    required this.assetName,
    this.message,
    this.onTryAgain,
    this.titleStyle,
    this.messageStyle,
    Key? key,
  }) : super(key: key);
  final String title;
  final String? message;
  final String assetName;
  final VoidCallback? onTryAgain;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: <Widget>[
              Image.asset(
                assetName,
                height: 200,
                width: 200,
                scale: 1,
              ),
              const AppSpacing(v: 32),
              Text(
                title,
                textAlign: TextAlign.center,
                style: titleStyle ?? Theme.of(context).textTheme.headline6,
              ),
              if (message != null)
                const SizedBox(
                  height: 10,
                ),
              if (message != null)
                Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: messageStyle,
                ),
              if (onTryAgain != null) const Spacer(),
              if (onTryAgain != null)
                AppButton(
                  padding: AppPaddings.mA,
                  key: const Key('tryAgain'),
                  enabled: true,
                  // backgroundColor: context.colors.primary,
                  onPressed: onTryAgain!,
                  text: 'Try Again',
                ),
            ],
          ),
        ),
      );
}
