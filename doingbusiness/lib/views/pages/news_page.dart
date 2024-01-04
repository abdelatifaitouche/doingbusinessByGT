import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doingbusiness/controllers/content_controlle.dart';
import 'package:doingbusiness/views/pages/article_details.dart';
import 'package:doingbusiness/views/widgets/latest_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  ContentController controller = Get.put(ContentController());

  @override
  void initState() {
    super.initState();
    controller.getContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Parcourez nos articles',
                        style: TextStyle(
                            fontSize: 28,
                            height: 0.9,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'GT')),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 50,
                ),
                StreamBuilder(
                    stream: controller.articleStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
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
    );
  }
}
