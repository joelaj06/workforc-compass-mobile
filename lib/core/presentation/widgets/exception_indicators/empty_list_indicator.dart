import 'package:flutter/cupertino.dart';
import '../../utils/app_assets.dart';
import 'exception_indicator.dart';

class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ExceptionIndicator(
      title: 'Sorry!',
      message: 'No result found.',
      assetName: AppImageAssets.noResult,
    );
  }
}
