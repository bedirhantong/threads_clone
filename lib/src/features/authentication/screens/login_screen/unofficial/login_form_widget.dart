import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads_clone/src/features/authentication/view_model/app_starter.dart';
import '../../../../../common_widgets/refresh_indicator_model/forgot_password_model_bottom_sheet.dart';
import '../../../../../core/base/state/base_state.dart';
import '../../../../../core/base/view/base_view.dart';
import '../../main_screen/main_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends BaseState<LoginForm> {
  bool _isPasswordVisible = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late WidgetRef ref;
  late AppStarter userViewModel;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Widget _buildSuffixIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
      icon: _isPasswordVisible
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      onModelReady: (model) {
        ref = model;
      },
      onPageBuilder: (context, value) {
        userViewModel = ref.watch(userViewModelProvider);
        return form;
      },
    );
  }

  Widget get form => Form(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: "E-mail",
                  hintText: "E-mail",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: !_isPasswordVisible,
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: "Password",
                  hintText: "Password",
                  border: const OutlineInputBorder(),
                  suffixIcon: _buildSuffixIcon(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ForgotPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    var isUserExist = AppStarter.users
                        .containsKey(emailController.text.toString());
                    var user =
                        AppStarter.users[emailController.text.toString()];

                    if (isUserExist) {
                      if (passwordController.text.toString() ==
                          user!.password.toString()) {
                        ref.read(userViewModelProvider).changeCurrentUser(user);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(
                              user: user,
                            ),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Hata'),
                              content: const Text(
                                  'E-posta veya şifre yanlış. Veya öyle bir hesap bulunamadı'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Kapat'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                    if (emailController.text.toString() == '' ||
                        passwordController.text.toString() == '') {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Hata'),
                            content: const Text(
                                'E-posta veya şifre alanını boş bırakmayınız'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Kapat'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    'Login'.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
// @override
// Widget build(BuildContext context) {
//   String email = "";
//   String password = "";
//
//   return Form(
//     child: Container(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Icons.person_outline_outlined),
//               labelText: "E-mail",
//               hintText: "E-mail",
//               border: OutlineInputBorder(),
//             ),
//             onChanged: (value) {
//               email = value;
//             },
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           TextFormField(
//             obscureText: !_isPasswordVisible,
//             decoration: InputDecoration(
//               prefixIcon: const Icon(Icons.fingerprint),
//               labelText: "Password",
//               hintText: "Password",
//               border: const OutlineInputBorder(),
//               suffixIcon: _buildSuffixIcon(),
//             ),
//             onChanged: (value) {
//               password = value;
//             },
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: TextButton(
//               onPressed: () {
//                 ForgotPasswordScreen.buildShowModalBottomSheet(context);
//               },
//               child: const Text(
//                 'Forget Password?',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 var isUserExist = AppStarter.users.containsKey(email);
//                 var user = AppStarter.users[email];
//
//                 if (isUserExist) {
//                   if (password == user!.password) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MainScreen(
//                           user: user,
//                         ),
//                       ),
//                     );
//                   } else {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: const Text('Hata'),
//                           content: const Text(
//                               'E-posta veya şifre yanlış. Veya öyle bir hesap bulunamadı'),
//                           actions: <Widget>[
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text('Kapat'),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   }
//                 }
//
//                 // if (password == user!.password) {
//                 //   Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => MainScreen(
//                 //       user: user,
//                 //     ),
//                 //   ),
//                 // );
//                 // }
//                 if (email == '' || password == '') {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text('Hata'),
//                         content: const Text(
//                             'E-posta veya şifre alanını boş bırakmayınız'),
//                         actions: <Widget>[
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: const Text('Kapat'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//
//                 // else {
//                 //   showDialog(
//                 //     context: context,
//                 //     builder: (BuildContext context) {
//                 //       return AlertDialog(
//                 //         title: const Text('Hata'),
//                 //         content: const Text(
//                 //             'E-posta veya şifre yanlış. Veya öyle bir hesap bulunamadı'),
//                 //         actions: <Widget>[
//                 //           TextButton(
//                 //             onPressed: () {
//                 //               Navigator.of(context).pop();
//                 //             },
//                 //             child: const Text('Kapat'),
//                 //           ),
//                 //         ],
//                 //       );
//                 //     },
//                 //   );
//                 // }
//               },
//               child: Text(
//                 'Login'.toUpperCase(),
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
}
