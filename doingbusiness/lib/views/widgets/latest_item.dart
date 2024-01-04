import 'package:flutter/material.dart';

class LatestItem extends StatelessWidget {
  const LatestItem(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 30,
              offset: Offset(-5, -5),
              color: Colors.white,
            ),
            BoxShadow(
                blurRadius: 10,
                offset: Offset(5, 5),
                color: Color.fromARGB(255, 201, 202, 206)),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              image,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  softWrap: false,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 200,
                  child: Text(title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 0.9)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
