part of 'pixabay_model.dart';

class ImagesModel extends Equatable {
  final int? total;
  final int? totalHits;
  final List<ImageModel>? hits;

  const ImagesModel({
    this.total,
    this.totalHits,
    this.hits,
  });

  ImagesModel copyWith({
    int? total,
    int? totalHits,
    List<ImageModel>? hits,
  }) =>
      ImagesModel(
        total: total ?? this.total,
        totalHits: totalHits ?? this.totalHits,
        hits: hits ?? this.hits,
      );

  Map<String, dynamic> toMap() => {
        'total': total,
        'totalHits': totalHits,
        'hits': hits?.map((hit) => hit.toMap()).toList(),
      };

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    var hitsJson = json['hits'] as List? ?? [];
    List<ImageModel> imageList =
        hitsJson.map((imageJson) => ImageModel.fromJson(imageJson)).toList();

    return ImagesModel(
      total: json['total'] as int?,
      totalHits: json['totalHits'] as int?,
      hits: imageList.isNotEmpty ? imageList : null,
    );
  }

  @override
  List<Object?> get props => [
        total,
        totalHits,
        hits,
      ];
}
