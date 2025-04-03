import 'package:charging/features/profile/controllers/profile_controller.dart';
import 'package:charging/utils/popups/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../common/widgets/customwidget.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/media.dart';
import '../../../../../utils/constants/string.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController no = TextEditingController();

  final localStorage = GetStorage();
  late String _username;
  late String _email;

  @override
  void initState() {
    _username = localStorage.read('username') ?? '';
    _email = localStorage.read('email') ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: height / 40),
          child: Container(
            height: height / 8,
            decoration: BoxDecoration(
              color: EvxColors.a,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  _EditProfile();
                });
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 30),
                    child: CircleAvatar(
                      radius: width / 11,
                      backgroundImage: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv4fIuAZe1-UYch4QF0cKuPlpiE1dBdJxagAV-MVrnbg&s'),
                    ),
                  ),
                  SizedBox(width: width / 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width / 2,
                        child: Text(
                          _username,
                          style: TextStyle(
                            fontFamily: 'Gilroy Medium',
                            fontSize: 20,
                            color: EvxColors.lightColor,
                          ),
                        ),
                      ),
                      SizedBox(height: height / 100),
                      Text(
                        _email,
                        style: TextStyle(
                          fontFamily: 'Gilroy Medium',
                          fontSize: 15,
                          color: EvxColors.greydark,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: width / 30),
                  Icon(
                    Icons.navigate_next_sharp,
                    size: width / 10,
                    color: EvxColors.lightColor,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _EditProfile() {
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
                            EvxConfirmDalog.dialogboxConfirmInfo(context);
                            //  controller.updateProfile();
                            // Navigator.pop(context);
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
                                child: Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Gilroy Bold',
                                fontSize: width / 20,
                              ),
                            )),
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
                                'Edit Profile',
                                style: TextStyle(
                                  color: EvxColors.lightColor,
                                  fontFamily: 'Gilroy Medium',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Text(
                              "Name",
                              style: TextStyle(
                                fontFamily: "Gilroy Bold",
                                fontSize: 16,
                                color: EvxColors.lightColor,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            textfield(
                              tclr: EvxColors.lightColor,
                              controller: controller.name,
                              feildcolor: EvxColors.a,
                              labelcolor: EvxColors.darkPrimeryColor,
                              suffix: null,
                              obscureText: false,
                              text: "Enter your Name",
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              "Lastname",
                              style: TextStyle(
                                fontFamily: "Gilroy Bold",
                                fontSize: 16,
                                color: EvxColors.lightColor,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            textfield(
                              tclr: EvxColors.lightColor,
                              controller: controller.lastName,
                              feildcolor: EvxColors.a,
                              labelcolor: EvxColors.darkPrimeryColor,
                              suffix: null,
                              obscureText: false,
                              text: "Enter your Lastame",
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              "Email Address",
                              style: TextStyle(
                                fontFamily: "Gilroy Bold",
                                fontSize: 16,
                                color: EvxColors.lightColor,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            textfield(
                              tclr: EvxColors.lightColor,
                              controller: controller.email,
                              feildcolor: EvxColors.a,
                              labelcolor: EvxColors.darkPrimeryColor,
                              suffix: null,
                              obscureText: false,
                              text: "Enter your Email Address",
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              "Mobile ",
                              style: TextStyle(
                                fontFamily: "Gilroy Bold",
                                fontSize: 16,
                                color: EvxColors.lightColor,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Padding(
                              padding: EdgeInsets.only(bottom: height / 12),
                              child: textfield(
                                tclr: EvxColors.darkblueColor,
                                controller: controller.no,
                                feildcolor: EvxColors.a,
                                labelcolor: EvxColors.darkPrimeryColor,
                                suffix: null,
                                obscureText: false,
                                text: "Enter Mobile Number",
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
    );
  }
}
