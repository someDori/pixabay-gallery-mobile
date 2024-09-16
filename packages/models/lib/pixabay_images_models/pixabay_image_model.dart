part of 'pixabay_model.dart';

class ImageModel extends Equatable {
  final int? id;
  final String? pageURL;
  final String? type;
  final List<String>? tags;
  final String? previewURL;
  final int? previewWidth;
  final int? previewHeight;
  final String? webformatURL;
  final int? webformatWidth;
  final int? webformatHeight;
  final String? largeImageURL;
  final int? imageWidth;
  final int? imageHeight;
  final int? imageSize;
  final int? views;
  final int? downloads;
  final int? collections;
  final int? likes;
  final int? comments;
  final int? user_id;
  final String? imageURL;
  final String? user;
  final String? userImageURL;

  const ImageModel({
    this.type,
    this.id,
    this.user_id,
    this.pageURL,
    this.tags,
    this.previewURL,
    this.previewWidth,
    this.previewHeight,
    this.webformatURL,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageURL,
    this.imageURL,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.user,
    this.userImageURL,
  });

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      type: map['type'] as String?,
      id: map['id'] as int?,
      user_id: map['user_id'] as int?,
      pageURL: map['pageURL'] as String?,
      tags:
          (map['tags'] as String).split(',').map((tag) => tag.trim()).toList(),
      previewURL: map['previewURL'] as String?,
      previewWidth: map['previewWidth'] as int?,
      previewHeight: map['previewHeight'] as int?,
      webformatURL: map['webformatURL'] as String?,
      webformatWidth: map['webformatWidth'] as int?,
      webformatHeight: map['webformatHeight'] as int?,
      largeImageURL: map['largeImageURL'] as String?,
      imageURL: map['imageURL'] as String?,
      imageWidth: map['imageWidth'] as int?,
      imageHeight: map['imageHeight'] as int?,
      imageSize: map['imageSize'] as int?,
      views: map['views'] as int?,
      downloads: map['downloads'] as int?,
      collections: map['collections'] as int?,
      likes: map['likes'] as int?,
      comments: map['comments'] as int?,
      user: map['user'] as String?,
      userImageURL: map['userImageURL'] as String?,
    );
  }

  ImageModel copyWith({
    String? type,
    int? id,
    int? user_id,
    String? pageURL,
    List<String>? tags,
    String? previewURL,
    int? previewWidth,
    int? previewHeight,
    String? webformatURL,
    int? webformatWidth,
    int? webformatHeight,
    String? largeImageURL,
    String? imageURL,
    int? imageWidth,
    int? imageHeight,
    int? imageSize,
    int? views,
    int? downloads,
    int? likes,
    int? comments,
    int? collections,
    String? user,
    String? userImageURL,
  }) {
    return ImageModel(
      type: type ?? this.type,
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      pageURL: pageURL ?? this.pageURL,
      tags: tags ?? this.tags,
      previewURL: previewURL ?? this.previewURL,
      previewWidth: previewWidth ?? this.previewWidth,
      previewHeight: previewHeight ?? this.previewHeight,
      webformatURL: webformatURL ?? this.webformatURL,
      webformatWidth: webformatWidth ?? this.webformatWidth,
      webformatHeight: webformatHeight ?? this.webformatHeight,
      largeImageURL: largeImageURL ?? this.largeImageURL,
      imageURL: imageURL ?? this.imageURL,
      imageWidth: imageWidth ?? this.imageWidth,
      imageHeight: imageHeight ?? this.imageHeight,
      imageSize: imageSize ?? this.imageSize,
      views: views ?? this.views,
      downloads: downloads ?? this.downloads,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      collections: collections ?? this.collections,
      user: user ?? this.user,
      userImageURL: userImageURL ?? this.userImageURL,
    );
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
        type: json['type'],
        id: json['id'],
        user_id: json['user_id'],
        pageURL: json['pageURL'],
        tags: (json['tags'] as String)
            .split(',')
            .map((tag) => tag.trim())
            .toList(),
        previewURL: json['previewURL'],
        previewWidth: json['previewWidth'],
        previewHeight: json['previewHeight'],
        webformatURL: json['webformatURL'],
        webformatWidth: json['webformatWidth'],
        webformatHeight: json['webformatHeight'],
        largeImageURL: json['largeImageURL'],
        imageURL: json['imageURL'],
        imageWidth: json['imageWidth'],
        imageHeight: json['imageHeight'],
        imageSize: json['imageSize'],
        views: json['views'],
        downloads: json['downloads'],
        likes: json['likes'],
        comments: json['comments'],
        collections: json['collections'],
        user: json['user'],
        userImageURL: json['userImageURL']);
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'id': id,
      'user_id': user_id,
      'pageURL': pageURL,
      'tags': tags,
      'previewURL': previewURL,
      'previewWidth': previewWidth,
      'previewHeight': previewHeight,
      'webformatURL': webformatURL,
      'webformatWidth': webformatWidth,
      'webformatHeight': webformatHeight,
      'largeImageURL': largeImageURL,
      'imageURL': imageURL,
      'imageWidth': imageWidth,
      'imageHeight': imageHeight,
      'imageSize': imageSize,
      'views': views,
      'downloads': downloads,
      'likes': likes,
      'comments': comments,
      'collections': collections,
      'user': user,
      'userImageURL': userImageURL,
    };
  }

  @override
  List<Object?> get props => [
        type,
        id,
        user_id,
        pageURL,
        tags,
        previewURL,
        previewWidth,
        previewHeight,
        webformatURL,
        webformatWidth,
        webformatHeight,
        largeImageURL,
        imageURL,
        imageWidth,
        imageHeight,
        imageSize,
        views,
        downloads,
        likes,
        comments,
        collections,
        user,
        userImageURL,
      ];
}
