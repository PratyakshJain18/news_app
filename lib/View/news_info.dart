import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Controller/home_controller.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:intl/intl.dart';

class NewsInfo extends GetView {
  NewsInfo({super.key, required this.article});
  final NewsModel article;
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        backgroundColor: Color(0xFF607D8B),
        shadowColor: Colors.black,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                article.urlToImage,
                width: MediaQuery.of(context).size.width,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     article.title,
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            //   ),
            // ),
            Text("Author: ${article.author}"),
            Text(
              "Date Of Publishing: ${controller.formattedDate(article.date)}",
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.description,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50,),
            InkWell(
              onTap: (){controller.launchArticle(article.url);},
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF607D8B),
                  borderRadius: BorderRadius.circular(20)
                ),
                width: (MediaQuery.of(context).size.width/2)+60.0,
                height: 70,
                child: Center(child: Text("Click Here To Read Full Article " , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),)),
              
              ),
            )
          ],
        ),
      ),
    );
  }
}
