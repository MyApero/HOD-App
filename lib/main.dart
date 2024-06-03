import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/common/error_screen.dart';
import 'package:hod_app/common/loading_screen.dart';
import 'package:hod_app/core/providers.dart';
import 'package:hod_app/features/auth/controller/auth_controller.dart';
import 'package:hod_app/features/auth/view/login.dart';
import 'package:hod_app/features/auth/view/register.dart';
import 'package:hod_app/features/home/view/home.dart';
import 'package:hod_app/features/onboarding/onboarding_screen.dart';
import 'package:hod_app/theme/theme.dart';
import 'package:hod_app/tests/background_test.dart';
import 'package:hod_app/tests/test_screen.dart';
import 'package:hod_app/tests/theme_screen.dart';
import 'package:hod_app/tests/FlexTest.dart';
import 'package:hod_app/widgets/background/app_background.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/background/nice/nice_background.dart';
import 'package:hod_app/widgets/loader.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'HOD App',
        debugShowCheckedModeBanner: false,
        theme: theme,
        // home: AppScaffold(pages: _pages),
        home: TestScreen(),
        
        // home: ref.watch(currentUserProvider).when(
        //       data: (user) {
        //         if (user != null) {
        //           return HomeScreen();
        //         }
        //         return const RegisterScreen();
        //       },
        //       error: (error, st) => ErrorScreen(
        //         errorMessage: error.toString(),
        //       ),
        //       loading: () => const LoadingScreen(),
        //     )

        );
  }
}
