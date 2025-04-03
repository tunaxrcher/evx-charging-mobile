import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/media.dart';

import 'widgets/user_helper_menu.dart';
import 'widgets/user_info.dart';
import 'widgets/user_list_setting.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EvxColors.darkPrimeryColor,
      body: Padding(
        padding: EdgeInsets.only(top: height / 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// -- User Info
              const UserInfo(),

              /// -- User List Setting
              const UserListSetting(),

              /// -- User Helper Menu
              const UserHelperMenu()
            ],
          ),
        ),
      ),
    );
  }
}
