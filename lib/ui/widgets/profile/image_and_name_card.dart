import 'package:flutter/material.dart';
import 'package:pixabay_gallery_mobile/app_ui/app_ui.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';

import '../../../app_ui/theme/app_theme.dart';

class ImageAndNameCard extends StatelessWidget {
  final String? imageUrl;
  final String? username;
  final TextStyle? nameTextStyle;
  final double? width;
  final double? height;

  const ImageAndNameCard({
    super.key,
    this.imageUrl,
    this.username,
    this.nameTextStyle,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.eightAll,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width ?? 40,
            height: height ?? 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: AppColors.textLightColor,
              ),
              image: imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: imageUrl == null
                ? Icon(
                    Icons.person,
                    size: width ?? 40,
                  )
                : null,
          ),
          const SizedBox(
            width: AppSpacing.eight,
          ),
          Flexible(
            child: Text(
              username ?? '',
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: nameTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
