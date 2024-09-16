part of 'pixabay_model.dart';

class ImageSocialActivityModel {
  final Color iconColor;
  final IconData icon;
  final String? label;

  const ImageSocialActivityModel({
    this.label,
    required this.icon,
    required this.iconColor,
  });
}
