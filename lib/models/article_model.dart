class ArticleModel{
  final int userId;
  final int id;
  final String title;
  final String body;

  ArticleModel({required this.userId, required this.id, required this.title, required this.body});

  factory ArticleModel.fromjson(Map<String,dynamic> json){
    return ArticleModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']
    );
  }

  Map<String, dynamic> tojson(){
    return {
      "userId": userId,
      "id": id,
      "title": title,
      "body": body
    };
  }
}