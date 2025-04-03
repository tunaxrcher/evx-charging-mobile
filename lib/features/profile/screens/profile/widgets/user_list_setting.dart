// import 'package:charging/common/widgets/customwidget.dart';
import 'package:charging/utils/popups/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/media.dart';
import '../../../../../utils/constants/string.dart';
import '../../../controllers/profile_controller.dart';
import '../saved_screen.dart';

class UserListSetting extends StatefulWidget {
  const UserListSetting({super.key});

  @override
  State<UserListSetting> createState() => _UserListSettingState();
}

class _UserListSettingState extends State<UserListSetting> {
  bool _obscureTextNew = true;
  bool _obscureTextOld = true;
  bool _obscureTextConf = true;
  bool _validateOld = false;
  bool _validateNew = false;
  bool _validateConfNew = false;

  final controller = Get.put(ProfileController());

  void _toggleOldPass() {
    _obscureTextOld = !_obscureTextOld;
  }

  void _toggleNewPass() {
    _obscureTextNew = !_obscureTextNew;
  }

  void _togglePassConf() {
    _obscureTextConf = !_obscureTextConf;
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: height / 40),
          child: Container(
            height: height / 4,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: EvxColors.a,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// -- Favorites
                InkWell(
                  onTap: () => Get.to(() => const SavedScreen()),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 20),
                        child: Image.asset(
                          'assets/icons/Star, rating, favorites, like, half.png',
                          height: height / 30,
                        ),
                      ),
                      SizedBox(width: width / 25),
                      SizedBox(
                        width: width / 1.65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Favorites',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Gilroy Medium',
                                color: EvxColors.lightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: width / 37),
                      InkWell(
                        onTap: () {
                          // setState(() {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const saved()),
                          //   );
                          // });
                        },
                        child: Icon(
                          Icons.navigate_next,
                          size: width / 10,
                          color: EvxColors.lightColor,
                        ),
                      ),
                      SizedBox(width: width / 30),
                    ],
                  ),
                ),

                /// -- RFID Cards
                InkWell(
                  onTap: () {
                    AlertDialog alert = AlertDialog(
                      title: Text('Development'),
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 20),
                        child: Image.asset(
                          'assets/icons/Receipt, bill, invoice.png',
                          height: height / 30,
                        ),
                      ),
                      SizedBox(width: width / 25),
                      SizedBox(
                        width: width / 1.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'RFID Cards',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Gilroy Medium',
                                color: EvxColors.lightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: width / 25.3),
                      InkWell(
                        onTap: () {
                          // TODO:: HANDLE
                        },
                        child: Icon(
                          Icons.navigate_next,
                          size: width / 10,
                          color: EvxColors.lightColor,
                        ),
                      ),
                      SizedBox(width: width / 30),
                    ],
                  ),
                ),

                //Change password
                InkWell(
                  onTap: () {
                    changePasswordForm();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 20),
                        child: Image.asset(
                          'assets/icons/reset password.png',
                          height: height / 30,
                        ),
                      ),
                      SizedBox(width: width / 25),
                      SizedBox(
                        width: width / 1.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              EvxCustomStrings.ChangePassword,
                              style: TextStyle(
                                fontSize: 20,
                                color: EvxColors.lightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: width / 25.3),
                      InkWell(
                        onTap: () {
                          changePasswordForm();
                        },
                        child: Icon(
                          Icons.navigate_next,
                          size: width / 10,
                          color: EvxColors.lightColor,
                        ),
                      ),
                      SizedBox(width: width / 30),
                    ],
                  ),
                ),

                /// -- Logout
                InkWell(
                  onTap: () => EvxConfirmDalog.dialogboxConfirmLogout(context),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 20),
                        child: Image.asset(
                          'assets/icons/Log, out, sign.png',
                          height: height / 30,
                        ),
                      ),
                      SizedBox(width: width / 25),
                      SizedBox(
                        width: width / 1.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              EvxCustomStrings.Logout,
                              style: TextStyle(
                                fontSize: 20,
                                color: EvxColors.lightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: width / 25.3),
                      InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Icon(
                          Icons.navigate_next,
                          size: width / 10,
                          color: EvxColors.lightColor,
                        ),
                      ),
                      SizedBox(width: width / 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  changePasswordForm() {
    final controller = Get.put(ProfileController());
    return showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              // ignore: sized_box_for_whitespace
              child: Container(
                decoration: BoxDecoration(
                  color: EvxColors.darkPrimeryColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                height: height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () => setState(
                          () {
                            if (controller.oldpassword.text.isEmpty) {
                              _validateOld = true;
                              _validateNew = false;
                              _validateConfNew = false;
                            } else if (controller.newpassword.text.isEmpty) {
                              _validateOld = false;
                              _validateNew = true;
                              _validateConfNew = false;
                            } else if (controller
                                .confnewpassword.text.isEmpty) {
                              _validateOld = false;
                              _validateNew = false;
                              _validateConfNew = true;
                            } else if (controller.newpassword.text.trim() !=
                                controller.confnewpassword.text.trim()) {
                              EvxConfirmDalog.dialogboxPassNewNotMatch(context);
                            } else {
                              EvxConfirmDalog.dialogboxConfirmChangePassword(
                                  context);
                              _validateOld = false;
                              _validateNew = false;
                              _validateConfNew = false;
                            }
                          },
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: height / 15,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.lightBlueAccent,
                                  Colors.cyanAccent,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 54,
                                    child: Icon(Icons.published_with_changes),
                                  ),
                                  Text(
                                    'Change Password',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Gilroy Bold',
                                      fontSize: width / 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Center(
                              child: Text(
                                'Change Password',
                                style: TextStyle(
                                  color: EvxColors.lightColor,
                                  fontFamily: 'Gilroy Medium',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Text(
                              "Old Password",
                              style: TextStyle(
                                fontFamily: "Gilroy Bold",
                                fontSize: 16,
                                color: EvxColors.lightColor,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            textfieldPassOld(
                                tclr: EvxColors.lightColor,
                                controller: controller.oldpassword,
                                feildcolor: EvxColors.a,
                                labelcolor: EvxColors.darkPrimeryColor,
                                suffix: null,
                                text: "Enter Old Password",
                                func: InkWell(
                                  onTap: () => setState(
                                    () {
                                      _toggleOldPass();
                                    },
                                  ),
                                  child: _obscureTextOld
                                      ? Image.asset(
                                          "assets/eye.png",
                                          height: height / 100,
                                        )
                                      : const Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Colors.grey,
                                        ),
                                )),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              "New Password",
                              style: TextStyle(
                                fontFamily: "Gilroy Bold",
                                fontSize: 16,
                                color: EvxColors.lightColor,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            textfieldPassNew(
                              tclr: EvxColors.lightColor,
                              controller: controller.newpassword,
                              feildcolor: EvxColors.a,
                              labelcolor: EvxColors.darkPrimeryColor,
                              suffix: null,
                              text: "Enter New Password",
                              func: InkWell(
                                onTap: () => setState(
                                  () {
                                    _toggleNewPass();
                                  },
                                ),
                                child: _obscureTextNew
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
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              "Confirm New Password",
                              style: TextStyle(
                                fontFamily: "Gilroy Bold",
                                fontSize: 16,
                                color: EvxColors.lightColor,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            textfieldPassConf(
                              tclr: EvxColors.lightColor,
                              controller: controller.confnewpassword,
                              feildcolor: EvxColors.a,
                              labelcolor: EvxColors.darkPrimeryColor,
                              suffix: null,
                              text: "Enter Confirm New Password",
                              func: InkWell(
                                onTap: () => setState(
                                  () {
                                    _togglePassConf();
                                  },
                                ),
                                child: _obscureTextConf
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      _obscureTextOld = true;
      _obscureTextNew = true;
      _obscureTextConf = true;
      _validateConfNew = false;
      _validateNew = false;
      _validateOld = false;
      controller.oldpassword.text = '';
      controller.newpassword.text = '';
      controller.confnewpassword.text = '';
    });
  }

  textfieldPassOld(
      {String? text,
      suffix,
      Color? labelcolor,
      feildcolor,
      Color? tclr,
      double? Width,
      TextEditingController? controller,
      Height,
      func}) {
    var textVal = '';
    return Container(
        height: Height,
        width: Width,
        padding: const EdgeInsets.symmetric(vertical: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: feildcolor,
        ),
        child: TextField(
          style: TextStyle(color: tclr),
          controller: controller,
          obscureText: _obscureTextOld,
          decoration: InputDecoration(
            suffixIcon:
                Padding(padding: EdgeInsets.all(height / 50), child: func),
            labelText: text,
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontFamily: "Gilroy Medium",
              fontSize: 15,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            errorText: _validateOld ? 'Can\'t be empty' : null,
          ),
        ));
  }

  textfieldPassNew(
      {String? text,
      suffix,
      Color? labelcolor,
      feildcolor,
      Color? tclr,
      double? Width,
      TextEditingController? controller,
      Height,
      func}) {
    return Container(
        height: Height,
        width: Width,
        padding: const EdgeInsets.symmetric(vertical: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: feildcolor,
        ),
        child: TextField(
          style: TextStyle(color: tclr),
          controller: controller,
          obscureText: _obscureTextNew,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.all(height / 50),
              child: func,
            ),
            labelText: text,
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontFamily: "Gilroy Medium",
              fontSize: 15,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            errorText: _validateNew ? 'Can\'t be empty' : null,
          ),
        ));
  }

  textfieldPassConf(
      {String? text,
      suffix,
      Color? labelcolor,
      feildcolor,
      Color? tclr,
      double? Width,
      TextEditingController? controller,
      Height,
      func}) {
    return Container(
        height: Height,
        width: Width,
        padding: const EdgeInsets.symmetric(vertical: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: feildcolor,
        ),
        child: TextField(
          style: TextStyle(color: tclr),
          controller: controller,
          obscureText: _obscureTextConf,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.all(height / 50),
              child: func,
            ),
            labelText: text,
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontFamily: "Gilroy Medium",
              fontSize: 15,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            errorText: _validateConfNew ? 'Can\'t be empty' : null,
          ),
        ));
  }
}
