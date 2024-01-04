import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doingbusiness/views/widgets/article_details_appbar.dart';
import 'package:doingbusiness/views/widgets/article_details_body.dart';
import 'package:flutter/material.dart';

class ArticleDetails extends StatelessWidget {
  final DocumentSnapshot article;

  const ArticleDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  ArticleDetailsAppBar(
                    article: article,
                  ),
                  SliverToBoxAdapter(
                    child: ArticleDetailsBody(
                      article: article,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
