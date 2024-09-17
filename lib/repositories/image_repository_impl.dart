import 'package:models/pixabay_images_models/pixabay_model.dart';
import 'package:pixabay_gallery_mobile/services/api_services/apis/pixabay/pixabay_api.dart';
import 'image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  @override
  Future<ImagesModel?> fetchImages(
      {required String token, Map<String, dynamic>? messageBody}) async {
    try {
      final response = await PixabayApi.getPixabayImages(
          token: token, messageBody: messageBody);
      if (response.statusCode == 200) {
        return ImagesModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      print('Error fetching images: $e');
      return null;
    }
  }
}
