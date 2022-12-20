import 'package:flutter/material.dart';
import 'package:news/model/article_model.dart';

import '../pages/articles_details_page.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => ArticlePage(
            article: article,
          ),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(article.urlToImage ?? 'https://picsum.photos/200/300'), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
            article.title ?? '',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
