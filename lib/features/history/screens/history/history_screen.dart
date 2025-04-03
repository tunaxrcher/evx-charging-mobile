import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';

import '../../../../common/widgets/customwidget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/media.dart';
import '../../../../utils/constants/string.dart';

// import 'saved_screen.dart';
import 'package:charging/features/authentication/screens/signinsignup/signtab.dart';
import 'package:charging/features/profile/screens/profile/healp_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EvxColors.darkPrimeryColor,
      body: Stack(
        children: [
          Padding(padding: EdgeInsets.only(top: height / 20)),
          Padding(
            padding: EdgeInsets.only(left: width / 1.5, top: height / 10),
            child: SizedBox(
              height: height / 5,
              width: width / 2,
              child: Image.asset(
                'assets/flash.png',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height / 25),
                  Padding(
                    padding: EdgeInsets.only(top: height / 13),
                    child: Text(
                      'History (ref. EV LOGA)',
                      style: TextStyle(
                        color: EvxColors.darkblueColor,
                        fontFamily: 'Gilroy Bold',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 35),
                    child: Text(
                      '0 kWh',
                      style: TextStyle(
                        color: EvxColors.lightColor,
                        fontFamily: 'Gilroy Bold',
                        fontSize: height / 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 80),
                    child: Divider(
                      thickness: 2,
                      color: EvxColors.greydark,
                      endIndent: width / 2,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 140, left: width / 10),
                    child: Text(
                      EvxCustomStrings.km,
                      style: TextStyle(
                        color: EvxColors.lightColor,
                        fontSize: height / 35,
                        fontFamily: 'Gilroy Medium',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 30, top: height / 4),
            child: Image.asset(
              'assets/flash.png',
              height: height / 25,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 27, top: height / 3.4),
            child: Row(
              children: [
                Image.asset(
                  'assets/calendar.png',
                  height: height / 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 30, top: height / 80),
                  child: Text(
                    '2 hr 0 m',
                    style: TextStyle(
                      color: EvxColors.lightColor,
                      fontFamily: 'Gilroy Medium',
                      fontSize: height / 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
