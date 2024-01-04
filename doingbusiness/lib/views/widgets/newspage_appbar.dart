import 'package:doingbusiness/constants.dart';
import 'package:flutter/material.dart';

class NewsPageAppBar extends StatelessWidget {
  const NewsPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return SliverAppBar(
      backgroundColor: primaryColor,
      expandedHeight: size.height * 0.2,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            const Positioned.fill(
              child: Image(
                image: AssetImage('assets/images/intro1.png'),
                fit: BoxFit.cover,
              ),
            ),
            const Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.06,
              left: 15,
              child: const Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      'News page',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        stretchModes: const [StretchMode.blurBackground, StretchMode.zoomBackground],
      ),
      pinned: true,
      collapsedHeight: size.height * 0.1,
      bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: SizedBox(
            height: 30,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(36),
                ),
              ),
            ),
          )),
    );
  }
}
