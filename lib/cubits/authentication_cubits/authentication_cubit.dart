import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_gallery_mobile/cubits/authentication_cubits/authentication_state.dart';
import 'package:pixabay_gallery_mobile/utils/user_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationInitial());

  Future<void> checkAuthStatus() async {
    emit(AuthenticationLoading(state.authenticationState));
    try {
      final prefs = await SharedPreferences.getInstance();
      final userToken = prefs.getString('userToken');
      if (userToken != null) {
        emit(
          AuthenticationAuthenticated(
            state.authenticationState,
            userToken,
            'User is authenticated',
          ),
        );
      } else {
        emit(
          AuthenticationUnauthenticated(
            state.authenticationState,
            'Failed to authenticated',
          ),
        );
      }
    } catch (e) {
      emit(AuthenticationError(state.authenticationState,
          'Failed to check auth status: ${e.toString()}'));
    }
  }

  Future<void> login(String email, String password) async {
    emit(
      AuthenticationLoading(state.authenticationState),
    );
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String>? registeredUsers = prefs.getStringList('registeredUsers');

      if (registeredUsers == null || registeredUsers.isEmpty) {
        emit(
          AuthenticationError(
              state.authenticationState, 'No users are registered'),
        );
        return;
      }

      bool userFound = false;
      String? userToken;

      for (String userData in registeredUsers) {
        Map<String, dynamic> userMap = decodeUser(userData);

        if (userMap['email'] == email && userMap['password'] == password) {
          userFound = true;
          userToken = userMap['userToken'];
          break;
        }
      }

      if (userFound == false) {
        emit(AuthenticationError(
            state.authenticationState, 'Incorrect email or password'));
        return;
      }

      if (userToken != null) {
        await prefs.setString('userToken', userToken);

        emit(
          AuthenticationAuthenticated(
              state.authenticationState, userToken, 'Successfully logged in'),
        );
      }
    } catch (e) {
      emit(
        AuthenticationError(state.authenticationState, 'Couldn\'t log in: $e'),
      );
    }
  }

  Future<void> register(String email, String password, int age) async {
    emit(AuthenticationLoading(state.authenticationState));

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String>? registeredUsers =
          prefs.getStringList('registeredUsers') ?? [];

      bool userExists = registeredUsers.any((userData) {
        Map<String, dynamic> userMap = decodeUser(userData);
        return userMap['email'] == email;
      });

      if (userExists) {
        emit(AuthenticationError(
          state.authenticationState,
          'User with this email already exists',
        ));
        return;
      }

      final String userToken = 'mock_token_$email';

      Map<String, dynamic> newUser = {
        'email': email,
        'password': password,
        'age': age,
        'userToken': userToken,
      };

      registeredUsers.add(encodeUser(newUser));
      await prefs.setStringList('registeredUsers', registeredUsers);
      await prefs.setString('userToken', userToken);

      emit(
        AuthenticationAuthenticated(
            state.authenticationState, userToken, 'Successfully registered'),
      );
    } catch (e) {
      emit(
        AuthenticationError(
            state.authenticationState, 'Couldn\'t register: $e'),
      );
    }
  }

  Future<void> logout() async {
    emit(AuthenticationLoading(state.authenticationState));
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? userToken = prefs.getString('userToken');

      if (userToken != null) {
        prefs.remove(
          'userToken',
        );
      }

      if (prefs.getString('userToken') == null) {
        emit(AuthenticationUnauthenticated(
          state.authenticationState,
          'Successfully logged out',
        ));
      } else {
        emit(
          AuthenticationError(
            state.authenticationState,
            'Couldn\'t log out',
          ),
        );
      }
    } catch (e) {
      emit(
        AuthenticationError(state.authenticationState, 'Couldn\'t log out: $e'),
      );
    }
  }

  Future<void> deleteAccount() async {
    emit(AuthenticationLoading(state.authenticationState));
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? token = prefs.getString('userToken');
      final List<String>? users = prefs.getStringList('registeredUsers');

      if (users != null && token != null) {
        List<String> updatedUsers = users.where((user) {
          List<String> userDetails = user.split(',');
          Map<String, String> userMap = {};

          for (String detail in userDetails) {
            List<String> pair = detail.split(':');
            if (pair.length == 2) {
              userMap[pair[0]] = pair[1];
            }
          }

          return userMap['userToken'] != token;
        }).toList();

        await prefs.setStringList('registeredUsers', updatedUsers);
        prefs.remove('userToken');

        bool userRemoved = !updatedUsers.any((user) {
          Map<String, dynamic> userMap = decodeUser(user);
          return userMap['userToken'] == token;
        });

        bool tokenRemoved = prefs.getString('userToken') == null;

        if (userRemoved && tokenRemoved) {
          emit(AuthenticationUnauthenticated(
            state.authenticationState,
            'Successfully deleted account',
          ));
        } else {
          emit(AuthenticationError(
            state.authenticationState,
            'Couldn\'t delete account',
          ));
        }
      } else {
        emit(AuthenticationError(
          state.authenticationState,
          'No user found to delete',
        ));
      }
    } catch (e) {
      AuthenticationError(
        state.authenticationState,
        'Couldn\'t delete account: $e',
      );
    }
  }
}
