import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'bindings/general_bindings.dart';
import 'routes/app_routes.dart';

import 'package:charging/utils/constants/media.dart';

import 'package:charging/features/authentication/screens/signinsignup/signtab.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        dividerColor: Colors.transparent,
      ),
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const SignTab(),
    );
  }
}
