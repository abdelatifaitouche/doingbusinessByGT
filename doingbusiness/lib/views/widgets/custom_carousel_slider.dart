import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doingbusiness/models/article.dart';
import 'package:doingbusiness/views/pages/article_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});
  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  late Stream<QuerySnapshot> imageStream;
  int currentslide = 0;
  CarouselController carouselController = CarouselController();
  @override
  void initState() {
    super.initState();
    var firebase = FirebaseFirestore.instance;
    imageStream = firebase.collection("Articles").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 300,
            width: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream: imageStream,
              builder: (_, snapshot) {
                if (snapshot.hasData && snapshot.data!.docs.length > 1) {
                  return CarouselSlider.builder(
                    carouselController: carouselController,
                    itemCount: 3,
                    itemBuilder: (_, index, ___) {
                      DocumentSnapshot sliderImage = snapshot.data!.docs[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(ArticleDetails(article: sliderImage));
                        },
                        child: Container(
                            margin: const EdgeInsets.all(1.0),
                            child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                                child: Stack(
                                  children: <Widget>[
                                    Image.network(sliderImage['image'],
                                        fit: BoxFit.contain, width: 1000.0),
                                    Positioned(
                                      bottom: 0.0,
                                      left: 0.0,
                                      right: 0.0,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(200, 0, 0, 0),
                                              Color.fromARGB(0, 0, 0, 0)
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 5.0),
                                        child: Text(
                                          sliderImage['titre'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, _) {
                        setState(() {
                          currentslide = index;
                        });
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
        AnimatedSmoothIndicator(
          activeIndex: currentslide,
          count: 3,
          effect: const ExpandingDotsEffect(
            dotColor: Color.fromARGB(255, 144, 116, 182),
            activeDotColor: Color(0XFF4f2d7f),
          ),
        ),
      ],
    );
  }
}
