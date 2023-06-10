import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widget/PrimaryWidgets.dart';

class TestListView extends StatefulWidget {
  @override
  _TestListViewState createState() => _TestListViewState();
}

class _TestListViewState extends State<TestListView> {
  int page=1;
  List posts=[];
  final scrllCtrl =ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrllCtrl.addListener(listenScrolling);
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryWidgets().primaryAppBar(context,"NY Times Most Popular", isMenu: true, isBack: false),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context,index){
        final post=posts[index];
        final title=post["results"]["title"];
          return ListTile(
            title: Text(index.toString()),
          );
      }),
    );
  }

  Future<void> getPosts()async{
    print("++++++++++getPosts+++++++++");
    String _url='http://api.nytimes.com/svc/mostpopular/v2/viewed/${page}.json?api-key=AXsHq5t4NUY9GAsaSLMkrVsenRSAvNCl';
    print(_url);
    final uri=Uri.parse(_url);
    final response=await http.get(uri);
    if(response.statusCode==200){
      print("200 başarılı");
      final json=(response.body) as List;
      print('**\n\n $json \n\n**');
      setState(() {
        posts=json;
        print(posts.length);
      });
    }else{
      print('beklenmeyen cevap');
    }

  }

  void listenScrolling(){
    print("listenScrolling called");
    if(scrllCtrl.position.atEdge){
      final isTop=scrllCtrl.position.pixels==0;
      if(!isTop){
        print("sayfa sonuna geldiniz.");
        setState(() {
          page=7;
          getPosts();
        });
      }
    }
  }
}
