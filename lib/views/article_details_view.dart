import 'package:assignment_app/controllers/download_controller.dart';
import 'package:assignment_app/models/article_model.dart';
import 'package:assignment_app/routes/app_pages.dart';
import 'package:assignment_app/utils/api_endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleDetailsView extends StatelessWidget {
  final ArticleModel model = Get.arguments;
  final DownloadController downloadController = Get.find<DownloadController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Article Details"),
      actions: [
        IconButton(onPressed: (){
          Get.toNamed( Routes.SETTINGS_VIEW);
        }, icon: Icon(Icons.settings))
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text("${model.title}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
            Divider(
              thickness: 5,
              color: Colors.grey,
            ),
            Text("${model.body}",
                style: TextStyle(
                    fontSize: 16,
                )),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(Icons.download, color: Colors.white,),
            onPressed: (){
            showAskDownloadDialog();
        }),
      ),
    );
  }
  //ASK DOWNLOAD
  void showAskDownloadDialog(){
    Get.defaultDialog(
      title: "Download PDF File",
      middleText: "Do you want to download the PDF file?",
        textConfirm: "Download",
      textCancel: "Cancel",
      onConfirm: (){
        Get.back();
        showDownloadingProgressDialog();
        downloadController.downloadPdf(
            ApiEndpoints.PDF_URL,
            "AzmirPDF.pdf"
        );
      }
    );
  }
  //DOWNLOADING PROGRESS
  void showDownloadingProgressDialog(){
    Get.defaultDialog(
        title: "Downloading...",
        barrierDismissible: false,
        content: Column(
          children: [
            Obx((){
              return LinearProgressIndicator(
                  value: downloadController.progress.value
              );
            }),
            Obx((){
              return Text("${(downloadController.progress.value*100).toStringAsFixed(0)} %");
            })
          ],
        )
    );
  }
}
