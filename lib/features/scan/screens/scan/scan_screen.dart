import 'package:charging/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../utils/constants/media.dart';
import '../../../../utils/constants/string.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  // final GlobalKey _globalKey = GlobalKey();
  final qrkey = GlobalKey(debugLabel: "Qr");

  set qrViewController(QRViewController qrViewController) {}

  set(QRViewController qrViewController) {}

  void onQrViewCreated(QRViewController qrViewController) async {
    setState(() {
      this.qrViewController = qrViewController;
    });
    qrViewController.scannedDataStream.listen((qrData) {
      qrViewController.pauseCamera();
    });
  }

  String qrCode = 'Unknow';
  var getResult = 'QR Code REsult';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EvxColors.darkPrimeryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Title Bar
            Padding(padding: EdgeInsets.only(top: height / 20)),
            SizedBox(height: height / 50),

            /// -- Camera
            _buildCamera(),

            /// -- Slide
            _buildSlide()
          ],
        ),
      ),
    );
  }

  Widget _buildCamera() {
    return Padding(
      padding: EdgeInsets.only(left: width / 30, right: width / 30),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: EvxColors.greydark),
          borderRadius: BorderRadius.circular(0),
        ),
        height: height / 1.8,
        // width: width / 1.2,
        child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Stack(
                children: [
                  buildQrView(context),
                ],
              );
            }),
      ),
    );
  }

  Widget _buildSlide() {
    return Padding(
      padding: EdgeInsets.only(
          left: width / 30, right: width / 30, top: height / 25),
      child: Container(
        height: height / 6,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10),
          color: EvxColors.a,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height / 65),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 40),
                    child: Column(
                      children: [
                        Container(
                          height: height / 12,
                          width: width / 5.5,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQly97ryJANqdppmJmvJwQDppRTd_-pxx9KoQ&usqp=CAU.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: height / 90),
                        Container(
                          height: height / 30,
                          width: width / 5.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
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
                              EvxCustomStrings.open,
                              style: TextStyle(
                                fontFamily: 'Gilroy Medium',
                                fontSize: width / 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 40, bottom: height / 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              EvxCustomStrings.qrstation,
                              style: TextStyle(
                                fontFamily: 'Gilroy Medium',
                                fontSize: width / 21,
                                color: EvxColors.lightColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: width / 25,
                              color: EvxColors.greydark,
                            ),
                            Text(
                              EvxCustomStrings.qrstation,
                              style: TextStyle(
                                fontFamily: 'Gilroy Medium',
                                fontSize: width / 24,
                                color: EvxColors.greydark,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.directions,
                              size: width / 24,
                              color: EvxColors.greydark,
                            ),
                            Text(
                              EvxCustomStrings.qraddress,
                              style: TextStyle(
                                fontFamily: 'Gilroy Medium',
                                fontSize: width / 25,
                                color: EvxColors.greydark,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.charging_station,
                              size: width / 24,
                              color: EvxColors.greydark,
                            ),
                            Text(
                              EvxCustomStrings.qrlocation,
                              style: TextStyle(
                                fontFamily: 'Gilroy Medium',
                                fontSize: width / 25,
                                color: EvxColors.greydark,
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
            Padding(
              padding: EdgeInsets.only(left: width / 1.3, top: height / 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.next_plan,
                    color: EvxColors.lightblueColor,
                    size: width / 15,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 14, left: width / 40),
                    child: Row(
                      children: [
                        Text(
                          EvxCustomStrings.qrrate,
                          style: TextStyle(
                            fontFamily: 'Gilroy Medium',
                            fontSize: width / 25,
                            color: EvxColors.greydark,
                          ),
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                          size: width / 22,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrkey,
        onQRViewCreated: onQrViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.black45,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderRadius: 10,
        ),
      );
}
