import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/NewsScreen/controller.dart';
import 'package:news_app/NewsScreen/model.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<News>(
        future: getData(),
        builder: (context, snapshot) {
          News news = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      news.articles.length,
                      (index) => Card(
                            child: Column(
                              children: [
                                Text(
                                  news.articles[index].author,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                                Image.network(
                                  news.articles[index].urlToImage,
                                  width: 400,
                                  height: 400,
                                ),
                                Text(news.articles[index].description)
                              ],
                            ),
                          )),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          } else {
            return Text("error getting data");
          }
        },
      ),
    );
  }
}
