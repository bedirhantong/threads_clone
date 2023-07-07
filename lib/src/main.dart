import 'package:flutter/material.dart';
import 'package:threads_clone/src/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThreadsAppTheme.lightTheme,
      darkTheme: ThreadsAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const AppHome(),
    );
  }
}

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/threads.png',
          width: 50,
          height: 50,
        ),
        centerTitle: true,
        // backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Threads Clone App',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Image.asset(
              'assets/images/threads.png',
              cacheWidth: 80,
              cacheHeight: 80,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Start'),
            )
          ],
        ),
      ),
    );
  }
}
