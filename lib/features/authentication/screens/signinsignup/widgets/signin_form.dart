import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../home_menu.dart';
import '../../../../../common/widgets/customwidget.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/media.dart';
import '../../../../../utils/constants/string.dart';
import '../../../controllers/login_controller.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          SizedBox(height: height / 30),

          /// Phone
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Container(
              height: height / 15,
              color: Colors.transparent,
              child: TextField(
                controller: controller.phone,
                style: TextStyle(
                  fontSize: height / 50,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(height / 50),
                  ),
                  labelText: EvxCustomStrings.phone,
                  labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: height / 50),
                  hintText: EvxCustomStrings.phone,
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: height / 55,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: height / 40),

          /// Password
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Container(
              height: height / 15,
              color: Colors.transparent,
              child: TextField(
                controller: controller.password,
                obscureText: _obscureText,
                style: TextStyle(
                  fontSize: height / 50,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(height / 50),
                    child: InkWell(
                      onTap: () {
                        _toggle();
                      },
                      child: _obscureText
                          ? Image.asset(
                              "assets/eye.png",
                              height: height / 100,
                            )
                          : const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  labelText: EvxCustomStrings.password,
                  labelStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: height / 50,
                  ),
                  hintText: EvxCustomStrings.password,
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: height / 55,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: height / 40),

          /// Sign In Button
          SizedBox(height: height / 40),
          appButton(
            onTap: () {
              controller.phoneAndPasswordSignIn();
            },
            clr: EvxColors.darkblueColor,
            title: EvxCustomStrings.signin2,
          ),
          SizedBox(height: height / 40),

          /// Create Account Button
          Text(
            "Or",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontFamily: 'Gilroy Medium',
              fontSize: height / 50,
            ),
          ),
          SizedBox(height: height / 40),
          _buildSocialLogin(),
        ],
      ),
    );
  }

  //
  // Widget _buildPasswordTextField() {
  //   return ;
  // }

  Widget _buildSocialLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: height / 13,
            width: width / 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF5F7F9),
            ),
            child: Padding(
              padding: EdgeInsets.all(height / 40),
              child: Image.asset("assets/google.png"),
            ),
          ),
          Container(
            height: height / 13,
            width: width / 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF5F7F9),
            ),
            child: Padding(
              padding: EdgeInsets.all(height / 40),
              child: Image.asset("assets/facebook.png"),
            ),
          ),
          Container(
            height: height / 13,
            width: width / 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF5F7F9),
            ),
            child: Padding(
              padding: EdgeInsets.all(height / 40),
              child: Image.asset("assets/apple.png"),
            ),
          ),
        ],
      ),
    );
  }
}
