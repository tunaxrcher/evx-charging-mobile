import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/media.dart';

class CreditScreen extends StatefulWidget {
  const CreditScreen({super.key});

  @override
  State<CreditScreen> createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List mony = [
      'N3200',
      'N1000',
      'N200 ',
      'N4590',
      'N980 ',
      'N2000',
      'N320 ',
      'N750 ',
      'N300 ',
      'N987 ',
      'N1240',
    ];
    List transection = [
      'Recharge',
      'Chrging',
      'pocket mony',
      'airtel belence',
      'charging',
      'Recharge',
      'Chrging',
      'pocket mony',
      'airtel belence',
      'charging',
      'pocket mony',
    ];
    List date = [
      '10/09/24',
      '15/09/24',
      '02/10/24',
      '05/10/24',
      '19/10/24',
      '25/10/24',
      '03/11/24',
      '16/11/24',
      '22/11/24',
      '05/12/24',
    ];

    return Scaffold(
      backgroundColor: EvxColors.darkPrimeryColor,
      body: Padding(
        padding: EdgeInsets.only(left: width / 30, right: width / 30),
        child: Container(
            height: height / 2,
            decoration: const BoxDecoration(),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 5.5),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: EvxColors.a,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: width / 1.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${transection[index]}',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy Medium',
                                      fontSize: 16,
                                      color: EvxColors.lightColor),
                                ),
                                Text(
                                  '${date[index]}',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy Medium',
                                      fontSize: 14,
                                      color: EvxColors.lightgreyColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text('${mony[index]}',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Gilroy Medium',
                              color: EvxColors.lightColor)),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }

// getdarkmodepreviousstate() async {
//   final prefs = await SharedPreferences.getInstance();
//   bool? previusstate = prefs.getBool("setIsDark");
//   if (previusstate == null) {
//     notifire.setIsDark = false;
//   } else {
//     notifire.setIsDark = previusstate;
//   }
// }
}
