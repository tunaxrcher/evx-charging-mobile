import 'package:charging/data/repositories/profile/profile_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'data/repositories/authentication/authentication_repository.dart';

import 'package:charging/app.dart';

void main() async {
  /// -- Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage
  await GetStorage.init();

  /// -- Await Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// -- Initialize & Authentication Repository
  Get.put(AuthenticationRepository());
  Get.put(ProfileRepository());

  /// -- Main App Starts here...
  runApp(const App());
}
