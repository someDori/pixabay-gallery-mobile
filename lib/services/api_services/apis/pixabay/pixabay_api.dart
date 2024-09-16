import 'package:dio/dio.dart';

class PixabayApi {
  static const String baseUrl = 'https://pixabay.com/api/';
  static final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  static Future<Response> getPixabayImages({
    required String token,
    Map<String, dynamic>? messageBody,
  }) async {
    final Map<String, dynamic> params = {
      'key': token,
      ...?messageBody,
    };

    try {
      final response = await _dio.get('', queryParameters: params);
      return response;
    } catch (e) {
      print('API call error: $e');
      throw Exception('Failed to load images: $e');
    }
  }
}
