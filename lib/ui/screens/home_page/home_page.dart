import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/constants/routes.dart';
import 'package:pixabay_gallery_mobile/cubits/images_cubits/images_cubit.dart';
import 'package:pixabay_gallery_mobile/constants/secrets.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/application_bar/basic_app_bar.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/picture/picture_card.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ImagesCubit>().fetchImages(
      token: ApiKeys.pixabayApiKey,
      messageBody: {
        'image_type': 'photo',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: BasicAppBar(
          headerText: 'PixaBay Images',
          headerTextStyle: headerTextStyle,
          headerAction: () {
            Navigator.of(context).pushNamed(
              profileScreenRoute,
            );
          },
          icon: Icons.person,
          iconSize: AppSpacing.forty,
          automaticallyImplyLeading: false,
          hasProfile: true,
        ),
        body: BlocBuilder<ImagesCubit, ImagesState>(
          builder: (context, state) {
            if (state is ImagesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ImagesLoaded) {
              return Padding(
                padding: AppSpacing.twelveAll,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: AppSpacing.twelve,
                    crossAxisSpacing: AppSpacing.twelve,
                  ),
                  itemCount: state.images.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final imageData = state.images[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          detailedImageScreenRoute,
                          arguments: imageData,
                        );
                      },
                      child: PictureCard(
                        imageData: imageData,
                        imageNotLoadingTextStyle: imageLoadErrorTextStyle,
                        userNameTextStyle: userNameTextStyle,
                      ),
                    );
                  },
                ),
              );
            } else if (state is ImagesError) {
              return Center(child: Text(state.message));
            } else {
              return Center(
                child: Text(
                  'Something went wrong',
                  style: pageLoadErrorTextStyle,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
