import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/media.dart';
import '../../../../utils/constants/string.dart';

import '../../models/FruitDataModel.dart';

class ReshiduledScreen extends StatefulWidget {
  final FruitDataModel fruitDataModel;

  const ReshiduledScreen({super.key, required this.fruitDataModel});

  @override
  State<ReshiduledScreen> createState() => _ReshiduledScreenState();
}

class _ReshiduledScreenState extends State<ReshiduledScreen> {
  var isPlaying = false;
  var isPlay = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EvxColors.darkPrimeryColor,
      body: Padding(
          padding: EdgeInsets.only(left: width / 30, right: width / 30),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height / 15),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const bottom()),
                            // );
                          },
                          child: Icon(
                            Icons.keyboard_backspace_outlined,
                            size: width / 12,
                            color: EvxColors.lightColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width / 40),
                          child: Text(
                            EvxCustomStrings.reschuled,
                            style: TextStyle(
                              fontSize: width / 18,
                              fontWeight: FontWeight.w600,
                              color: EvxColors.lightColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 60),
                    child: Container(
                      height: height / 8,
                      decoration: BoxDecoration(
                        color: EvxColors.a,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      widget.fruitDataModel.ImageUrl,
                                    ),
                                    fit: BoxFit.fill),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                                color: EvxColors.a,
                              ),
                              width: width / 5,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height / 80, left: width / 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.fruitDataModel.name,
                                    style: TextStyle(
                                        fontSize: width / 22,
                                        fontWeight: FontWeight.w600,
                                        color: EvxColors.lightColor),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: EvxColors.greydark,
                                        size: width / 25,
                                      ),
                                      SizedBox(
                                        width: width / 100,
                                      ),
                                      Text(
                                        widget.fruitDataModel.add,
                                        style: TextStyle(
                                          fontSize: width / 26,
                                          color: EvxColors.greydark,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 50,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        widget.fruitDataModel.chargeid,
                                        style: TextStyle(
                                          fontSize: width / 26,
                                          color: EvxColors.lightColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: width / 4.5,
                                        ),
                                        child: Text(
                                          EvxCustomStrings.profilw,
                                          style: TextStyle(
                                            fontSize: width / 30,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 30),
                    child: Text(
                      widget.fruitDataModel.model,
                      style: TextStyle(
                        fontSize: width / 20,
                        fontWeight: FontWeight.w600,
                        color: EvxColors.lightColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 2.25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.fruitDataModel.time,
                              style: TextStyle(
                                  fontSize: width / 20,
                                  fontWeight: FontWeight.w600,
                                  color: EvxColors.lightColor),
                            ),
                            SizedBox(
                              height: height / 80,
                            ),
                            Text(
                              'Estimated time remining',
                              style: TextStyle(
                                  fontSize: width / 25,
                                  color: EvxColors.lightgreyColor),
                            ),
                            Text(
                              'for full charge',
                              style: TextStyle(
                                  fontSize: width / 25,
                                  color: EvxColors.lightgreyColor),
                            ),
                            SizedBox(
                              height: height / 40,
                            ),
                            Text(
                              widget.fruitDataModel.fullrate,
                              style: TextStyle(
                                  fontSize: width / 20,
                                  fontWeight: FontWeight.w600,
                                  color: EvxColors.lightColor),
                            ),
                            SizedBox(
                              height: height / 80,
                            ),
                            Text(
                              'Estimated full charge',
                              style: TextStyle(
                                  fontSize: width / 25,
                                  color: EvxColors.lightgreyColor),
                            ),
                            Text(
                              'costs',
                              style: TextStyle(
                                  fontSize: width / 25,
                                  color: EvxColors.lightgreyColor),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.fruitDataModel.chargerate,
                              style: TextStyle(
                                  fontSize: width / 20,
                                  fontWeight: FontWeight.w600,
                                  color: EvxColors.lightColor),
                            ),
                            SizedBox(height: height / 80),
                            Text(
                              'Total cost accrued for',
                              style: TextStyle(
                                fontSize: width / 25,
                                color: EvxColors.lightgreyColor,
                              ),
                            ),
                            Text(
                              'this charge',
                              style: TextStyle(
                                fontSize: width / 25,
                                color: EvxColors.lightgreyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width / 1.7, top: height / 1.1),
                child: Row(
                  children: [
                    Container(
                      height: height / 18,
                      width: width / 8,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        icon: isPlaying
                            ? const Icon(
                                Icons.pause,
                                color: Colors.white,
                              )
                            : const Icon(Icons.play_arrow, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                    Container(
                      height: height / 18,
                      width: width / 8,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: isPlay
                            ? const Icon(
                                Icons.stop,
                                color: Colors.white,
                              )
                            : const Icon(Icons.stop_outlined,
                                color: Colors.white),
                        onPressed: () {
                          setState(() {
                            isPlay = !isPlay;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 12),
                child: Align(
                  child: Container(
                    height: height / 2.5,
                    width: width / 1.2,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 10.0,
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: EvxColors.darkPrimeryColor,
                      // borderRadius: BorderRadius.circular(180),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 12),
                child: Align(
                  child: Container(
                    height: height / 4,
                    width: width / 1.9,
                    decoration: BoxDecoration(
                      color: EvxColors.a,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 12),
                child: Align(
                  alignment: Alignment.center,
                  child: CircularPercentIndicator(
                    radius: width / 2.5,
                    lineWidth: width / 16,
                    backgroundColor: Colors.blue.shade100,
                    progressColor: EvxColors.lightblueColor,
                    percent: 0.76,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.battery_charging_full_rounded,
                          color: EvxColors.lightColor,
                          size: width / 7,
                        ),
                        SizedBox(
                          height: height / 80,
                        ),
                        Text(
                          '76 %',
                          style: TextStyle(
                            color: EvxColors.lightColor,
                            fontSize: width / 10,
                          ),
                        ),
                        SizedBox(
                          height: height / 150,
                        ),
                        Text(
                          'Charged',
                          style: TextStyle(
                              color: EvxColors.lightColor,
                              fontSize: width / 20),
                        ),
                      ],
                    ),
                    animation: true,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
