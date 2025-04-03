import 'package:charging/features/authentication/controllers/register_controller.dart';
import 'package:charging/utils/popups/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/customwidget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/media.dart';
import '../../../../utils/constants/string.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;

  bool _validate_name = false;
  bool _validate_lasename = false;
  bool _validate_phone = false;
  bool _validate_password = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      backgroundColor: EvxColors.b,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 12),
            Padding(
              padding: EdgeInsets.only(left: width / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        EvxCustomStrings.createyour,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height / 25,
                          fontFamily: 'Gilroy Medium',
                        ),
                      ),
                      SizedBox(width: width / 80),
                      Text(
                        EvxCustomStrings.account_,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height / 25,
                          fontFamily: 'Gilroy Bold',
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: height / 80),
                  // Text(
                  //   EvxCustomStrings.information,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: height / 60,
                  //     fontFamily: 'Gilroy Medium',
                  //   ),
                  // ),
                  // SizedBox(height: height / 200),
                  // Text(
                  //   EvxCustomStrings.trips,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: height / 60,
                  //     fontFamily: 'Gilroy Medium',
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: height / 30),
            textFieldForm(
                hinttext: EvxCustomStrings.yourname,
                labeltxt: EvxCustomStrings.yourname,
                controller: controller.name,
                validator: _validate_name,
                types: TextInputType.text),
            SizedBox(height: height / 30),
            textFieldForm(
                hinttext: EvxCustomStrings.yourlastname,
                labeltxt: EvxCustomStrings.yourlastname,
                controller: controller.lastname,
                validator: _validate_lasename,
                types: TextInputType.text),
            SizedBox(height: height / 30),
            textFieldForm(
                hinttext: EvxCustomStrings.phone,
                labeltxt: EvxCustomStrings.phone,
                controller: controller.phone,
                validator: _validate_phone,
                types: TextInputType.number),
            SizedBox(height: height / 40),
            textFieldForm(
                hinttext: EvxCustomStrings.email,
                labeltxt: EvxCustomStrings.email,
                controller: controller.email,
                validator: false,
                types: TextInputType.emailAddress),
            SizedBox(height: height / 40),
            _buildPasswordTextField(controller.password, _validate_password),
            SizedBox(height: height / 40),
            appButton(
              onTap: () {
                setState(() {
                  if (controller.name.text.isEmpty) {
                    _validate_name = true;
                    _validate_lasename = false;
                    _validate_phone = false;
                    _validate_password = false;
                  } else if (controller.lastname.text.isEmpty) {
                    _validate_name = false;
                    _validate_lasename = true;
                    _validate_phone = false;
                    _validate_password = false;
                  } else if (controller.phone.text.isEmpty) {
                    _validate_name = false;
                    _validate_lasename = false;
                    _validate_phone = true;
                    _validate_password = false;
                  } else if (controller.password.text.isEmpty) {
                    _validate_name = false;
                    _validate_lasename = false;
                    _validate_phone = false;
                    _validate_password = true;
                  } else {
                    _validate_name = false;
                    _validate_lasename = false;
                    _validate_phone = false;
                    _validate_password = false;
                    EvxConfirmDalog.dialogboxConfirmRegister(context);
                  }
                });
              },
              clr: EvxColors.darkblueColor,
              title: EvxCustomStrings.signup2,
            ),
            SizedBox(height: height / 30),
          ],
        ),
      ),
    );
  }

  Widget textFieldForm({
    String? hinttext,
    String? labeltxt,
    TextEditingController? controller,
    validator,
    TextInputType? types,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      child: Container(
        height: height / 15,
        color: Colors.transparent,
        child: TextField(
          keyboardType: types,
          controller: controller,
          style: TextStyle(
            fontSize: height / 50,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            labelText: labeltxt,
            labelStyle: TextStyle(
                color: Colors.white.withOpacity(0.5), fontSize: height / 50),
            hintText: hinttext,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: height / 55,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            errorText: validator ? 'Can\'t be empty' : null,
          ),
        ),
      ),
    );
  }

  // ignore: no_leading_underscores_for_local_identifiers
  Widget _buildPasswordTextField(
      TextEditingController? controller, _validatePassword) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      child: Container(
        height: height / 15,
        color: Colors.transparent,
        child: TextField(
          keyboardType: TextInputType.text,
          controller: controller,
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
                        )),
            ),
            labelText: EvxCustomStrings.password,
            labelStyle: TextStyle(
                color: Colors.white.withOpacity(0.5), fontSize: height / 50),
            hintText: EvxCustomStrings.password,
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: height / 55,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            errorText: _validatePassword ? 'Can\'t be empty' : null,
          ),
        ),
      ),
    );
  }
}
