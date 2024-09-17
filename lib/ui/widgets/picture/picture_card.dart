import 'package:flutter/material.dart';
import 'package:models/pixabay_images_models/pixabay_model.dart';
import 'package:pixabay_gallery_mobile/app_ui/app_ui.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/picture/picture.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/profile/image_and_name_card.dart';

class PictureCard extends StatelessWidget {
  final ImageModel imageData;
  final TextStyle? imageNotLoadingTextStyle;
  final TextStyle? userNameTextStyle;

  const PictureCard({
    super.key,
    required this.imageData,
    this.imageNotLoadingTextStyle,
    this.userNameTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textLightColor,
          width: 1.0,
        ),
        color: AppColors.cardBackgroundColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: Picture(
              imageUrl: imageData.largeImageURL,
              imageNotLoadedErrorTxt: 'Couln\'t load an image',
              imageNotLoadedErrorStyle: imageNotLoadingTextStyle,
            ),
          ),
          ImageAndNameCard(
            imageUrl: imageData.userImageURL,
            username: imageData.user,
            nameTextStyle: userNameTextStyle,
          ),
        ],
      ),
    );
  }
}
