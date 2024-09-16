import 'package:flutter/material.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_theme.dart';
import 'package:pixabay_gallery_mobile/constants/enums.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/application_bar/basic_app_bar.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/button/primary_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: Padding(
        padding: AppSpacing.twelveAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User',
              style: headerTextStyle,
            ),
            PrimaryButton(
              title: 'Log out',
              disabled: false,
              onPressed: () {
                print('tapped');
              },
              buttonType: ButtonType.danger, // Specify the danger button type
            )
          ],
        ),
      ),
    );
  }
}
