import 'package:get/get.dart';
import '../../controller/NewsController.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<NewsController>(NewsController());
  }

}