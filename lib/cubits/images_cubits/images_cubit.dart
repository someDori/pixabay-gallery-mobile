import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/pixabay_images_models/pixabay_model.dart';
import 'package:pixabay_gallery_mobile/services/api_services/apis/pixabay/pixabay_helper.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImagesInitial());

  Future<void> fetchImages(
      {required String token, Map<String, dynamic>? messageBody}) async {
    emit(ImagesLoading());
    try {
      final response = await PixabayHelper.getImages(
        token: token,
        messageBody: messageBody,
      );
      final List<ImageModel> images = response?.hits ?? [];
      print(images);
      emit(ImagesLoaded(images));
    } catch (e) {
      emit(ImagesError('Failed to load images: $e'));
    }
  }
}
