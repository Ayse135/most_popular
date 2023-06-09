import 'package:flutter/material.dart';
import 'OurColors.dart';

Widget buildColorButton({
  Function onPressed,
  String text="",
  IconData icon,
  Color color=mavi,
  Color borderColor=mavi,
  Color textColor=beyaz,
  Color iconColor=beyaz,
  bool isIconEnd=false,
  bool isBorder=false,
  double width=300,
  double heigth=45,
  TextStyle textStyle,
  double iconSize=24,
  double textSize=16,
  FontWeight fontWeight=FontWeight.bold,

}) {
  return InkWell(
    child: Container(
      height: heigth,
      width: width,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: color,
          border: Border.all(
              width: (isBorder==true?1:0),
              color:(isBorder==true?borderColor:color)
          )

      ),
      child: (isIconEnd?
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: textStyle==null?TextStyle(fontSize: textSize,fontWeight: fontWeight,color: textColor):textStyle,),
          if (icon != null && text!="")
            const SizedBox(width: 4),
          if (icon != null)
            Icon(icon, color: iconColor,size: iconSize,),
        ],
      ) :
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(icon, color: iconColor,size: iconSize,),
          if (icon != null && text!="")
            const SizedBox(width: 4),
          Text(text, style: textStyle==null?TextStyle(fontSize: textSize,fontWeight: fontWeight,color: textColor):textStyle,),
        ],
      )
      ),
    ),
    onTap: (){
      if (onPressed!=null) {
        onPressed();
      }
    },
  );
}

