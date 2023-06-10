import 'package:flutter/material.dart';
import 'package:most_popular_mobile/assets/style/OurTextStyle.dart';
import 'package:most_popular_mobile/model/dto_news.dart';

import '../assets/style/OurColors.dart';
import '../core/util/PrototypeUtil.dart';
import '../widget/PrimaryWidgets.dart';

class NewsDetailView extends StatelessWidget {

  final dto_news model;
  const NewsDetailView({Key key, this.model}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryWidgets().primaryAppBar(context,'${model.title}', isMenu: false, isBack: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                Text('${model.title}',style: siyahBText18,maxLines: 2, textAlign: TextAlign.justify,),
                SizedBox(height: 10,),
                Container(height: 200,
                child: Hero(
                  tag: model.id,
                  child: Image.network(model.uri,fit: BoxFit.cover,)),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: Text("${model.byline}",style:siyahText16.copyWith(overflow:
                      TextOverflow.ellipsis,color: siyah),
                        overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range,size: 16,color: siyah),
                        SizedBox(width: 5,),
                        Text('${model.updated.day} ${aylar[model.updated.month]} ${model.updated.year}',
                              style: TextStyle(color: siyah,)),
                        //Text("${model.publishedDate}",style: siyahText16.copyWith(color: yesilK.shade500),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text("${model.welcomeAbstract} ${model.welcomeAbstract}",style:siyahText16,
                  textAlign: TextAlign.justify,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
