import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:most_popular_mobile/core/services/nyt.api.dart';
import 'package:most_popular_mobile/model/dto_news.dart';
import 'package:most_popular_mobile/view/NewsDetailView.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../assets/style/OurColors.dart';
import '../assets/style/OurTextStyle.dart';
import '../core/util/PrototypeUtil.dart';
import '../main.dart';
import '../widget/PrimaryWidgets.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<List<dto_news>> _newsListFuture;
  int page=1;
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  final scrllCtrl =ScrollController();

  @override
  void initState() {
    super.initState();
    _newsListFuture=NewsApi.getNewsData(page: page);
    scrllCtrl.addListener(listenScrolling);
  }
  void listenScrolling(){
    if(scrllCtrl.position.atEdge){
      final isTop=scrllCtrl.position.pixels==0;
      if(!isTop){
        print("sayfa sonuna geldiniz.");
        setState(() {
          page=7;
          _newsListFuture=NewsApi.getNewsData(page: 7);

        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryWidgets().primaryAppBar(context,"NY Times Most Popular", isMenu: true, isBack: false),
      body:FutureBuilder<List<dto_news>>(
        future: _newsListFuture,
        builder: (context, snapshot)
        {
          if(snapshot.hasData){
            List<dto_news> _listem=snapshot.data;

            return ListView.builder(
              controller: scrllCtrl,
              itemCount: _listem.length,
              itemBuilder: (context,index){
                var model =_listem[index];
                return buildNewsCard(model);
              },
            );
          }else if(snapshot.hasError){
            return Center(
              child: Text("veri yok veyaz çok fazla istek gönderildi."),
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      )
    );
  }
  Widget buildNewsCard(dto_news model){
    return InkWell(
      onTap: (){
        // Get.toNamed(routeNewsDetail.replaceAll(':id', model.id.toString()));
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>NewsDetailView(model:model)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  child: Hero(
                    tag: model.id,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(160),
                        child: Image.network(model.uri,)),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if("${model.title}"!=null)
                      Text("${model.title}",style:siyahText18.copyWith(overflow:
                      TextOverflow.ellipsis,color: yesilK.shade700),
                        overflow: TextOverflow.ellipsis,maxLines: 2,
                        textAlign: TextAlign.justify,),
                      SizedBox(height: 10,),
                      if("${model.welcomeAbstract}"!=null)
                      Text("${model.welcomeAbstract}",style:siyahText16.copyWith(overflow:
                      TextOverflow.ellipsis,color: yesilK.shade500),
                        overflow: TextOverflow.ellipsis,maxLines: 1,
                        textAlign: TextAlign.justify,),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            child: Text("${model.byline}",style:siyahText16.copyWith(overflow:
                            TextOverflow.ellipsis,color: yesilK.shade500),
                              overflow: TextOverflow.ellipsis,maxLines: 1,
                              textAlign: TextAlign.justify,),
                          ),
                          Row(
                            children: [
                              Icon(Icons.date_range,size: 16,color: yesilK.shade500,),
                              SizedBox(width: 5,),
                              Text("${model.publishedDate}",style: siyahText16.copyWith(color: yesilK.shade500),),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Icon(Icons.chevron_right),
              ],
            ),
            SizedBox(height: 6,),
            Divider(color: yesilK.shade200,thickness: .3,indent: 10,endIndent: 10,),
         //    Text('${model.updated.day} ${aylar[model.updated.month]} ${model.updated.year}',
           //    style: TextStyle(color: Colors.black54),)
            // Text(toDateTimeFormat_ProcessTime(model.updated), style: TextStyle(color: Colors.black54),),

          ],
        ),
      ),
    );
  }
}
