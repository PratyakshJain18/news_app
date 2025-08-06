import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../View/web_view_page.dart';

class HomeController extends GetxController {
  late final WebViewController webViewController;
  Future<List<NewsModel>> fetchNews() async {
    final api = Uri.parse(
      "https://newsapi.org/v2/everything?q=technology&apiKey=4ce6fef38e52440a829b3b05dc6ce363",
    );
    final response = await http.get(api);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> newsList = data['articles'];
      return newsList
          .map((e) => NewsModel.fromJson(e))
          .toList()
          .cast<NewsModel>();
    } else {
      throw Exception("Failed to Load API , Try again Brother");
    }
  }

  String formattedDate(String date) {
    DateTime dateTime = DateTime.parse(date).toLocal();
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }

  void launchArticle(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Could not open article");
    }
  }
  void webLauncher(String url)
  {
    Get.to(()=>WebViewPage(url: url));
  }
}
