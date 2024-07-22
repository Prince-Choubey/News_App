import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Pages/ArticalPage/Widgets/SearchWidget.dart';
import 'package:news_app/Pages/HomePage/Widgets/NewsTile.dart';
import 'package:news_app/Pages/NewsDetails/NewsDetails.dart';

class ArticalPage extends StatelessWidget {
  const ArticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    Newscontroller newscontroller = Get.put(Newscontroller());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "ARTICLES",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const SearchWidget(),
              const SizedBox(
                height: 20,
              ),
              Obx(() => Column(
                children: newscontroller.newsForYouList.map((e) =>
                    NewsTile(imageUrl: e.urlToImage ?? "https://techcrunch.com/wp-content/uploads/2023/07/GettyImages-942480316.jpg?resize=1200,835", title: e.title ?? "No Title", time: e.publishedAt!, author: e.author ?? "UnKnown", onTap: () {
                      Get.to(NewsDetails(news: e,));
                    })
                ).toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

