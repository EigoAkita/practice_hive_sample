import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:practice_hive_sample/main.dart';
import 'package:practice_hive_sample/state/article.dart';

class ArticlePostingPage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _genderController = TextEditingController();
  final _titleController = TextEditingController();
  final _sentenceController = TextEditingController();

  final _multiKeyList = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  @override
  Widget build(BuildContext context) {
    String getNowDateTime() {
      return DateFormat('y年MM月dd日 kk:mm').format(DateTime.now());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('記事作成'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('名前'),
                articleForm(
                  _nameController,
                  '名前',
                  '山田太郎',
                  _multiKeyList[0],
                ),
                Text('性別'),
                articleForm(
                  _genderController,
                  '性別',
                  '男性',
                  _multiKeyList[1],
                ),
                Text('タイトル'),
                articleForm(
                  _titleController,
                  'タイトル',
                  'タイトル',
                  _multiKeyList[2],
                ),
                Text('本文'),
                articleForm(
                  _sentenceController,
                  '本文',
                  '本文',
                  _multiKeyList[3],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!_multiKeyList[0].currentState!.validate() ||
                            !_multiKeyList[1].currentState!.validate() ||
                            !_multiKeyList[2].currentState!.validate() ||
                            !_multiKeyList[3].currentState!.validate()) {
                          logger.info('未入力項目有');
                        } else {
                          ///HIVEにデータを追加
                          var articleBox = Hive.box('articleBox');
                          articleBox.add(
                            Article(
                              name: _nameController.text,
                              gender: _genderController.text,
                              title: _titleController.text,
                              sentence: _sentenceController.text,
                              isFavorite: false,
                              createdAt: getNowDateTime(),
                            ),
                          );

                          ///最後にテキストエリアを空にする
                          _nameController.text = '';
                          _genderController.text = '';
                          _titleController.text = '';
                          _sentenceController.text = '';
                          Get.back();
                        }
                      },
                      child: Text('投稿'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('戻る'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget articleForm(
    TextEditingController? controller,
    String formText,
    String hintText,
    GlobalKey key,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 30,
      ),
      child: Material(
        elevation: 2.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          child: Form(
            key: key,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
              validator: (value) {
                if (formText == '名前' && value!.length > 10)
                  return '名前は10文字以内です';
                if (value!.isEmpty) return '$formTextを入力してください';
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }
}
