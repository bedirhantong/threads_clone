import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<bool> isButtonSelectedList = [false, false, false, false];
  List<Color> buttonBackgroundColors = [
    Colors.black87,
    Colors.black87,
    Colors.black87,
    Colors.black87,
  ];
  List<Color> buttonTextColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  List<Color> buttonBorderColors = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Activity',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(110.0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: BorderSide(
                          color: buttonBorderColors[0],
                        ),
                        backgroundColor: buttonBackgroundColors[0],
                      ),
                      onPressed: () {
                        changeButtonAppearance(0);
                      },
                      child: Text(
                        'All',
                        style: TextStyle(color: buttonTextColors[0]),
                      ),
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(110.0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: BorderSide(
                          color: buttonBorderColors[1],
                        ),
                        backgroundColor: buttonBackgroundColors[1],
                      ),
                      onPressed: () {
                        changeButtonAppearance(1);
                      },
                      child: Text(
                        'Requests',
                        style: TextStyle(color: buttonTextColors[1]),
                      ),
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(110.0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: BorderSide(
                          color: buttonBorderColors[2],
                        ),
                        backgroundColor: buttonBackgroundColors[2],
                      ),
                      onPressed: () {
                        changeButtonAppearance(2);
                      },
                      child: Text(
                        'Replies',
                        style: TextStyle(color: buttonTextColors[2]),
                      ),
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(110.0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: BorderSide(
                          color: buttonBorderColors[3],
                        ),
                        backgroundColor: buttonBackgroundColors[3],
                      ),
                      onPressed: () {
                        changeButtonAppearance(3);
                      },
                      child: Text(
                        'Mentions',
                        style: TextStyle(color: buttonTextColors[3]),
                      ),
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                  ],
                ),
              ),
              Column(
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    changeButtonAppearance(0); // Select the "All" button initially
    super.initState();
  }

  void changeButtonAppearance(int index) {
    setState(() {
      for (int i = 0; i < isButtonSelectedList.length; i++) {
        if (i == index) {
          isButtonSelectedList[i] = true;
          buttonBackgroundColors[i] = Colors.white;
          buttonTextColors[i] = Colors.black;
          buttonBorderColors[i] = Colors.white;
        } else {
          isButtonSelectedList[i] = false;
          buttonBackgroundColors[i] = Colors.black87;
          buttonTextColors[i] = Colors.white;
          buttonBorderColors[i] = Colors.grey;
        }
      }
    });
  }
}
