import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:most_popular_mobile/model/dto_news.dart';
import 'package:most_popular_mobile/model/dto_pokemon.dart';

class NewsApi{
  // NEWS
  static const String _url='http://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=AXsHq5t4NUY9GAsaSLMkrVsenRSAvNCl';
  static Future<List<dto_news>> getNewsData() async{
    List<dto_news> _list=[];
    var result = await Dio().get(_url);
    //Map<String,dynamic> newsList= new Map<String,dynamic>.from(jsonDecode(result.toString()));
    //var newsList=jsonDecode(result.toString());
   // print("****************\n\n\n${result.data["results"][2]}\n\n\n");
    //print("****************\n\n\n${result.data["results"][2]['media'][0]['']}\n\n\n");
   // print("****************\n\n\n${result.data["results"][0]['abstract']}\n\n\n");

    /**
     * result.data["results"] = result ile gelen bilgilerin .data ile çekilen datalarından oluşan
     * Map'in içindeki 'results' key'inin value'ları
     */
    List<dynamic> _liste = result.data["results"];
    List<dynamic> metaDataListe=result.data["results"][0]['media'][0]['media-metadata'];
    List<dynamic> medyaListe=result.data["results"][0]['media'];
   // print(medyaListe);
   // print(metaDataListe);
    print(_liste.length);
    // Bazı verilerin null gelmesinden dolayı hata almamak için manuel olarak 18 girdim
    for(int i = 0; i < 5; i++){
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
     _list.sort((a, b) => b.publishedDate.compareTo(a.publishedDate));
   // print("sıralama işlemi");
   // _list.sort((a,b){
   //   // int aDate = DateTime.parse(a.publishedDate ?? '').microsecondsSinceEpoch;
   //   // int bDate = DateTime.parse(b.publishedDate ?? '').microsecondsSinceEpoch;
   //   // print(aDate.toString());
   //   // print(bDate.toString());
   //   // return bDate.compareTo(aDate);
   //   print(a.updated);
   //   print(b.updated);
   //   return b.title.compareTo(a.title);
   // });
   // for(int x=0;x <= _list.length;x++){
   //   _list[x].media[x].mediaMetadata.add(MediaMetadatum(
   //     url: metaDataListe[0].url,
   //     height: metaDataListe[0].height,
   //     width: metaDataListe[0].width,
   //   ));
   // }
    print("****************\n\n\n ${_list}");



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



    return _list;
  }

 // static Future<dto_news> getOneNewsData(int id)async{
 //  Future<List<dto_news>> _liste=  getNewsData();
 //  dto_news result;
 // }

  // POKEMON
  static const String _url_pokedex='https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json';
  static Future<List<dto_pokemon>> getPokemonData() async{
    print("POKEMON");
    List<dto_pokemon> _list=[];
    var result = await Dio().get(_url_pokedex);
    var newsList=jsonDecode(result.data)['pokemon'];
    print("xxxxx");
    print(newsList);
    if(newsList is List){
      print("evet bu bir liste");
    }
    print("liste");
   // print(newsList['pokemon'].toString());

    _list=newsList.map((e) => dto_pokemon.fromJson(e)).toList();

    print(_list.first.toString());
    print("adet: "+_list.length.toString());
    print(_list);
    return _list;
  }
}