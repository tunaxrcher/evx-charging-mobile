import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/media.dart';
import '../../../../utils/constants/string.dart';

class HealpScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const HealpScreen({Key? key}) : super(key: key);

  @override
  State<HealpScreen> createState() => _HealpScreenState();
}

class _HealpScreenState extends State<HealpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EvxColors.darkPrimeryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Icon(
            Icons.arrow_back,
            color: EvxColors.lightColor,
          ),
        ),
        backgroundColor: EvxColors.darkPrimeryColor,
        elevation: 0,
        title: Text(
          'Healp & Support',
          style: TextStyle(color: EvxColors.lightColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width / 30, right: width / 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Text(
                  EvxCustomStrings.healp,
                  style: TextStyle(
                    color: EvxColors.greydark,
                    fontFamily: 'Gilroy Medium',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Text(
                  EvxCustomStrings.healp1,
                  style: TextStyle(
                    color: EvxColors.greydark,
                    fontFamily: 'Gilroy Medium',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Text(
                  EvxCustomStrings.healp2,
                  style: TextStyle(
                    color: EvxColors.greydark,
                    fontFamily: 'Gilroy Medium',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Text(
                  EvxCustomStrings.healp3,
                  style: TextStyle(
                    color: EvxColors.greydark,
                    fontFamily: 'Gilroy Medium',
                  ),
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
