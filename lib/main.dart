import 'package:flutter/material.dart';
import 'package:threads_clone/src/utils/theme/theme.dart';
import 'src/features/authentication/screens/on_boarding/app_home.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
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
