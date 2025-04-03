// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:goevynew/screens/bottom%20bar/about.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/media.dart';

//============================== Appbar ===========================================

appbar({String? tital, Color? txtclr, Color? iconclr}) {
  return AppBar(
    title: Text(
      tital!,
      style: TextStyle(
        color: txtclr,
        fontSize: height / 40,
      ),
    ),
    leading: GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: height / 20,
        width: width / 4,
        decoration: BoxDecoration(
          color: Colors.pink,
          border: Border.all(
            color: const Color(0xff8C949C).withOpacity(0.4),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Icon(Icons.arrow_back, size: height / 40, color: iconclr),
      ),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}

//============================== button ============================================

appButton({Function()? onTap, String? title, Color? clr}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 30),
      child: Container(
        height: height / 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
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
            title!,
            style: TextStyle(
              color: Colors.black,
              fontSize: height / 50,
              fontFamily: 'Gilroy Bold',
            ),
          ),
        ),
      ),
    ),
  );
}

//================================== Textfield ======================================

textField({
  String? hinttext,
  String? labeltxt,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width / 20),
    child: Container(
      height: height / 15,
      color: Colors.transparent,
      child: TextField(
        style: TextStyle(
          fontSize: height / 50,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: labeltxt,
          labelStyle: TextStyle(
              color: Colors.white.withOpacity(0.5), fontSize: height / 50),
          hintText: hinttext,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: height / 55,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}

CustomAppbar(
    {String? centertext,
    bool? center,
    IconData? actionicon,
    Function()? onclick,
    double? redi}) {
  return AppBar(
    elevation: 800,
    backgroundColor: Colors.white,
    centerTitle: center,
    title: Text(
      centertext!,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontFamily: "Gilroy Bold",
      ),
    ),
    leading: Transform.translate(
      offset: const Offset(-6, 0),
      child: const BackButton(color: Colors.black),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: InkWell(
          onTap: onclick,
          child: CircleAvatar(
            radius: redi,
            backgroundColor: Colors.grey.withOpacity(0.2),
            child: Icon(
              actionicon,
              color: Colors.black,
            ),
          ),
        ),
      )
    ],
  );
}

// \\======================================================================================

textfield(
    {String? text,
    suffix,
    Color? labelcolor,
    feildcolor,
    Color? tclr,
    double? Width,
    TextEditingController? controller,
    Height,
    obscureText}) {
  return Container(
      height: Height,
      width: Width,
      padding: const EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: feildcolor,
      ),
      child: TextField(
        style: TextStyle(color: tclr),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: "Gilroy Medium",
            fontSize: 15,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(6),
            child: suffix,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ));
}

// \\=====================================================================

Button(
    {String? buttontext,
    Function()? onclick,
    double? Width,
    Color? buttoncolor}) {
  return GestureDetector(
    onTap: onclick,
    child: Container(
      height: 50,
      width: Width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: buttoncolor),
      child: Center(
        child: Text(
          buttontext!.toUpperCase(),
          style: const TextStyle(
              fontFamily: "Gilroy Bold", color: Colors.white, fontSize: 16),
        ),
      ),
    ),
  );
}

//============================================================================================================

appbare(
    {String? tital,
    Color? txtclr,
    Color? iconclr,
    Color? butclr,
    Color? brclr}) {
  return AppBar(
    title: Padding(
      padding: EdgeInsets.only(top: height / 90),
      child: Text(
        tital!,
        style: TextStyle(
          color: txtclr,
          fontSize: height / 40,
        ),
      ),
    ),
    leading: GestureDetector(
      onTap: () => Get.back(),
      child: Padding(
        padding: EdgeInsets.only(left: width / 30, top: height / 80),
        child: Container(
          height: height / 25,
          // width: width / ,
          decoration: BoxDecoration(
            color: butclr,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: width / 40),
            child:
                Icon(Icons.arrow_back_ios, size: height / 40, color: iconclr),
          ),
        ),
      ),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}

//===============================================

texfield(
    {String? text,
    suffix,
    Color? labelcolor,
    Function()? ontap,
    feildcolor,
    double? Width,
    Height,
    TextEditingController? controller,
    String? Function(String?)? validator}) {
  return Container(
    height: Height,
    width: Width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: EvxColors.lightgreyColor,
    ),
    child: TextFormField(
      onTap: ontap,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.all(6),
          child: suffix,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: EvxColors.darkblueColor),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: EvxColors.lightgreyColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: validator,
    ),
  );
}

textfieldPass(
    {String? text,
    suffix,
    Color? labelcolor,
    feildcolor,
    Color? tclr,
    double? Width,
    TextEditingController? controller,
    Height,
    obscureText,
    inkwell}) {
  return Container(
      height: Height,
      width: Width,
      padding: const EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: feildcolor,
      ),
      child: TextField(
        style: TextStyle(color: tclr),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.all(height / 50),
            child: inkwell,
          ),
          labelText: text,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: "Gilroy Medium",
            fontSize: 15,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ));
}
