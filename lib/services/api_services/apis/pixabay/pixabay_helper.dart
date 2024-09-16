import 'package:models/models.dart';
import 'package:pixabay_gallery_mobile/services/api_services/apis/pixabay/pixabay_api.dart';

class PixabayHelper {
  static Future<ImagesModel?> getImages({
    required String token,
    Map<String, dynamic>? messageBody,
  }) async {
    try {
      final response = await PixabayApi.getPixabayImages(
        token: token,
        messageBody: messageBody,
      );

      if (response.statusCode == 200) {
        return ImagesModel.fromJson(response.data);
      } else {
        print("API returned status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print('Error fetching images: $e');
      return null;
    }
  }
}
