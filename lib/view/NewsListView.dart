import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:most_popular_mobile/controller/NewsController.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../core/util/Constants.dart';
import '../assets/style/OurColors.dart';
import '../assets/style/OurTextStyle.dart';
import '../core/util/PrototypeUtil.dart';
import '../model/dto_news.dart';
import '../widget/PrimaryWidgets.dart';
import '../../widget/EmptyDataWidget.dart';

class NewsListView extends StatefulWidget {
  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  NewsController neswCtrl;
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    //neswCtrl = Get.put<NewsController>(NewsController());
   neswCtrl = Get.find<NewsController>();
    neswCtrl.getNewsList();
  }

  void _getAkis({isRefresh = false}) async {
    await neswCtrl.getNewsList(isRefresh: isRefresh);
  }
  void _onRefreshPage() async {
    await _getAkis(isRefresh: true);
    _refreshController.refreshCompleted();
    _refreshController.loadComplete(); // loadNoData iptal olması için eklendi.
  }

  void _onLoadPage() async {
    await _getAkis();
    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PrimaryWidgets().primaryAppBar(context,"The New York Times", isMenu: true, isBack: false),
      body: Container(
        child: GetX<NewsController>(
          builder: (controller){

            var itm = controller.newsListe_STATUS.value;
            int itemCount = controller.newsListe.value.length;

            return SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
              onRefresh:  _onRefreshPage,
              onLoading: _onLoadPage,
              child: ListView.builder(
                // padding:  EdgeInsets.only(bottom: 80),
                itemCount: itemCount,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  var model = controller.newsListe.value[index];
                  if (model.id == -1){
                    return Column(
                      children: [
                        if (itm == networkState.loading && itemCount == 1)
                          Center(child: CircularProgressIndicator(),heightFactor: 8,),
                        if (itm == networkState.success && itemCount == 1)
                          EmptyDataWidgets().EmptyData1Widget_noScroll(context,
                            title: "Hiç Kayıt Bulunamadı !!",
                            desc: "Lütfen tekrar deneyiniz.",
                          ),
                      ],
                    );
                  }
                  return buildNewsCard(model: model,size:size);
                },
              ),
            );
          },
        ),
      ),
    );
  }
  Widget buildNewsCard({dto_news model,Size size}){
    String logo=model.media.first.mediaMetadata[0].url;
    return InkWell(
      onTap: (){
       // Get.toNamed(routeNewsDetail.replaceAll(':id', model.id.toString()));
      },
      child: Container(
        height:100,
        decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: gri,
                width: .5,
              ),
            )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(160),
                  child: Image.asset("lib/assets/img/bg/bg_mavi.jpg", fit: BoxFit.cover,width: 70,height: 70,),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(model.title,style: siyahText18,),
                    SizedBox(height: 6,),
                   // Text(toDateTimeFormat_ProcessTime(model.publishedDate), style: TextStyle(color: Colors.black54),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
