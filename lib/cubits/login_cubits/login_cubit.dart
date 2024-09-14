import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_gallery_mobile/cubits/login_cubits/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  void emitInitialState() => emit(const LoginInitial());
}
