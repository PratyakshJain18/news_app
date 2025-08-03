class NewsModel
{
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String date;
  final String url;
  NewsModel({required this.url, required this.date ,required this.urlToImage, required this.author , required this.title , required this.description});

  factory NewsModel.fromJson(Map<String , dynamic> json){
   return NewsModel(
       author: json['author'] ?? 'No Author',
       title: json['title'] ?? 'No Title',
       description: json['description'] ?? 'No Description',
       urlToImage: json['urlToImage'] ?? 'No Image',
       date: json['publishedAt'] ?? 'Not Available',
       url: json['url'] ?? 'Not Found'
   );

  }
}