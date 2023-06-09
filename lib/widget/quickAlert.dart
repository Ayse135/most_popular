import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import '../assets/style/OurColors.dart';

dynamic showQuickAlert(context, String text,{Size size,Color color = kirmizi,
  Duration duration = const Duration(seconds: 20),QuickAlertType alarmTipi=QuickAlertType.error,String title="Hata",Function fnc_onaylama}){
  return QuickAlert.show(
      context: context,
      type: alarmTipi,
      // autoCloseDuration: duration,
      text: text,
      confirmBtnText: "Tamam",
      title: title,
      confirmBtnColor: mavi,
      onConfirmBtnTap: fnc_onaylama

  );
}