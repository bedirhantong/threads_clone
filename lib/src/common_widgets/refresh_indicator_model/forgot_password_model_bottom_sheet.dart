import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import '../../features/authentication/screens/forget_password/forget_password_mail/forgot_password_mail.dart';
import '../../features/authentication/screens/forget_password/forget_password_options/forgot_password_btn_widget.dart';
import '../../features/authentication/screens/forget_password/forget_password_phone/forgot_password_phone.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              forgotPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: "E-mail",
              subtitle: resetViaEmail,
              onTap: () {
                Navigator.pop(context); //bottom sheetten öncekine döneriz
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordMailScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: "Phone",
              subtitle: resetViaPhone,
              onTap: () {
                Navigator.pop(context); //bottom sheetten öncekine döneriz
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPhoneScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
