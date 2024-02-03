import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/background_decoration.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';
import 'package:threads_clone/src/features/authentication/screens/login_screen/unofficial/login_screen.dart';
import 'package:threads_clone/src/utils/theme/theme.dart';
import 'src/features/authentication/screens/on_boarding/app_home.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(
          duration: const Duration(milliseconds: 6000),
          backgroundColor: Colors.white,
          showStatusBar: true,
          backgroundImageDecoration: const BackgroundImageDecoration(
            image: AssetImage('assets/images/threads_animation.gif'),
            fit: BoxFit.cover,
          ),
          done: Done(
            const MyApp(),
          ),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThreadsAppTheme.darkTheme,
      darkTheme: ThreadsAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      // home: const OnboardingFirst(),

      home: const LoginScreen(),
    );
  }
}
