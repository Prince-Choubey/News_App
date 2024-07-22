import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Components/NavigationBar.dart';
import 'package:news_app/Components/NewsTileLoading.dart';
import 'package:news_app/Components/TrendingLoadingCard.dart';
import 'package:news_app/Controller/HomePageController.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Pages/HomePage/Widgets/NewsTile.dart';
import 'package:news_app/Pages/HomePage/Widgets/TrendingCard.dart';
import 'package:news_app/Pages/NewsDetails/NewsDetails.dart';
import 'package:news_app/Pages/Profile/ProfilePage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Newscontroller newscontroller = Get.put(Newscontroller());
    HomePageController controller = Get.put(HomePageController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(Icons.dashboard),
                  ),
                  Text(
                    "NEWSEEKERS",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const ProfilePage());
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Icon(Icons.person),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => newscontroller.isTrendingLoading.value
                      ? const Row(
                    children: [
                      TrendingLoadingCart(),
                      TrendingLoadingCart(),
                    ],
                  )
                      : Row(
                          children: newscontroller.trandingNewsList
                              .map(
                                (e) => TrendingCart(
                                  onTap: () {
                                    Get.to(NewsDetails(
                                      news: e,
                                    ));
                                  },
                                  imageUrl: e.urlToImage!,
                                  tag: 'Trending no 1',
                                  time: e.publishedAt!,
                                  title: e.title!,
                                  author: e.author ?? "UnKnown",
                                ),
                              )
                              .toList(),
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News for you",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => newscontroller.isNewsForULoading.value
                    ? const Column(
                  children: [
                    NewsTileLoading(),
                    NewsTileLoading(),
                    NewsTileLoading(),
                    NewsTileLoading(),
                  ],
                )
                    : Column(
                        children: newscontroller.newsForYou5
                            .map(
                              (e) => NewsTile(
                                onTap: () {
                                  Get.to(NewsDetails(news: e));
                                },
                                imageUrl: e.urlToImage ??
                                    "https://s.yimg.com/ny/api/res/1.2/uQj_tfsxYeVujWogI77RpQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02MDA-/https://media.zenfs.com/en/the_wall_street_journal_hosted_996/b32f55e6c0d0676cb5213d644f4fb6ef",
                                title: e.title!,
                                time: e.publishedAt!,
                                author: e.author ?? "Unknown",
                              ),
                            )
                            .toList(),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tesla News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => newscontroller.isTeslaLoading.value
                    ?  const Column(
                  children: [
                    NewsTileLoading(),
                    NewsTileLoading(),
                    NewsTileLoading(),
                    NewsTileLoading(),
                  ],
                )
                    : Column(
                        children: newscontroller.tesla5News
                            .map(
                              (e) => NewsTile(
                                onTap: () {
                                  Get.to(NewsDetails(news: e));
                                },
                                imageUrl: e.urlToImage ??
                                    "https://media.wired.com/photos/66980ab11e34d9f33fcf5b28/191:100/w_1280,c_limit/Oura-Ring-Gen3-Abstract-Background-SOURCE-Amazon.jpg",
                                title: e.title ?? "No Title",
                                time: e.publishedAt!,
                                author: e.author ?? "Unknown",
                              ),
                            )
                            .toList(),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Health News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => newscontroller.isHealthLoading.value
                      ? const Row(
                    children: [
                      TrendingLoadingCart(),
                      TrendingLoadingCart(),
                    ],
                  )
                      : Row(
                          children: newscontroller.health5News
                              .map(
                                (e) => TrendingCart(
                                  onTap: () {
                                    Get.to(NewsDetails(
                                      news: e,
                                    ));
                                  },
                                  imageUrl: e.urlToImage ??
                                      "https://media.wired.com/photos/66980ab11e34d9f33fcf5b28/191:100/w_1280,c_limit/Oura-Ring-Gen3-Abstract-Background-SOURCE-Amazon.jpg",
                                  tag: 'Trending no 1',
                                  time: e.publishedAt ?? "",
                                  title: e.title ?? "No Title",
                                  author: e.author ?? "UnKnown",
                                ),
                              )
                              .toList(),
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Business News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => newscontroller.isBusinessLoading.value
                    ? const Column(
                  children: [
                    NewsTileLoading(),
                    NewsTileLoading(),
                    NewsTileLoading(),
                    NewsTileLoading(),
                  ],
                )
                    : Column(
                        children: newscontroller.business5News
                            .map(
                              (e) => NewsTile(
                                onTap: () {
                                  Get.to(NewsDetails(news: e));
                                },
                                imageUrl: e.urlToImage ??
                                    "https://s.yimg.com/ny/api/res/1.2/uQj_tfsxYeVujWogI77RpQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02MDA-/https://media.zenfs.com/en/the_wall_street_journal_hosted_996/b32f55e6c0d0676cb5213d644f4fb6ef",
                                title: e.title!,
                                time: e.publishedAt!,
                                author: e.author ?? "Unknown",
                              ),
                            )
                            .toList(),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
