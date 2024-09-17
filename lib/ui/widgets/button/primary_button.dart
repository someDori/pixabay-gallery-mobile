import 'package:flutter/material.dart';
import 'package:pixabay_gallery_mobile/app_ui/app_ui.dart';
import 'package:pixabay_gallery_mobile/constants/enums.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/loading_indicator.dart';

class PrimaryButton extends StatefulWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final bool? isLoading;
  final bool disabled;
  final ButtonType buttonType;

  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.width,
    this.height,
    this.isLoading,
    required this.disabled,
    this.buttonType = ButtonType.primary,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: widget.isLoading ?? false
          ? const LoadingIndicator()
          : ElevatedButton(
              style: primaryButtonStyle.copyWith(
                backgroundColor: WidgetStateProperty.all(
                  widget.buttonType == ButtonType.danger
                      ? AppColors.dangerButtonBackgroundColor
                      : AppColors.primaryButtonBackgroundColor,
                ),
              ),
              onPressed: widget.disabled ? null : widget.onPressed,
              child: Opacity(
                opacity: widget.disabled ? 0.6 : 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
