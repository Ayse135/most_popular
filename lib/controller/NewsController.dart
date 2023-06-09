import 'dart:convert';

import 'package:get/get.dart';
import '../core/services/nyt.api.dart';
import '../core/util/Constants.dart';
import '../core/util/ILocalUtil.dart';
import '../model/dto_news.dart';
import '../core/services/NewsService.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController with ILocalUtil{
  NewsService _newsService=new NewsService();
/*
  void startNewsListAction(int kat_id){
    _newsService.getNewsList(
    );
    print(kat_id);
  }
*/
  // NEWS
  var newsListe = <dto_news>[].obs;
  var newsListe_STATUS = Rx<networkState>(networkState.loading);
  var newsListePage = 0.obs;
  var newsListeArama = "".obs;
  var newsListeDone = false.obs;
  Future getNewsList({bool isRefresh = false,page=0}) async {
    try{
      print("News Controller");
      newsListe_STATUS.value = networkState.loading;
      newsListePage.value ++;
      if (isRefresh){
        newsListe.clear();
        newsListePage.value = 1;
      }
      print("page: ${newsListePage.value}");
      print(newsListe.length);
      newsListe=await _newsService.getNewsList();
     // newsListe.value.addAll(
     //     await _newsService.getNewsList(
     //       page: 3
     //     )
     // );
      newsListe_STATUS.value = networkState.success;
    }catch (e) {
      print("error: ${e.toString()}");
      newsListe_STATUS.value = networkState.error;
    }
  }


  var appOpenProcess = 0.obs;
  Future<void> fillDataWhenAppOpen(context) async {
    appOpenProcess.value = 3;
    await getNewsList();
    if (newsListe.value == null || newsListe.value.first.id == -1)
      throw "İşlem sırasında bir hata oluştu. Lütfen tekrar deneyiniz.";

    appOpenProcess.value = 29;
    appOpenProcess.value = 34;
  }

  var isLoading=false.obs;
  fetchData()async{
    String url='http://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=AXsHq5t4NUY9GAsaSLMkrVsenRSAvNCl';
    try{
      isLoading(true);
      http.Response response=await http.get(Uri.parse(url));
      if(response.statusCode==200){
        var result=jsonDecode(response.body);
        return dto_news.fromJson(result);
      }else{
        print("HATA 103");
      }
    }catch(e){
      print("HATA 102");
      print(e.toString());
    }finally{isLoading(false);}
  }
}