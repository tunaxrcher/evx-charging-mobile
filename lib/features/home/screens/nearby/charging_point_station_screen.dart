import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/media.dart';
import '../../../../utils/constants/string.dart';

class ChargingPointStationScreen extends StatefulWidget {
  const ChargingPointStationScreen({super.key});

  @override
  State<ChargingPointStationScreen> createState() =>
      _ChargingPointStationScreenState();
}

class _ChargingPointStationScreenState
    extends State<ChargingPointStationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EvxColors.darkPrimeryColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height / 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  icon: Icon(
                    Icons.arrow_back_sharp,
                    color: EvxColors.lightColor,
                    size: width / 12,
                  ),
                ),
                Text(
                  'Summery',
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.w600,
                    color: EvxColors.lightColor,
                    fontFamily: 'Gilroy Medium',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: width / 30, right: width / 30, top: 200),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height / 22),
                        child: Text(
                          'Station (ref. EV LOGA)',
                          style: TextStyle(
                            fontSize: width / 13,
                            fontFamily: 'Gilroy Medium',
                            fontWeight: FontWeight.w600,
                            color: EvxColors.lightColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height / 80),
                        child: DottedLine(
                          dashColor: EvxColors.greydark,
                          dashLength: 6,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: width / 30, top: height / 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              EvxCustomStrings.station,
                              style: TextStyle(
                                fontFamily: 'Gilroy Medium',
                                color: EvxColors.greydark,
                                fontSize: width / 22,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width / 30,
                        ),
                        child: Row(
                          children: [
                            Text(
                              EvxCustomStrings.stationname,
                              style: TextStyle(
                                fontSize: width / 20,
                                fontFamily: 'Gilroy Medium',
                                fontWeight: FontWeight.w600,
                                color: EvxColors.lightColor,
                              ),
                            ),
                            SizedBox(width: width / 30),
                            const Icon(
                              Icons.call,
                              color: Colors.blue,
                            ),
                            SizedBox(width: width / 30),
                            const Icon(
                              Icons.bookmark_border,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width / 30,
                          top: height / 40,
                          right: width / 10,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  EvxCustomStrings.timee,
                                  style: TextStyle(
                                    fontSize: width / 22,
                                    fontFamily: 'Gilroy Medium',
                                    fontWeight: FontWeight.normal,
                                    color: EvxColors.greydark,
                                  ),
                                ),
                                Text(
                                  EvxCustomStrings.may,
                                  style: TextStyle(
                                    fontSize: width / 20,
                                    fontFamily: 'Gilroy Medium',
                                    fontWeight: FontWeight.w600,
                                    color: EvxColors.lightColor,
                                  ),
                                ),
                                Text(
                                  EvxCustomStrings.am,
                                  style: TextStyle(
                                    fontSize: width / 20,
                                    fontFamily: 'Gilroy Medium',
                                    fontWeight: FontWeight.w600,
                                    color: EvxColors.lightColor,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  EvxCustomStrings.duration,
                                  style: TextStyle(
                                    fontSize: width / 22,
                                    fontFamily: 'Gilroy Medium',
                                    fontWeight: FontWeight.normal,
                                    color: EvxColors.greydark,
                                  ),
                                ),
                                Text(
                                  EvxCustomStrings.min,
                                  style: TextStyle(
                                    fontSize: width / 20,
                                    fontFamily: 'Gilroy Medium',
                                    fontWeight: FontWeight.w600,
                                    color: EvxColors.lightColor,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  EvxCustomStrings.units,
                                  style: TextStyle(
                                    fontSize: width / 22,
                                    fontFamily: 'Gilroy Medium',
                                    fontWeight: FontWeight.normal,
                                    color: EvxColors.greydark,
                                  ),
                                ),
                                Text(
                                  EvxCustomStrings.kwh,
                                  style: TextStyle(
                                    fontSize: width / 20,
                                    fontFamily: 'Gilroy Medium',
                                    fontWeight: FontWeight.w600,
                                    color: EvxColors.lightColor,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: width / 30, top: height / 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  EvxCustomStrings.units,
                                  style: TextStyle(
                                    fontSize: width / 22,
                                    fontFamily: 'Gilroy Medium',
                                    fontWeight: FontWeight.normal,
                                    color: EvxColors.greydark,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      EvxCustomStrings.kwh,
                                      style: TextStyle(
                                        fontSize: width / 20,
                                        fontFamily: 'Gilroy Medium',
                                        fontWeight: FontWeight.w600,
                                        color: EvxColors.lightColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: width / 2),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: height / 40,
                                          width: width / 7,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'PAID',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontFamily: 'Gilroy Medium',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width / 30,
                          right: width / 30,
                          top: height / 30,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: height / 10,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(left: width / 30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/master.png',
                                  height: height / 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: height / 40, left: width / 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        EvxCustomStrings.cardending,
                                        style: TextStyle(
                                          fontSize: width / 22,
                                          fontFamily: 'Gilroy Medium',
                                          fontWeight: FontWeight.w600,
                                          color: EvxColors.lightColor,
                                        ),
                                      ),
                                      Text(
                                        EvxCustomStrings.transectionid,
                                        style: TextStyle(
                                          fontSize: width / 25,
                                          fontFamily: 'Gilroy Medium',
                                          fontWeight: FontWeight.normal,
                                          color: EvxColors.greydark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding:
                            EdgeInsets.only(left: width / 30, top: height / 60),
                        child: Row(
                          children: [
                            Container(
                              height: height / 15,
                              width: width / 5.8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.blue,
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.qr_code_scanner,
                                  size: width / 8,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width / 40),
                              child: InkWell(
                                child: GestureDetector(
                                  onTap: () {
                                    AlertDialog alert = AlertDialog(
                                      title: Text('Development'),
                                    );
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alert;
                                      },
                                    );
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      AlertDialog alert = AlertDialog(
                                        title: Text('Development'),
                                      );
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert;
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: height / 15,
                                      width: width / 1.5,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          gradient: const LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Colors.lightBlueAccent,
                                              Colors.cyanAccent,
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          EvxCustomStrings.get,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Gilroy Bold',
                                            fontSize: width / 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: height / 8.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQly97ryJANqdppmJmvJwQDppRTd_-pxx9KoQ&usqp=CAU.jpg',
                    width: 200,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
