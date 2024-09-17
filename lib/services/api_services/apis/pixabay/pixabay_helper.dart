import 'package:models/models.dart';
import 'package:pixabay_gallery_mobile/repositories/image_repository.dart';

class PixabayHelper {
  final ImageRepository _imagesRepository;

  PixabayHelper(this._imagesRepository);

  Future<ImagesModel?> getImages({
    required String token,
    Map<String, dynamic>? messageBody,
  }) async {
    try {
      return await _imagesRepository.fetchImages(
          token: token, messageBody: messageBody);
    } catch (e) {
      print('Error fetching images: $e');
      return null;
    }
  }
}
