import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/pixabay_images_models/pixabay_model.dart';
import 'package:pixabay_gallery_mobile/service_locator.dart';
import 'package:pixabay_gallery_mobile/services/api_services/apis/pixabay/pixabay_helper.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  final PixabayHelper _pixabayHelper = getIt<PixabayHelper>();

  ImagesCubit() : super(ImagesInitial());

  Future<void> fetchImages({
    required String token,
    Map<String, dynamic>? messageBody,
  }) async {
    emit(ImagesLoading());
    try {
      final response = await _pixabayHelper.getImages(
        token: token,
        messageBody: messageBody,
      );
      final List<ImageModel> images = response?.hits ?? [];
      emit(ImagesLoaded(images));
    } catch (e) {
      emit(ImagesError('Failed to load images: $e'));
    }
  }
}
