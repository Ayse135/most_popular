import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:most_popular_mobile/model/dto_news.dart';
import 'dart:developer';

class NewsApi{
  // NEWS
  static Future<List<dto_news>> getNewsData({int page=1}) async{
    print("page:::::"+page.toString());
    String _url='http://api.nytimes.com/svc/mostpopular/v2/viewed/${page}.json?api-key=AXsHq5t4NUY9GAsaSLMkrVsenRSAvNCl';
    print("api url:"+_url);
    List<dto_news> _list=[];
    var result = await Dio().get(_url);
    /**
     * checking some values
     */
    //Map<String,dynamic> newsList= new Map<String,dynamic>.from(jsonDecode(result.toString()));
    //var newsList=jsonDecode(result.toString());
   // print("****************\n\n\n${result.data["results"][2]}\n\n\n");
    //print("****************\n\n\n${result.data["results"][2]['media'][0]['']}\n\n\n");
   // print("****************\n\n\n${result.data["results"][0]['abstract']}\n\n\n");

    // List<dynamic> metaDataListe=result.data["results"][0]['media'][0]['media-metadata'];
    // List<dynamic> medyaListe=result.data["results"][0]['media'];
    // print(medyaListe);
    // print(metaDataListe);
    /**
     * result.data["results"] = result ile gelen bilgilerin .data ile çekilen datalarından oluşan
     * Map'in içindeki 'results' key'inin value'ları
     */

    List<dynamic> _liste = result.data["results"];
    print(_liste.length);
    /**
     * Some values are not getting as supposed to be,
     * so i declared the values which I need as manually.
     * And in order not to get an error due to some data being null,
     * I enter the number manually instead of _list.length
     */
    for(int i = 0; i < 8; i++){
      _list.add(dto_news(
         id: result.data["results"][i]['id'],
         title: result.data["results"][i]['title'],
         byline: result.data["results"][i]['byline'],
         // media: result.data["results"][i]['media'],
         welcomeAbstract: result.data["results"][i]['abstract'],
         publishedDate: result.data["results"][i]['published_date'],
         uri:result.data["results"][i]['media'][0]['media-metadata'][0]['url'],
        updated: DateTime.parse(result.data["results"][i]['published_date']),
      ));
    }
    // I used the uri variable as image url from media -> first media-matadata -> first url.
    // I used the published_date as string and updated is published_date's datetime version.

    // sorting by published date
    // _list.sort((a, b) => b.publishedDate.compareTo(a.publishedDate)); // string
    _list.sort((a, b) => b.updated.compareTo(a.updated)); // datetime

    print("****************\n\n\n ${_list}");
    log("+++++++++\n\n  ${_list}  +++++++++\n\n"); // It allows us to see all the incoming data in the console.

    return _list;

    /*
    var newsList=jsonDecode(result.data['results']);
    print("xxxxx");
    print(newsList);
    if(newsList is List)
      print("evet bu bir liste");
    print("sonuç: ");
    print(newsList['results'].toString());

    _list=newsList.map((e) => dto_news.fromJson(e as Map<String, dynamic>)).toList();

    print(_list.first.toString());
    print("adet: "+_list.length.toString());
    print(_list);
     */

  }
}