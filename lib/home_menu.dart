import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'utils/constants/colors.dart';

import 'features/history/screens/history/history_screen.dart';
import 'features/home/screens/nearby/home_screen.dart';
import 'features/profile/screens/profile/profile_screen.dart';
import 'features/scan/screens/scan/scan_screen.dart';
import 'features/wallet/screens/wallet/wallet_screen.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppScreenController());

    return Scaffold(
      extendBody: true,
      body: Obx(() => controller.screens[controller.selectedMenu.value]),
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) =>
                  states.contains(MaterialState.selected)
                      ? const TextStyle(color: Color(0xff00ffff))
                      : const TextStyle(color: Colors.blue),
            ),
          ),
          child: NavigationBar(
            height: 80,
            animationDuration: const Duration(seconds: 3),
            selectedIndex: controller.selectedMenu.value,
            backgroundColor: EvxColors.darkPrimeryColor,
            elevation: 0,
            indicatorColor: EvxColors.darkPrimeryColor,
            onDestinationSelected: (index) =>
                controller.selectedMenu.value = index,
            destinations: const [
              NavigationDestination(
                icon: Image(
                  image: AssetImage('assets/icons/House, home, hut.png'),
                  height: 30,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Image(
                  image:
                      AssetImage('assets/icons/Battery, charging, power.png'),
                  height: 30,
                ),
                label: 'History',
              ),
              NavigationDestination(
                icon: Image(image: AssetImage('assets/splay.png')),
                label: 'Scan',
              ),
              NavigationDestination(
                icon: Image(
                  image: AssetImage('assets/icons/Wallet, save.png'),
                  height: 30,
                ),
                label: 'Wallet',
              ),
              NavigationDestination(
                icon: Image(
                  image: AssetImage(
                      'assets/icons/user, person, profile, block, account, circle.png'),
                  height: 30,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppScreenController extends GetxController {
  static AppScreenController get instance => Get.find();
  final Rx<int> selectedMenu = 0.obs;
  final screens = [
    /// -- Home
    const HomeScreen(),

    /// -- History
    const HistoryScreen(),

    /// -- Scan
    const ScanScreen(),

    /// -- Wallet
    const WalletScreen(),

    /// -- Profile
    const ProfileScreen(),
  ];
}
