import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:pixabay_gallery_mobile/app_ui/app_ui.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:url_launcher/url_launcher.dart';

class PictureDescriptionCard extends StatelessWidget {
  final ImageModel imageModel;

  const PictureDescriptionCard({
    super.key,
    required this.imageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSpacing.four,
      ),
      child: Row(
        children: [
          Text(
            imageModel.type ?? 'Unknown type',
            style: pictureHeaderTextStyle.copyWith(
              color: AppColors.infoColor,
            ),
          ),
          const SizedBox(
            width: AppSpacing.four,
          ),
          Text(
            '${imageModel.imageWidth}x${imageModel.imageHeight}',
            style: pictureHeaderTextStyle.copyWith(
              color: AppColors.infoColor,
            ),
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: () => _launchUrl(imageModel.pageURL ?? ''),
            child: const Text('See on website'),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String uri) async {
    final Uri url = Uri.parse(uri);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
