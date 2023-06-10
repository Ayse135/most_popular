import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:most_popular_mobile/assets/style/OurTextStyle.dart';
import 'package:most_popular_mobile/controller/NewsController.dart';
import 'package:most_popular_mobile/widget/quickAlert.dart';
import 'package:quickalert/models/quickalert_type.dart';
import '../assets/style/OurColors.dart';
import '../core/util/ILocalUtil.dart';
import '../main.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with ILocalUtil {

  @override
  void initState() {
    super.initState();

    /**
     * I put 6second delay for viewing the splash screen
     */
    Future.delayed(Duration(seconds: 6), () async {
        try {
          /**
           * I usually use this for checking user if sign in or not then making the routes
           */
          var appDataController = Get.find<NewsController>();
          // await appDataController.fillDataWhenAppOpen(context);
          Get.offAllNamed(routeDashboard);
          // Get.offAllNamed(routeTestList);
          // Get.offAllNamed(routeNewsList);
        } catch (e){
          print("------------------- HATA SPLASH ------------------------");
          print(e.toString());
          // Hata çıkarsa uyarı göster.
          showQuickAlert(context,
            "Uygulama yüklenirken bir hata oluştu. "
                "Lütfen tekrar deneyiniz. "+e.toString(),
            title: "HATA:101",
            alarmTipi: QuickAlertType.error
          );
        }

    });
  }


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: bgColor2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height*.15,),
              Center(child: Column(
                children: [
                  Image(image: AssetImage("lib/assets/img/nyt.png"),width: (size.width*.16),),
                  // Image(image: AssetImage("lib/drawable/assets/splash_animation.gif"), width: size.width - 100,),
                  SizedBox(height: 6,),
                  Lottie.asset('lib/assets/img/reading_news.json',height: size.height*.38),
                  SizedBox(height: 4,),
                  Text("Yükleniyor...",style: siyahText20.copyWith(color: mor),),
                  SizedBox(height: 8,),
                  LinearProgressIndicator(color: morA.shade500,minHeight: 6,backgroundColor: Colors.grey.shade300,),
                  SizedBox(height: 6,),
                  GetX<NewsController>(builder: (controller){
                    return Text(
                      "%" + controller.appOpenProcess.value.toString(),
                      style: siyahText20.copyWith(color: mor),
                    );
                  }),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
