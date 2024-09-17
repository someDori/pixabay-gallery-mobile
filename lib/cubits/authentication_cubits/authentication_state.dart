import 'package:equatable/equatable.dart';

class MainAuthenticationState extends Equatable {
  const MainAuthenticationState();

  @override
  List<Object?> get props => [];
}

abstract class AuthenticationState extends Equatable {
  final MainAuthenticationState authenticationState;

  const AuthenticationState(this.authenticationState);

  @override
  List<Object?> get props => [authenticationState];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial() : super(const MainAuthenticationState());
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading(super.mainAuthState);
}

class AuthenticationAuthenticated extends AuthenticationState {
  final String message;
  final String userToken;

  const AuthenticationAuthenticated(
    super.mainAuthState,
    this.userToken,
    this.message,
  );
}

class AuthenticationUnauthenticated extends AuthenticationState {
  final String message;

  const AuthenticationUnauthenticated(
    super.mainAuthState,
    this.message,
  );
}

class AuthenticationError extends AuthenticationState {
  final String error;

  const AuthenticationError(super.mainAuthState, this.error);

  @override
  List<Object?> get props => [error];
}
