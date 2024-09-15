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

class AuthenticationUnauthenticated extends AuthenticationState {
  const AuthenticationUnauthenticated(super.mainAuthState);
}

class AuthenticationAuthenticated extends AuthenticationState {
  const AuthenticationAuthenticated(super.mainAuthState);
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading(super.mainAuthState);
}

class AuthenticationError extends AuthenticationState {
  final String error;

  const AuthenticationError(super.mainAuthState, this.error);
}
