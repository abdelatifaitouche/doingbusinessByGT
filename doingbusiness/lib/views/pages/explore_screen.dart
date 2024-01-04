import 'package:doingbusiness/views/pages/news_page.dart';
import 'package:doingbusiness/views/widgets/explore_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final headlines = ['News', 'AFC', 'Laws', 'Solic'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Explore',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'GT')),
                      Icon(
                        Icons.search,
                        color: Color(0XFF4f2d7f),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      InkWell(
                        onTap: () => Get.to(const NewsScreen()),
                        child: const ExploreWidget(text: 'Articles'),
                      ),
                      const ExploreWidget(text: 'Newsletters'),
                      const ExploreWidget(text: 'Training'),
                      const ExploreWidget(text: 'Recruitment'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
