import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/controllers/content_controlle.dart';
import 'package:doingbusiness/views/pages/article_details.dart';
import 'package:doingbusiness/views/pages/saved_articles.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../widgets/custom_carousel_slider.dart';
import '../widgets/latest_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ContentController controller = Get.put(ContentController());
  late Stream<QuerySnapshot> articleStream;
  @override
  void initState() {
    super.initState();
    controller.getContent();
  }

  Future<void> _handlerefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidPullToRefresh(
        onRefresh: _handlerefresh,
        color: primaryColor,
        height: 200,
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('DoingBusiness in Algeria',
                          style: TextStyle(
                              fontSize: 23,
                              height: 1.1,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'GT')),
                      GestureDetector(
                        onTap: () {
                          Get.to(SavedArticles());
                        },
                        child: Icon(
                          Icons.bookmark_added_sharp,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Today's Topics",
                          style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                  const CustomCarouselSlider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Latest Articles',
                          style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  StreamBuilder(
                      stream: controller.articleStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                DocumentSnapshot article =
                                    snapshot.data!.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(CupertinoPageRoute(
                                              builder: (_) => ArticleDetails(
                                                    article: article,
                                                  )));
                                    },
                                    child: LatestItem(
                                      image: article['image'],
                                      title: article['titre'],
                                      description: article['description'],
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
