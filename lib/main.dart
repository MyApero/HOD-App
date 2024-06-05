import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/common/error_screen.dart';
import 'package:hod_app/common/loading_screen.dart';
import 'package:hod_app/features/auth/controller/auth_controller.dart';
import 'package:hod_app/features/auth/screens/register.dart';
import 'package:hod_app/features/navigation/view/navigation.dart';
import 'package:hod_app/theme/theme.dart';

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
        // home: TestScreen(),
        home: ref.watch(currentUserProvider).when(
              data: (user) {
                if (user != null) {
                  return NavigationScreen();
                }
                return const RegisterScreen();
              },
              error: (error, st) => ErrorScreen(
                errorMessage: error.toString(),
              ),
              loading: () => const LoadingScreen(),
            )
        );
  }
}
