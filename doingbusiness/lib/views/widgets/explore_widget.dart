import 'package:flutter/material.dart';
import '../../constants.dart';

class ExploreWidget extends StatelessWidget {
  final String text;

  const ExploreWidget({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: primaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
