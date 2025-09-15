import 'package:assignment_app/models/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleDetailsView extends StatelessWidget {
  final ArticleModel model = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Article Details")),
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
            
        }),
      ),
    );
  }
}
