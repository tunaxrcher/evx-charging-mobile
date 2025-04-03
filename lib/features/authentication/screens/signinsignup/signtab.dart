import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/media.dart';
import '../../../../utils/constants/string.dart';

import 'package:charging/features/authentication/screens/signinsignup/signin.dart';
import 'package:charging/features/authentication/screens/signinsignup/signup.dart';

class SignTab extends StatefulWidget {
  const SignTab({super.key});

  @override
  State<SignTab> createState() => _SignTabState();
}

class _SignTabState extends State<SignTab> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      const SignIn(),
      const SignUp(),
    ];

    return Scaffold(
      backgroundColor: EvxColors.b,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 20),
            Container(
              alignment: Alignment.centerLeft,
              height: height / 1.053,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.transparent,
                        height: height / 15,
                        width: width / 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            labelStyle:
                                const TextStyle(fontFamily: 'Gilroy_Bold'),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.white,
                            dividerColor: Colors.transparent,
                            controller: controller,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(
                                child: Text(
                                  EvxCustomStrings.signin,
                                  style: TextStyle(
                                    fontFamily: 'Gilroy Bold',
                                    fontSize: height / 50,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  EvxCustomStrings.signup,
                                  style: TextStyle(
                                    fontFamily: 'Gilroy Bold',
                                    fontSize: height / 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller,
                      children: tabs.map((tab) => tab).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
