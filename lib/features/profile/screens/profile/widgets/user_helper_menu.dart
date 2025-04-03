import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/media.dart';
import '../../../../../utils/constants/string.dart';
import '../../../controllers/profile_controller.dart';
import '../healp_screen.dart';
import '../saved_screen.dart';

class UserHelperMenu extends StatefulWidget {
  const UserHelperMenu({super.key});

  @override
  State<UserHelperMenu> createState() => _UserHelperMenuState();
}

class _UserHelperMenuState extends State<UserHelperMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: height / 40, bottom: height / 40),
          child: Container(
            height: height / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: EvxColors.a,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// -- Help
                InkWell(
                  onTap: () => Get.to(() => const HealpScreen()),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 20),
                        child: Image.asset(
                          'assets/icons/Warning, circe.png',
                          height: height / 30,
                        ),
                      ),
                      SizedBox(width: width / 25),
                      SizedBox(
                        width: width / 1.7,
                        child: Text(
                          EvxCustomStrings.help,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Gilroy Medium',
                            color: EvxColors.lightColor,
                          ),
                        ),
                      ),
                      SizedBox(width: width / 25.3),
                      Icon(Icons.navigate_next_rounded,
                          size: width / 10, color: EvxColors.lightColor),
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
}
