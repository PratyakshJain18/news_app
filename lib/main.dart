import 'package:flutter/material.dart';
import 'package:news_app/Controller/home_controller.dart';
import 'package:news_app/View/home_view.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
  Get.lazyPut<HomeController>(()=> HomeController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeView(),
    );
  }
}

