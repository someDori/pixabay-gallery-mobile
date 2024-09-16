import 'package:flutter/material.dart';
import 'package:models/pixabay_images_models/pixabay_model.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';

class PictureTagsCard extends StatelessWidget {
  final ImageModel imageModel;

  const PictureTagsCard({
    super.key,
    required this.imageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        spacing: AppSpacing.four,
        runSpacing: -AppSpacing.eight + 2.0,
        children: [
          ...imageModel.tags!.map(
            (tag) => Padding(
              padding: const EdgeInsets.only(right: AppSpacing.four),
              child: Chip(
                label: Text(tag),
                shape: const StadiumBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
