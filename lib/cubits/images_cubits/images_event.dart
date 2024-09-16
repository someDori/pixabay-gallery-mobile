import 'package:equatable/equatable.dart';

abstract class ImagesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchImages extends ImagesEvent {
  final String token;
  final Map<String, dynamic>? messageBody;

  FetchImages(this.token, {this.messageBody});

  @override
  List<Object?> get props => [token, messageBody];
}
