import 'package:flutter/material.dart';

import '../main_screen/main_screen.dart';

class OfficialLoginPage extends StatefulWidget {
  const OfficialLoginPage({super.key});

  @override
  State<OfficialLoginPage> createState() => _OfficialLoginPageState();
}

class _OfficialLoginPageState extends State<OfficialLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            const Expanded(
              child: Image(
                image: AssetImage('assets/images/welcome_images/login.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Expanded(
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xAB393939),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.popUntil(context, (route) => ); Main screen e kadar
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                  child: ListTile(
                    title: const Text(
                      'Log in with Instagram',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                    ),
                    subtitle: Row(
                      children: [
                        const Text(
                          'bedirhantng',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Image.asset('assets/icons/verified.png')
                      ],
                    ),
                    trailing: Image.asset('assets/images/logo/instagram.png'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
