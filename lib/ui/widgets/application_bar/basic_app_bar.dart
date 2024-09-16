import 'package:flutter/material.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? headerText;
  final TextStyle? headerTextStyle;
  final IconData? icon;
  final double? iconSize;
  final bool? hasProfile;
  final VoidCallback? headerAction;
  final bool? automaticallyImplyLeading;

  const BasicAppBar({
    super.key,
    this.headerText,
    this.headerTextStyle,
    this.icon,
    this.iconSize,
    this.hasProfile,
    this.headerAction,
    this.automaticallyImplyLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        headerText ?? '',
        style: headerTextStyle,
      ),
      actions: [
        if (hasProfile == true)
          Padding(
            padding: const EdgeInsets.only(
              right: AppSpacing.eight,
            ),
            child: GestureDetector(
              onTap: headerAction,
              child: Icon(
                icon,
                size: iconSize ?? AppSpacing.fourty,
              ),
            ),
          ),
      ],
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
