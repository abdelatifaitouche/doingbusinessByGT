import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/controllers/text_size_controller.dart';
import 'package:doingbusiness/views/pages/pdf_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';

class ArticleDetailsBody extends StatefulWidget {
  final DocumentSnapshot article;

  const ArticleDetailsBody({super.key, required this.article});

  @override
  State<ArticleDetailsBody> createState() => _ArticleDetailsBodyState();
}

class _ArticleDetailsBodyState extends State<ArticleDetailsBody>
    with SingleTickerProviderStateMixin {
  double? _progress;
  final TextSizeController controller = Get.put(TextSizeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          AssetImage('assets/images/logo_gt_finale.png')),
                  const SizedBox(width: 10),
                  Text(
                    'Grant Thornton',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() => Row(
                          children: [
                            InkWell(
                              onTap: controller.add,
                              child: Icon(Icons.add_circle_outline,
                                  color: primaryColor),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              controller.font_size.value.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            InkWell(
                              onTap: controller.reduce,
                              child: Icon(Icons.remove_circle_outline,
                                  color: primaryColor),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              _progress != null
                  ? const CircularProgressIndicator(
                      backgroundColor: primaryColor,
                      color: Colors.white,
                    )
                  : InkWell(
                      onTap: () async {
                        final String url = widget.article['article'];
                        FileDownloader.downloadFile(
                            url: url,
                            onProgress: (name, progress) {
                              setState(() {
                                _progress = progress;
                              });
                            },
                            onDownloadCompleted: (value) {
                              setState(() {
                                _progress = null;
                              });
                            });
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: primaryColor),
                          child: const Icon(
                            Icons.download,
                            color: Colors.white,
                            size: 22,
                          )),
                    ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Obx(
            () => Text(
              widget.article['blog'],
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: controller.font_size.toDouble(),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Continue a Lire',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 22,
                        height: 0.9,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'GT')),
                InkWell(
                  onTap: () async {
                    Get.to(PdfViewScreen(pdfPath: widget.article['article']));
                  },
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: primaryColor),
                      child: const Icon(
                        Icons.play_circle_fill_outlined,
                        color: Colors.white,
                        size: 22,
                      )),
                ),
              ],
            ),
          )

          //ADD SUGGESTION BOXES HERE
        ],
      ),
    );
  }
}
