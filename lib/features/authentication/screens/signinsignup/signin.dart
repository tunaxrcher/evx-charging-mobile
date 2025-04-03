import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

import 'widgets/signin_form.dart';
import 'widgets/signin_header.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EvxColors.b,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const SigninHeader(),

            /// Form
            const SigninForm(),
          ],
        ),
      ),
    );
  }
}
