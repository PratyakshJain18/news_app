import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/home_controller.dart';
import 'package:news_app/View/news_info.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:shimmer/shimmer.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        centerTitle: true,
        backgroundColor: Color(0xFF607D8B),
        shadowColor: Colors.black,
        elevation: 10,
      ),
      body: Container(
        color: Color(0xFFECEFF1)	,
        child: FutureBuilder<List<NewsModel>>
          (
            future: controller.fetchNews(),
            builder: (context , snapshot)
            {
              if(snapshot.hasData)
                {
                  final allNews=snapshot.data;
                  return ListView.builder(
                      itemCount: allNews!.length,
                      itemBuilder: (context , index)
                      {
                        final article = allNews[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: (){
                                Get.to(() => NewsInfo(article: article));
                              },
                              child: ListTile(
                                leading:  Container(
                                  width: 50,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(article.urlToImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text("${index+1}. ${article.title}" ,style: TextStyle(color: Color(0xFF263238)	),),
                                subtitle: Text(article.author),
                              ),
                            ),
                          ),
                        );
                      }
                  );
                }
              else if(snapshot.hasError)
                {
                  print(snapshot.error);
                  return Center(child: SelectableText("${snapshot.error}"));
                }
              else
                {
                  return Center(child: CircularProgressIndicator());
                }
            }
        ),
      ),
    );
  }
}
