import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:most_popular_mobile/model/dto_news.dart';

 class NewsService {

   Future<List<dto_news>> getNews({int page=1}) async {
     // page can be just 1,7 and 30.
     String url='http://api.nytimes.com/svc/mostpopular/v2/viewed/${page}.json?api-key=AXsHq5t4NUY9GAsaSLMkrVsenRSAvNCl';
     try {
       print("News Service");
       final response = await http.get(Uri.parse(url));
       print("Servis response: "+response.toString());
       //return dto_news.fromJson(jsonDecode(response.body));
       // return dto_news.fromJson((response.body));
       return (response as List).map((e) => dto_news.fromJson(e)).toList();
     } catch (e) {
       print("NewsService -> getNews-- hata:");
       print(e.toString());
     }
   }

 }
//http://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=AXsHq5t4NUY9GAsaSLMkrVsenRSAvNCl