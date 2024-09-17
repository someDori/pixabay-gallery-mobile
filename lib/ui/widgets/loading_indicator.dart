import 'package:flutter/material.dart';
import 'package:pixabay_gallery_mobile/app_ui/app_ui.dart';

class LoadingIndicator extends StatelessWidget {
  final bool? defaultBackgroundColor;
  final double? height;
  final bool center;
  final double strokeWidth;

  const LoadingIndicator({
    super.key,
    this.defaultBackgroundColor,
    this.height,
    this.center = true,
    this.strokeWidth = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    final progressWidget = CircularProgressIndicator(
      strokeWidth: strokeWidth,
      valueColor: const AlwaysStoppedAnimation<Color>(
        AppColors.textLightColor,
      ),
    );

    return Container(
      height: height,
      color: defaultBackgroundColor != null ? null : Colors.white10,
      child: center
          ? Center(
              child: progressWidget,
            )
          : progressWidget,
    );
  }
}
