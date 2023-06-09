import 'package:flutter/material.dart';


const Color ColorPrimary=Color(0xff31afba);
const Color ColorSecondary=Color(0xffc381db);

const Color gri=Color(0xff8f8f8f);
const Color siyah=Color(0xff212121);
const Color beyaz=Colors.white;
const Color txtGri=Color(0xff757575);
const Color txtGriDisable=Color(0xff9f9f9f);

Map<int, Color> yesilKoyu={
  100:Color(0xff31afba),
  200:Color(0xff2b9ba6),
  300:Color(0xff268891),
  400:Color(0xff20747c),
  500:Color(0xff1b6168),
  600:Color(0xff164e53),
  700:Color(0xff103a3e),
  800:Color(0xff0b2729),
  900:Color(0xff051315),
};
Map<int, Color> yesilAcik={
  100:Color(0xffebf9fa),
  200:Color(0xffd7f3f5),
  300:Color(0xffc3edf1),
  400:Color(0xffafe7ec),
  500:Color(0xff9be1e7),
  600:Color(0xff86dae2),
  700:Color(0xff72d4dd),
  800:Color(0xff5eced9),
  900:Color(0xff4ac8d4),
};

MaterialColor yesilA=MaterialColor(0xff36C2CF, yesilAcik);
MaterialColor yesilK=MaterialColor(0xff36C2CF, yesilKoyu);

const Color mavi=Color(0xff0093E9);
const Color yesil=Color(0xff36C2CF);
const Color kirmizi=Color(0xff922525);
const Color sari=Color(0xff9c6d2c);

LinearGradient mainGradient(){
  return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [yesil,mavi]
  );
}

