import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/widgets/customwidget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/media.dart';

import 'credit_screen.dart';
import 'debit_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  TextEditingController add = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tab = [
      const CreditScreen(),
      const DebitScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          setState(() {
            addm();
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
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
              'Add money',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Gilroy Bold',
                  fontSize: width / 20),
            )),
          ),
        ),
      ),
      backgroundColor: EvxColors.darkPrimeryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: height / 20)),
          Center(
            child: Padding(
                padding: EdgeInsets.only(top: height / 30),
                child: Image.asset(
                  "assets/splay.png",
                  scale: 4,
                )),
          ),
          SizedBox(height: height / 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current Balance:',
                style: TextStyle(
                  fontSize: width / 20,
                  color: EvxColors.darkblueColor,
                ),
              ),
              Text(
                '10,000.00',
                style: TextStyle(
                  fontSize: width / 20,
                  color: EvxColors.lightColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 30, top: 20),
            child: Text(
              'Transaction history :',
              style: TextStyle(
                fontSize: width / 20,
                color: EvxColors.lightColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width / 30, right: width / 30, top: height / 80),
            child: Container(
              height: height / 18,
              width: double.infinity,
              decoration: BoxDecoration(
                color: EvxColors.a,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                controller: controller,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  color: Colors.blue,
                ),
                labelColor: Colors.white,
                dividerColor: Colors.transparent,
                unselectedLabelColor: EvxColors.lightColor,
                indicatorColor: EvxColors.darkblueColor,
                labelStyle: const TextStyle(fontFamily: 'Gilroy_Bold'),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.all(3),
                tabs: const [
                  Tab(
                    child: Text(
                      'Credit',
                      style: TextStyle(fontFamily: 'Gilroy bold', fontSize: 18),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Debit',
                      style: TextStyle(fontFamily: 'Gilroy bold', fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: height / 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TabBarView(
                  controller: controller,
                  children: tab.map((tab) => tab).toList(),
                ),
              ),
            ),
          )
        ],
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

  addm() {
    return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    decoration:
                        BoxDecoration(color: EvxColors.darkPrimeryColor),
                    height: height / 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Stack(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: height / 15,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
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
                                      'Next',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Gilroy Bold',
                                          fontSize: width / 20),
                                    ),
                                  ),
                                ),
                              )),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    'Add money',
                                    style: TextStyle(
                                      color: EvxColors.lightColor,
                                      fontFamily: 'Gilroy Medium',
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Add amount",
                                  style: TextStyle(
                                    fontFamily: "Gilroy Bold",
                                    fontSize: 16,
                                    color: EvxColors.lightColor,
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.02),
                                textfield(
                                  controller: add,
                                  feildcolor: EvxColors.a,
                                  labelcolor: EvxColors.darkPrimeryColor,
                                  suffix: null,
                                  text: "Amount",
                                ),
                                SizedBox(height: Get.height * 0.05),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
