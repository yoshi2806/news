import 'package:flutter/material.dart';
import 'package:news/model/article_model.dart';

class ArticlePage extends StatelessWidget {
  final Article article;
  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(article.title ?? ''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(article.urlToImage ?? ''),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(article.source!.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      )),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  article.description ?? '',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  article.content!,
                ),
              ]),
        ));
  }
}
