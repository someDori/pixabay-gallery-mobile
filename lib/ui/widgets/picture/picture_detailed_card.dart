import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/picture/picture.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/picture/picture_description_card.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/picture/picture_tags_card.dart';

class PictureDetailedCard extends StatelessWidget {
  final ImageModel imageModel;
  final TextStyle? imageNotLoadingErrorStyle;
  final bool? isDividerAtTheBottom;

  const PictureDetailedCard({
    super.key,
    required this.imageModel,
    this.imageNotLoadingErrorStyle,
    this.isDividerAtTheBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Picture Description
        PictureDescriptionCard(
          imageModel: imageModel,
        ),

        const SizedBox(
          height: AppSpacing.eight,
        ),

        /// Picture
        Picture(
          imageUrl: imageModel.largeImageURL,
          imageNotLoadedErrorTxt: 'Couln\'t load an image',
          imageNotLoadedErrorStyle: imageNotLoadingErrorStyle,
          width: MediaQuery.sizeOf(context).width.toInt(),
          height: imageModel.webformatHeight,
        ),

        const SizedBox(
          height: AppSpacing.eight,
        ),

        /// Tags
        PictureTagsCard(
          imageModel: imageModel,
        ),

        if (isDividerAtTheBottom == true) const Divider(),
      ],
    );
  }
}
