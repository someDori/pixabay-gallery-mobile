import 'package:flutter/material.dart';

class Picture extends StatelessWidget {
  final String? imageUrl;
  final String? imageNotLoadedErrorTxt;
  final TextStyle? imageNotLoadedErrorStyle;
  final int? width;
  final int? height;

  const Picture({
    super.key,
    this.imageUrl,
    this.imageNotLoadedErrorTxt,
    this.imageNotLoadedErrorStyle,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
      ),
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              width: width?.toDouble(),
              height: height?.toDouble(),
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    imageNotLoadedErrorTxt ?? 'Error during loading of image',
                    style: imageNotLoadedErrorStyle,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            )
          : Center(
              child: Text(
                imageNotLoadedErrorTxt ?? 'Error during loading of image',
                style: imageNotLoadedErrorStyle,
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
