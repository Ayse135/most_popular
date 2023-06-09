import 'package:flutter/material.dart';
import '../assets/style/OurButtons.dart';

class EmptyDataWidgets {

  Widget EmptyData1Widget(BuildContext context, {String title, String desc, IconData icon = Icons.search_off_outlined,
    IconData buttonIcon = Icons.add, String buttonText, Function onPress, Color color}) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60,),
              CircleAvatar(child: Icon(icon, color: Colors.grey.shade400, size: size.width / 6,),minRadius: size.width / 6, backgroundColor: Colors.grey.shade300,),
              SizedBox(height: 20,),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey.shade700),),
              SizedBox(height: 20,),
              Text(desc, style: TextStyle(fontSize: 14, color: Colors.grey.shade700),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              (buttonText == null || buttonText.isEmpty ? SizedBox() :
              buildColorButton(text: buttonText,icon: buttonIcon,onPressed: onPress)
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget EmptyData1Widget_noScroll(BuildContext context, {String title, String desc, IconData buttonIcon = Icons.add, String buttonText, Function onPress, Color color, IconData icon=Icons.search_off_outlined}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          CircleAvatar(child: Icon(icon, color: Colors.grey.shade400, size: size.width / 8,),minRadius: size.width / 8, backgroundColor: Colors.grey.shade300,),
          SizedBox(height: 20,),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey.shade700),),
          SizedBox(height: 20,),
          Text(desc, style: TextStyle(fontSize: 14, color: Colors.grey.shade700,),textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          (buttonText == null || buttonText.isEmpty ? SizedBox() :
          buildColorButton(text: buttonText,icon: buttonIcon,onPressed: onPress)
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }


}
