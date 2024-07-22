import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/NewsModel.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Newscontroller extends GetxController {

 RxList<NewsModel> trandingNewsList = <NewsModel>[].obs;
 RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
 RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
 RxList<NewsModel> healthNewsList = <NewsModel>[].obs;
 RxList<NewsModel> health5News = <NewsModel>[].obs;
 RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
 RxList<NewsModel> tesla5News = <NewsModel>[].obs;
 RxList<NewsModel> businessNewsList = <NewsModel>[].obs;
 RxList<NewsModel> business5News = <NewsModel>[].obs;

 RxBool isTrendingLoading = false.obs;
 RxBool isNewsForULoading = false.obs;
 RxBool isTeslaLoading = false.obs;
 RxBool isHealthLoading = false.obs;
 RxBool isBusinessLoading = false.obs;
 RxBool isSpeaking = false.obs;


 FlutterTts flutterTts = FlutterTts();


 @override
  void onInit() async{
   getTrendingNews();
   getNewsForYou();
   getAppleNews();
   getTeslaNews();
   getBusinessNews();
   super.onInit();
 }

  Future<void> getTrendingNews() async{
   isTrendingLoading.value =true;
    var baseUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";
    try{
      var response = await http.get(Uri.parse(baseUrl));
      print(response);
      if(response.statusCode == 200){
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for(var news in articals){
          trandingNewsList.add(NewsModel.fromJson(news));
        }
      }else{
        print("Something went Wrong in Trending News.");
      }
    }catch(e){
      print(e);
    }
   isTrendingLoading.value =false;
  }

 Future<void> getNewsForYou() async{
   isNewsForULoading.value = true;
   var baseUrl = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=9ca469652229489bbd56c81012a456d6";
   try{
     var response = await http.get(Uri.parse(baseUrl));
     print(response);
     if(response.statusCode == 200){
       print(response.body);
       var body = jsonDecode(response.body);
       var articals = body["articles"];
       for(var news in articals){
         newsForYouList.add(NewsModel.fromJson(news));
       }
       newsForYou5.value = newsForYouList.sublist(0, 5).obs;
     }else{
       print("Something went Wrong in Trending News.");
     }
   }catch(e){
     print(e);
   }
   isNewsForULoading.value = false;
 }

 Future<void> getAppleNews() async{
   isHealthLoading.value = true;
   var baseUrl = 'https://saurav.tech/NewsAPI/top-headlines/category/health/in.json';
   try{
     var response = await http.get(Uri.parse(baseUrl));
     print(response);
     if(response.statusCode == 200){
       print(response.body);
       var body = jsonDecode(response.body);
       var articals = body["articles"];
       for(var news in articals){
         healthNewsList.add(NewsModel.fromJson(news));
       }
       health5News.value = healthNewsList.sublist(0, 5).obs;
     }else{
       print("Something went Wrong in Trending News.");
     }
   }catch(e){
     print(e);
   }
   isHealthLoading.value = false;
 }

 Future<void> getTeslaNews() async{
   isTeslaLoading.value = true;

   var baseUrl = "https://newsapi.org/v2/everything?q=tesla&from=2024-06-18&sortBy=publishedAt&apiKey=9ca469652229489bbd56c81012a456d6";
   try{
     var response = await http.get(Uri.parse(baseUrl));
     print(response);
     if(response.statusCode == 200){
       print(response.body);
       var body = jsonDecode(response.body);
       var articals = body["articles"];
       for(var news in articals){
         teslaNewsList.add(NewsModel.fromJson(news));
       }
       tesla5News.value = teslaNewsList.sublist(0, 5).obs;
     }else{
       print("Something went Wrong in Trending News.");
     }
   }catch(e){
     print(e);
   }
   isTeslaLoading.value = false;
 }
 Future<void> getBusinessNews() async{
   isBusinessLoading.value = true;
   var baseUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=9ca469652229489bbd56c81012a456d6";
   try{
     var response = await http.get(Uri.parse(baseUrl));
     print(response);
     if(response.statusCode == 200){
       print(response.body);
       var body = jsonDecode(response.body);
       var articals = body["articles"];
       for(var news in articals){
         businessNewsList.add(NewsModel.fromJson(news));
       }
       business5News.value = businessNewsList.sublist(0, 5).obs;
     }else{
       print("Something went Wrong in Trending News.");
     }
   }catch(e){
     print(e);
   }
   isBusinessLoading.value =false;
 }

 Future<void> searchNews(String search) async{
   isNewsForULoading.value = true;
   var baseUrl = "https://newsapi.org/v2/everything?q=$search&apiKey=9ca469652229489bbd56c81012a456d6";
   try{
     var response = await http.get(Uri.parse(baseUrl));
     print(response);
     if(response.statusCode == 200){
       print(response.body);
       var body = jsonDecode(response.body);
       var articals = body["articles"];
       newsForYouList.clear();
       int i = 0;
       for(var news in articals){
         i++;
         newsForYouList.add(NewsModel.fromJson(news));
         if(i == 10) {
           break;
         }
       }

     }else{
       print("Something went Wrong in Trending News.");
     }
   }catch(e){
     print(e);
   }
   isNewsForULoading.value =false;
 }

 Future<void> speak(String text) async{
   isSpeaking.value = true;
   await flutterTts.setLanguage("en-US");
   await flutterTts.setPitch(1);
   await flutterTts.setSpeechRate(0.4);
   await flutterTts.speak(text);
   flutterTts.setCompletionHandler((){
     isSpeaking.value = false;
   });

 }

 void stop() async{
   await flutterTts.stop();
   isSpeaking.value = false;
 }


}