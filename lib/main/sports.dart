import 'package:flutter/material.dart';
import 'package:news/main/politics.dart';
import 'package:news/main/technology.dart';
import 'package:news/services/api_service.dart';

import '../components/customListTile.dart';
import '../main.dart';
import '../model/article_model.dart';
import 'entertainment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SportPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SportPage extends StatefulWidget {
  const SportPage({super.key});

  @override
  State<SportPage> createState() => _SportPageState();
}

class _SportPageState extends State<SportPage> {
  SportsApi client = SportsApi();
  var _category = 'Sports';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        //create category list
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              underline: Container(),
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              value: _category,
              items: [
                'Business',
                'Entertainment',
                'Sports',
                'Technology',
                'Politics'
              ].map((String category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _category = value!;
                });
                print(_category);
                //redirect to new page
                if (value == 'Technology') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TechPage(),
                    ),
                  );
                }
                if (value == 'Sports') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SportPage(),
                    ),
                  );
                }
                if (value == 'Entertainment') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EntertainmentPage(),
                    ),
                  );
                }
                if (value == 'Business') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                }
                if (value == 'Politics') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PoliticsPage(),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: client.getArticles(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
