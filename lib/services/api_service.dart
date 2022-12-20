import 'dart:convert';

import 'package:http/http.dart';
import 'package:news/model/article_model.dart';

class ApiService {
  //recieve category and return list of articles
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=business&from=2022-11-19&sortBy=publishedAt&apiKey=2c9d4e88dae2467aadcde6d029262b4b";

  Future<List<Article>> getArticles() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ('Failed to load articles');
    }
  }
}

class TechnologyApi {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=technology&from=2022-11-19&sortBy=publishedAt&apiKey=2c9d4e88dae2467aadcde6d029262b4b";

  Future<List<Article>> getArticles() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ('Failed to load articles');
    }
  }
}

class SportsApi {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=sports&from=2022-11-19&sortBy=publishedAt&apiKey=2c9d4e88dae2467aadcde6d029262b4b";

  Future<List<Article>> getArticles() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ('Failed to load articles');
    }
  }
}

class EntertainmentApi {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=entertainment&from=2022-11-19&sortBy=publishedAt&apiKey=2c9d4e88dae2467aadcde6d029262b4b";

  Future<List<Article>> getArticles() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ('Failed to load articles');
    }
  }
}
class PoliticsApi {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=politics&from=2022-11-19&sortBy=publishedAt&apiKey=2c9d4e88dae2467aadcde6d029262b4b";

  Future<List<Article>> getArticles() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ('Failed to load articles');
    }
  }
}
