import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/media.dart';
import 'charging_point_station_screen.dart';

List<Map<String, dynamic>> data = [
  {
    'id': '1',
    'position': const LatLng(17.9604222, 102.5233639),
    'assetPath': 'assets/icons/pin.png',
  },
  {
    'id': '2',
    'position': const LatLng(17.932296, 102.6030598),
    'assetPath': 'assets/icons/pin.png',
  },
  {
    'id': '3',
    'position': const LatLng(18.0096093, 102.5648078),
    'assetPath': 'assets/icons/pin.png',
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// -- MAP
  CameraPosition? _kGooglePlex;

  final Completer<GoogleMapController> _controller = Completer();

  Map<String, Marker> _markers = {};

  /// -- Slide
  var storeAddress;
  int _index = 0;
  double rat = 3.0;
  List info = [
    {
      'id': '1',
      'staation': 'Laos',
      'add': 'Vientiane (w)',
      'slote': '04/08',
      'time': '24 Hours',
      'No': '9090876543',
      'image': 'assets/11.jpg',
      'type': 'GB/T',
      'kw': '98 KW',
    },
    {
      'id': '2',
      'staation': 'Laos cherging station',
      'add': 'Vientiane (w)',
      'slote': '04/08',
      'time': '24 Hours',
      'No': '0987624356',
      'image': 'assets/22.jpg',
      'type': 'GB/T',
      'kw': '32 KW',
    },
    {
      'id': '3',
      'staation': 'Laos cherging station',
      'add': 'Vientiane (w)',
      'slote': '04/28',
      'time': '24 Hours',
      'No': '9090876543',
      'image': 'assets/33.jpg',
      'type': 'AC/T',
      'kw': '45 KW',
    },
    {
      'id': '4',
      'staation': 'Laos cherging station',
      'add': 'Vientiane (w)',
      'slote': '04/02',
      'time': '24 Hours',
      'No': '6251437694',
      'image': 'assets/44.png',
      'type': 'DC/T',
      'kw': '70 KW',
    },
    {
      'id': '5',
      'staation': 'Laos cherging station',
      'add': 'Vientiane (w)',
      'slote': '01/08',
      'time': '24 Hours',
      'No': '92838172833',
      'image': 'assets/55.jpg',
      'type': 'GB/2',
      'kw': '80 KW',
    },
  ];

  @override
  void initState() {
     _generateMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// -- Map
         _buildMap(),

          /// -- Search Box
         _buildSearchBox(),

          /// -- Slide
        _buildChargingPointSlide(),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: height / 1.5,
            width: width,
            color: Colors.transparent,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex ??
                  const CameraPosition(
                    target: LatLng(17.9604222, 102.5233639),
                    zoom: 12.0,
                  ),
              // markers: markers,
              markers: _markers.values.toSet(),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    Future.delayed(const Duration(seconds: 0), () => setState(() {}));
    return Padding(
      padding: EdgeInsets.only(
        top: height / 17,
        right: width / 30,
        left: width / 30,
      ),
      child: Container(
        height: height / 16,
        // width: width / 1.30,
        color: Colors.transparent,
        child: TextField(
          controller: storeAddress,
          onChanged: (val) {
            // val == "" ? nearbyList.clear() : nearbyStore(val);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: EvxColors.serchbaard,
            isDense: true,
            hintText: "Find a gas station",
            hintStyle: TextStyle(
              color: EvxColors.greydark.withOpacity(0.8),
              fontSize: height / 55,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                  right: width / 30,
                  top: height / 70,
                  bottom: height / 70,
                  left: width / 30),
              child: Icon(
                Icons.search,
                size: width / 15,
                color: EvxColors.lightColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: EvxColors.greydark.withOpacity(0.3))),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: EvxColors.greydark.withOpacity(0.3))),
          ),
        ),
      ),
    );
  }

  Widget _buildChargingPointSlide() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: height / 2.0),
        child: Container(
          // decoration: BoxDecoration(
          //   borderRadius: const BorderRadius.only(
          //     topRight: Radius.circular(15),
          //     topLeft: Radius.circular(15),
          //   ),
          //   color: darkPrimeryColor,
          // ),
          child: Padding(
            padding: EdgeInsets.only(top: height / 60),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: height / 2.14, // card height
                child: PageView.builder(
                  itemCount: 5,
                  controller: PageController(
                    viewportFraction: 0.91,
                  ),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: i == _index ? 1 : 0.95,
                      child: GestureDetector(
                        onTap: () {
                          setState(
                            () {},
                          );
                        },
                        child: Container(
                          height: height / 4,
                          width: width / 1.5,
                          decoration: BoxDecoration(
                            color: EvxColors.serchbaard,
                            border: Border.all(width: 1, color: EvxColors.lightgreyColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: height / 70),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: width / 60),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: height / 8,
                                                width: width / 3,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        info[_index]['image']),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  Text(
                                                    '$rat',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: EvxColors.lightColor,
                                                    ),
                                                  ),
                                                  SizedBox(width: width / 40),
                                                  RatingBar(
                                                    initialRating: 3,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemSize: 18,
                                                    itemCount: 5,
                                                    ratingWidget: RatingWidget(
                                                      full: Image.asset(
                                                          'assets/icons/Star, rating, favorites, like, half.png'),
                                                      half: Image.asset(
                                                          'assets/icons/Star, rating, favorites, like, half (1).png'),
                                                      empty: Image.asset(
                                                          'assets/icons/Star, rating, favorites, like, half.png'),
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      setState(() {
                                                        rat = rating;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: width / 40,
                                            bottom: height / 40,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: width / 2,
                                                    child: Text(
                                                      '${info[_index]['staation']}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily:
                                                            'Gilroy Medium',
                                                        color: EvxColors.lightColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Available slot : ',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: EvxColors.greydark,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width / 4,
                                                    child: Text(
                                                      '${info[_index]['slote']}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: EvxColors.greydark,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: height / 140),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/icons/Alarm, clock.png',
                                                    scale: 6,
                                                  ),
                                                  SizedBox(width: width / 30),
                                                  SizedBox(
                                                    width: width / 3,
                                                    child: Text(
                                                      '${info[_index]['time']}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: EvxColors.greydark,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: height / 140),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/icons/Phone, call, outgoing.png',
                                                    scale: 6,
                                                  ),
                                                  SizedBox(
                                                    width: width / 30,
                                                  ),
                                                  SizedBox(
                                                    width: width / 3,
                                                    child: Text(
                                                      '${info[_index]['No']}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: EvxColors.greydark,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: height / 55,
                                        left: width / 30,
                                        right: width / 30,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Connection',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: EvxColors.greydark,
                                                ),
                                              ),
                                              SizedBox(
                                                height: height / 200,
                                              ),
                                              Text(
                                                '${info[_index]['type']}',
                                                style: TextStyle(
                                                  color: EvxColors.lightColor,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Speed',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: EvxColors.greydark,
                                                ),
                                              ),
                                              SizedBox(
                                                height: height / 200,
                                              ),
                                              Text(
                                                '${info[_index]['kw']}',
                                                style: TextStyle(
                                                  color: EvxColors.lightColor,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Facilities',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: EvxColors.greydark,
                                                ),
                                              ),
                                              SizedBox(
                                                height: height / 200,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/icons/Wine, cup, glass, half.png',
                                                    scale: 5,
                                                  ),
                                                  SizedBox(width: width / 80),
                                                  Image.asset(
                                                    'assets/icons/Cutlery, fork, knife, restaurant.png',
                                                    scale: 5,
                                                  ),
                                                  SizedBox(width: width / 80),
                                                  Image.asset(
                                                    'assets/icons/Sethoscope, health, doctor.png',
                                                    scale: 5,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 40),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () => Get.to(() =>
                                                const ChargingPointStationScreen()),
                                            child: Container(
                                              height: height / 16,
                                              width: width / 1.8,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                gradient: const LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Colors.lightBlueAccent,
                                                      Colors.cyanAccent,
                                                    ]),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Detail',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: height / 50,
                                                    fontFamily: 'Gilroy Bold',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: width / 30),
                                          GestureDetector(
                                            onTap: () {
                                              AlertDialog alert = AlertDialog(
                                                title: Text('Development'),
                                              );
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return alert;
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: height / 16,
                                              width: width / 7,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                gradient: const LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Colors.lightBlueAccent,
                                                      Colors.cyanAccent,
                                                    ]),
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Iconsax.scan,
                                                  size: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: height / 40,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Add : ',
                                            style: TextStyle(
                                                color: EvxColors.lightColor,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                          SizedBox(
                                            width: width / 1.5,
                                            child: Text(
                                              '${info[_index]['add']}',
                                              style: TextStyle(
                                                color: EvxColors.greydark,
                                                fontFamily: 'Gilroy Medium',
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _generateMarkers() async {
    for (int i = 0; i < data.length; i++) {
      BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(),
        data[i]['assetPath'],
      );

      _markers[i.toString()] = Marker(
        markerId: MarkerId(i.toString()),
        position: data[i]['position'],
        icon: markerIcon,
        infoWindow: InfoWindow(title: 'development'),
      );
      setState(() {});
    }
  }
}
