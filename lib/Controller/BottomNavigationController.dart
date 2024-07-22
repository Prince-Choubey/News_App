import 'package:get/get.dart';
import 'package:news_app/Pages/HomePage.dart';
import 'package:news_app/Pages/ArticalPage/ArticalPage.dart';
import 'package:news_app/Pages/Profile/ProfilePage.dart';
class BottomNavController extends GetxController{

  RxInt index = 0.obs;

  var pages = [
    const Homepage(),
    const ArticalPage(),
    const ProfilePage()
  ];

}