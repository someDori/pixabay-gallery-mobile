import 'package:models/pixabay_images_models/pixabay_model.dart';

abstract class ImageRepository {
  Future<ImagesModel?> fetchImages(
      {required String token, Map<String, dynamic>? messageBody});
}
