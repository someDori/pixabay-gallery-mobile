import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:pixabay_gallery_mobile/app_ui/app_ui.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';

class PictureSocialActivities extends StatelessWidget {
  final List<ImageSocialActivityModel> activities;
  final bool? isDividerAtTheBottom;

  const PictureSocialActivities({
    super.key,
    required this.activities,
    this.isDividerAtTheBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: AppSpacing.eightAll,
            child: Text(
              'Social Activities',
              style: pictureHeaderTextStyle.copyWith(
                color: AppColors.infoColor,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: AppSpacing.four,
            runSpacing: -AppSpacing.eight + 2.0,
            children: activities
                .map(
                  (activity) => Chip(
                    avatar: Icon(
                      activity.icon,
                      color: activity.iconColor,
                    ),
                    label: Text(activity.label ?? '0'),
                  ),
                )
                .toList(),
          ),
        ),
        if (isDividerAtTheBottom == true) const Divider(),
      ],
    );
  }
}
