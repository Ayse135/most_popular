import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:most_popular_mobile/core/services/NYT_Service.dart';
import 'package:most_popular_mobile/view/Dashboard.dart';
import 'package:most_popular_mobile/view/NewsDetailView.dart';
import 'package:most_popular_mobile/view/NewsListView.dart';
import 'package:most_popular_mobile/view/SplashView.dart';
import 'package:most_popular_mobile/view/testListView.dart';
import 'controller/Bindings/MainBinding.dart';

void main() {
  MainBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    NewsApi.getNewsData();
    return GetMaterialApp(
      title: 'New York Times News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ).copyWith(textTheme: GoogleFonts.adaminaTextTheme()),
      getPages: [
        GetPage(name: routeSplash, page: () => SplashView()),
        GetPage(name: routeDashboard, page: () => Dashboard()),
        GetPage(name: routeNewsList, page: () => NewsListView()),
        GetPage(name: routeNewsDetail, page: () => NewsDetailView()),
        GetPage(name: routeTestList, page: () => TestListView()),
      ],
      initialRoute: routeSplash,
    );
  }
}

String get routeSplash => '/splash';
String get routeDashboard => '/dashboard';
String get routeNewsList => '/newsList';
String get routeNewsDetail => '/newsDetail/:id';
String get routeTestList => '/test';
