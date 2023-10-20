import 'package:flutter/material.dart';
import 'package:threads_clone/src/features/authentication/objects/user.dart';
import 'package:threads_clone/src/features/authentication/objects/users.dart';

import '../../login_screen/unofficial/login_screen.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  String name = "";
  String email = "";
  String password = "";
  String phoneNumber = "";

  late User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Full Name"),
                hintText: "Your Full Name",
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              onChanged: (value) {
                name = value;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("E-mail"),
                hintText: "E-mail",
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Phone no"),
                hintText: "Phone no",
                prefixIcon: Icon(Icons.numbers),
              ),
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Password"),
                hintText: "Password",
                prefixIcon: Icon(Icons.fingerprint),
              ),
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  user = User(
                      name: name,
                      email: email,
                      password: password,
                      phoneNumber: phoneNumber,
                      bio: '');

                  Users.list.add(user);

                  Users.users.putIfAbsent(
                    name,
                    () => user,
                  );
                  Users.usersD.putIfAbsent(email, () => user);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  "Signup".toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
