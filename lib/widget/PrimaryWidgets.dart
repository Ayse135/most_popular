import 'package:flutter/material.dart';

import '../assets/style/OurColors.dart';

class PrimaryWidgets {

  Widget primaryAppBar(BuildContext context, String text,{Widget actions, bool isBack = false, bool isMenu = false}) {
    return AppBar(
      primary: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [yesil,mavi]
            )
        ),
      ),
      // toolbarHeight: 70,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      centerTitle: false,
      title: Text(text,),
      leading: isBack ? BackButton() : null,
      /* actions: (
          [
            (actions == null ? Container() : actions),
            (isMenu == false ? Container() :menuButton(context)),
          ]
      ),*/
    );
  }
  Widget menuButton(BuildContext context){
    return InkWell(
      onTap: () {
        // Get.find<MyDrawerController>().toggleDrawer();
        //Get.toNamed(routeNotListe);
        Scaffold.of(context).openDrawer();

      },
      child: Padding(
        padding: const EdgeInsets.only(bottom:10.0,right:10,top:2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top:5),
            //   child:Container(
            //     width: 1,
            //     height: 30,
            //     color: Colors.white,
            //   ),
            // ),
            SizedBox(width: 20,),
            Icon(Icons.menu,color: Colors.white,size:30),
            // Image.asset("lib/drawable/assets/note_beyaz.png",height: 25,width: 25,),
            SizedBox(width: 20,)
          ],
        ),
      ),
    );
  }


}
