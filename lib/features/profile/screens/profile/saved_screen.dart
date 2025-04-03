import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/media.dart';
import '../../../../utils/constants/string.dart';
import '../../../history/models/FruitDataModel.dart';
import '../../../history/screens/history/reschould_screen.dart';

//
bool stetsu = true;

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  static List<String> date = [
    "March5,2024",
    "May01,2024",
    "April07,2024",
    "April10,2024",
  ];
  static List<String> day = [
    "Monday,Mar5",
    "Thursday,April23",
    "Sunday,April19",
    "Monday,April10",
  ];
  static List<String> Station = [
    "Laos cherging station",
    "Laos cherging station",
    "Laos cherging station",
    "Laos cherging station",
  ];
  static List<String> adress = [
    "Vientiane (w)",
    "Vientiane (w)",
    "Vientiane (w)",
    "Vientiane (w)",
  ];
  static List<dynamic> time = [
    "10:00-11:00am",
    "20:10-21:10pm",
    "02:50-03:50pm",
    "10:00-11:00am",
  ];
  static List image = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQly97ryJANqdppmJmvJwQDppRTd_-pxx9KoQ&usqp=CAU.jpg",
    "https://images.carandbike.com/cms/cms/articles/2023/1/3205629/cms/articles/2023/1/3205652/Hyundai_Charging_Station_1_1efd75d84c.jpg",
    "https://images.ctfassets.net/jarihqritqht/4aKBYuuNlZVotms4LZ48SA/0a6c3175d4018e0e61c224e893107d6a/car-charging-station.jpg",
    "https://www.ieiworld.com/_upload/news/images/iStock-1059362742_1200x628.jpg"
  ];
  static List<dynamic> id = [
    'Charge ID 2256',
    'Charge ID 9206',
    'Charge ID 2236',
    'Charge ID 2126',
  ];
  static List<dynamic> astimatetime = [
    '03:14',
    '07:09',
    '04:14',
    '12:15',
  ];
  static List<dynamic> rate = [
    '\$ 7.39',
    '\$10.80',
    '\$ 6.43',
    '\$10.05',
  ];
  static List<dynamic> fullrate = [
    '\$19.29',
    '\$18.10',
    '\$26.43',
    '\$12.15',
  ];
  static List<dynamic> model = [
    'Charging TESLA Model X',
    'Charging TESLA Model IV',
    'Charging TESLA Model VI',
    'Charging TESLA Model I',
  ];
  final List<FruitDataModel> Fruitdata = List.generate(
    Station.length,
    (index) => FruitDataModel(
        Station[index],
        '${image[index]}',
        adress[index],
        '${id[index]}',
        '${astimatetime[index]}',
        '${rate[index]}',
        '${fullrate[index]}',
        '${model[index]}'),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: EvxColors.lightColor,
          ),
        ),
        title: Text(
          'Saved Charging station',
          style: TextStyle(color: EvxColors.lightColor),
        ),
        backgroundColor: EvxColors.darkPrimeryColor,
        elevation: 0,
      ),
      backgroundColor: EvxColors.darkPrimeryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 10, left: width / 30, right: width / 30),
              child: SizedBox(
                height: height / 1.1,
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: height / 20),
                  shrinkWrap: true,
                  itemCount: Station.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 1.23),
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: height / 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  date[index],
                                  style: TextStyle(
                                    fontSize: width / 20,
                                    fontFamily: 'Gilroy Medium',
                                    fontWeight: FontWeight.w600,
                                    color: EvxColors.lightColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ReshiduledScreen(
                                      fruitDataModel: Fruitdata[index],
                                    ),
                                  ),
                                );
                              });
                            },
                            child: Container(
                              height: height / 3.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: EvxColors.a,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: height / 80),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: width / 40),
                                          child: Container(
                                            height: height / 13,
                                            width: width / 6,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image:
                                                    NetworkImage(image[index]),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: width / 30,
                                                top: height / 110,
                                              ),
                                              child: Text(
                                                Fruitdata[index].name,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Gilroy Medium',
                                                  fontWeight: FontWeight.w600,
                                                  color: EvxColors.lightColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: height / 90),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width / 30),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    size: width / 20,
                                                    color: EvxColors.greydark,
                                                  ),
                                                  Text(
                                                    adress[index],
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Gilroy Medium',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: EvxColors.greydark,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: height / 150),
                                    child: Divider(
                                      endIndent: width / 30,
                                      indent: width / 30,
                                      thickness: 1,
                                      color: EvxColors.lightgreyColor,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: width / 30),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: height / 80),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/Event, calender, check, available.png',
                                                scale: 5,
                                              ),
                                              SizedBox(width: width / 80),
                                              Text(
                                                day[index],
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Gilroy Medium',
                                                  fontWeight: FontWeight.w600,
                                                  color: EvxColors.lightColor,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: height / 50),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/Taxi, car, cab.png',
                                                scale: 5,
                                              ),
                                              SizedBox(width: width / 80),
                                              Text(
                                                EvxCustomStrings.weel,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Gilroy Medium',
                                                  fontWeight: FontWeight.w600,
                                                  color: EvxColors.lightColor,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(width: width / 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: height / 80),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/Alarm, clock.png',
                                                scale: 5,
                                              ),
                                              SizedBox(width: width / 80),
                                              Text(
                                                "${time[index]}",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Gilroy Medium',
                                                  fontWeight: FontWeight.w600,
                                                  color: EvxColors.lightColor,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: height / 50),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/Battery, charging, power (1).png',
                                                scale: 5,
                                              ),
                                              SizedBox(width: width / 80),
                                              Text(
                                                EvxCustomStrings.type,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Gilroy Medium',
                                                  fontWeight: FontWeight.w600,
                                                  color: EvxColors.lightColor,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: height / 50,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: EvxColors.darkPrimeryColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            height: height / 17,
                                            width: width / 3,
                                            // color: Colors.white,
                                            child: Center(
                                                child: Text(
                                              'Remove',
                                              style: TextStyle(
                                                color: EvxColors.lightColor,
                                                fontFamily: 'Gilroy Medium',
                                                fontSize: 16,
                                              ),
                                            )),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReshiduledScreen(
                                                    fruitDataModel:
                                                        Fruitdata[index],
                                                  ),
                                                ),
                                              );
                                            });
                                          },
                                          child: Container(
                                            height: height / 17,
                                            width: width / 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.blue,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Scheduled',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Gilroy Medium',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
