import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Model/NewsModel.dart';
import 'package:lottie/lottie.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    Newscontroller newscontroller = Get.put(Newscontroller());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        child: const Row(
                          children: [
                            Icon(Icons.arrow_back),

                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                     Text("News Details",style: Theme.of(context).textTheme.headlineMedium,)
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            news.urlToImage ??
                                "https://techcrunch.com/wp-content/uploads/2023/05/GettyImages-1142304853-a.jpg?resize=1200,675",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  news.title ?? "No Title",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "${news.author} *${news.publishedAt}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelSmall,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Text(
                        news.author![0],
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        news.author ?? "UnKnown",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .secondaryContainer),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Obx(() =>
                      newscontroller.isSpeaking.value ? IconButton(
                        onPressed: () {
                          newscontroller.flutterTts.stop();
                          newscontroller.isSpeaking.value = false;
                        },
                        icon: const Icon(
                          Icons.stop_rounded,
                          size: 50,
                        ),
                      ):
                      IconButton(
                        onPressed: () {
                          newscontroller.speak(news.description ?? "No Description");
                        },
                        icon: const Icon(
                          Icons.play_arrow_rounded,
                          size: 50,
                        ),
                      ),),
                      Expanded(
                        child: Obx(() => Lottie.asset(
                          "assets/Animation/wave.json",
                          height: 70,
                          animate: newscontroller.isSpeaking.value,
                        ),)
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  news.description ?? "No Description",
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondaryContainer),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
