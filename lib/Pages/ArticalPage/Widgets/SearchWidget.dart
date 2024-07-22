import 'package:flutter/material.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:get/get.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Newscontroller newscontroller = Get.put(Newscontroller());
    TextEditingController searchController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search news...",
                // prefixIcon: const Icon(Icons.search),
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                border: InputBorder.none,
              ),
            ),
          ),
          Obx(
            () => newscontroller.isNewsForULoading.value
                ? Container(
                    height: 50,
                    padding: EdgeInsets.all(10),
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.primary,
                    ),
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
                  )
                : InkWell(
                    onTap: () {
                      newscontroller.searchNews(searchController.text);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: const Icon(Icons.search),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
