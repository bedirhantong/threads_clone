import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/background_decoration.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';
import 'package:threads_clone/src/utils/theme/theme.dart';
import 'src/features/authentication/screens/on_boarding/app_home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(
        showStatusBar: true,
        backgroundImageDecoration: const BackgroundImageDecoration(
          image: AssetImage('assets/images/welcome_images/login.png'),
          fit: BoxFit.cover,
        ),
        logo: const Image(
          image: AssetImage('assets/images/threads.png'),
          height: 150,
          width: 150,
        ),
        loadingIndicator: const CupertinoActivityIndicator(),
        done: Done(
          const MyApp(),
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
      home: const AppHome(),
    );
  }
}
