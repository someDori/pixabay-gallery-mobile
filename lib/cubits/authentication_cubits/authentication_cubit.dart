import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_gallery_mobile/cubits/authentication_cubits/authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationInitial());

  Future<void> authenticateUser() async {
    try {
      emit(
        AuthenticationAuthenticated(state.authenticationState),
      );
    } catch (_) {
      emit(
        AuthenticationUnauthenticated(state.authenticationState),
      );
    }
  }
}
