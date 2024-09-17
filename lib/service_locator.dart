import 'package:get_it/get_it.dart';
import 'package:pixabay_gallery_mobile/repositories/image_repository.dart';
import 'package:pixabay_gallery_mobile/repositories/image_repository_impl.dart';
import 'package:pixabay_gallery_mobile/services/api_services/apis/pixabay/pixabay_helper.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<ImageRepository>(() => ImageRepositoryImpl());

  getIt.registerFactory(() => PixabayHelper(getIt<ImageRepository>()));
}
