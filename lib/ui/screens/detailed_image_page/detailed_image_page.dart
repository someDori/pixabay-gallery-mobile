import 'package:flutter/material.dart';
import 'package:models/pixabay_images_models/pixabay_model.dart';
import 'package:pixabay_gallery_mobile/app_ui/app_ui.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/application_bar/basic_app_bar.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/picture/picture_author.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/picture/picture_detailed_card.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/picture/picture_social_activities.dart';

class DetailedImagePage extends StatelessWidget {
  const DetailedImagePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ImageModel imageModel =
        ModalRoute.of(context)?.settings.arguments as ImageModel;
    final List<ImageSocialActivityModel> activities = [
      ImageSocialActivityModel(
        icon: Icons.remove_red_eye,
        iconColor: AppColors.primaryColor,
        label: imageModel.views.toString(),
      ),
      ImageSocialActivityModel(
        icon: Icons.save_alt,
        iconColor: AppColors.infoColor,
        label: imageModel.downloads.toString(),
      ),
      ImageSocialActivityModel(
        icon: Icons.favorite,
        iconColor: AppColors.red,
        label: imageModel.likes.toString(),
      ),
      ImageSocialActivityModel(
        icon: Icons.comment,
        iconColor: AppColors.accentColor,
        label: imageModel.comments.toString(),
      ),
      ImageSocialActivityModel(
        icon: Icons.bookmark,
        iconColor: AppColors.buttonColor,
        label: imageModel.collections.toString(),
      ),
    ];
    return Scaffold(
      appBar: BasicAppBar(
        headerText: 'PixaBay Image',
        headerTextStyle: headerTextStyle,
        hasProfile: false,
      ),
      body: Padding(
        padding: AppSpacing.twelveAll,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Picture Details
              PictureDetailedCard(
                imageModel: imageModel,
                imageNotLoadingErrorStyle: imageLoadErrorTextStyle,
                isDividerAtTheBottom: true,
              ),

              /// Social Activities
              PictureSocialActivities(
                activities: activities,
                isDividerAtTheBottom: true,
              ),

              /// Author Details
              PictureAuthor(
                imageModel: imageModel,
                isDividerAtTheBottom: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
