import 'package:flutter/material.dart';
import 'package:pixabay_gallery_mobile/app_ui/app_ui.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';

class SomethingWentWrongPage extends StatelessWidget {
  const SomethingWentWrongPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String error = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.sixteen),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: AppColors.errorColor,
              size: AppSpacing.sixtyFour,
            ),
            const SizedBox(height: AppSpacing.twentyFour),
            const Text(
              'Something went wrong!',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Text(
              error,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Navigate back or retry depending on the logic
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
