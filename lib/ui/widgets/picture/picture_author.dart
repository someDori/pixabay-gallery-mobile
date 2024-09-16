import 'package:flutter/material.dart';
import 'package:models/pixabay_images_models/pixabay_model.dart';
import 'package:pixabay_gallery_mobile/app_ui/app_ui.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/profile/image_and_name_card.dart';

class PictureAuthor extends StatelessWidget {
  final ImageModel imageModel;
  final bool? isDividerAtTheBottom;

  const PictureAuthor({
    super.key,
    required this.imageModel,
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
              'Author',
              style: pictureHeaderTextStyle.copyWith(
                color: AppColors.infoColor,
              ),
            ),
          ),
        ),
        ImageAndNameCard(
          imageUrl: imageModel.userImageURL,
          username: imageModel.user,
          nameTextStyle: userNameTextStyle.copyWith(
            fontSize: AppSpacing.twenty,
            fontWeight: FontWeight.w800,
          ),
          width: AppSpacing.eighty,
          height: AppSpacing.eighty,
        ),
        if (isDividerAtTheBottom == true) const Divider(),
      ],
    );
  }
}
