import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_theme.dart';
import 'package:pixabay_gallery_mobile/constants/enums.dart';
import 'package:pixabay_gallery_mobile/constants/routes.dart';
import 'package:pixabay_gallery_mobile/cubits/authentication_cubits/authentication_cubit.dart';
import 'package:pixabay_gallery_mobile/cubits/authentication_cubits/authentication_state.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/application_bar/basic_app_bar.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/button/primary_button.dart';
import 'package:pixabay_gallery_mobile/utils/user_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _email;
  String? _age;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationUnauthenticated) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.of(context).pushReplacementNamed(loginScreenRoute);
          } else if (state is AuthenticationError) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthenticationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: AppSpacing.twelveAll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_email != null && _age != null) ...[
                  Text(
                    'Hello $_email',
                    style: headerTextStyle,
                  )
                ] else ...[
                  Text('Loading user data...', style: userDataTextStyle),
                ],
                const SizedBox(
                  height: AppSpacing.eight,
                ),
                PrimaryButton(
                  title: 'Log out',
                  disabled: false,
                  onPressed: () {
                    context.read<AuthenticationCubit>().logout();
                  },
                  buttonType: ButtonType.danger,
                ),
                const SizedBox(
                  height: AppSpacing.eight,
                ),
                PrimaryButton(
                  title: 'Delete account',
                  disabled: false,
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                  buttonType: ButtonType.danger,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userToken = prefs.getString('userToken');
    if (userToken != null) {
      final registeredUsers = prefs.getStringList('registeredUsers');
      if (registeredUsers != null) {
        for (String userData in registeredUsers) {
          final userMap = decodeUser(userData);
          if (userMap['userToken'] == userToken) {
            setState(() {
              _email = userMap['email'];
              _age = userMap['age'];
            });
            break;
          }
        }
      }
    }
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('Confirm Account Deletion'),
            content: const Text(
                'Are you sure you want to delete your account? This action cannot be undone.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
              ),
              TextButton(
                child: const Text('Delete'),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  context.read<AuthenticationCubit>().deleteAccount();
                },
              ),
            ],
          );
        },
      );
    } else {
      return showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return CupertinoAlertDialog(
            title: const Text('Confirm Account Deletion'),
            content: const Text(
                'Are you sure you want to delete your account? This action cannot be undone.'),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  context.read<AuthenticationCubit>().deleteAccount();
                },
                child: const Text('Delete'),
              ),
            ],
          );
        },
      );
    }
  }
}
