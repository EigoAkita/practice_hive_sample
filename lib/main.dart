import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_hive_sample/article_posting_page.dart';
import 'package:practice_hive_sample/state/article.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger();

Future<void> main() async {
  ///Hiveの使用宣言
  await Hive.initFlutter();

  ///使用するアダプター設定
  Hive.registerAdapter(ArticleAdapter());

  ///使用するテーブルを開く
  await Hive.openBox('articleBox');

  ///開いたテーブルに対してアクションする事を宣言
  // var articleBox = Hive.box('articleBox');
  ///テーブルの削除処理(テーブルの削除を行わない場合はコメントアウト)
  // await articleBox.clear();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/my_home_page',
      getPages: [
        GetPage(
          name: '/my_home_page',
          page: () => MyHomePage(),
        ),
        GetPage(
          name: '/article_posting_page',
          page: () => ArticlePostingPage(),
          transition: Transition.downToUp,
        ),
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final articleBox = Hive.box('articleBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('記事一覧'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },

        ///HIVEのデータを常に監視するWidget
        child: ValueListenableBuilder(
          valueListenable: articleBox.listenable(),

          ///builderの引数の二つ目がテーブル
          builder: (context, Box<dynamic> box, _) {
            if (box.length == 0) {
              return Container(
                color: Colors.white,
                child: Center(child: Text('投稿はありません')),
              );
            }
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, i) {
                ///getAtで存在しているレコードを降順で表示
                ///昇順(古い順)は本来の順番(1.2.3....)降順(新しい順)は(5.4.3....)
                List<dynamic> _articleList = box.values.toList();
                _articleList.sort(
                  (a, b) {
                    logger.info(b.createdAt.compareTo(a.createdAt));
                    return b.createdAt.compareTo(a.createdAt);
                  },
                );
                Article _article = _articleList[i];

                ///toJsonでクラスの中身を簡単に表示
                logger.info(_article.toJson());

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.white70,
                    elevation: 3.5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _article.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Get.width * 0.065,
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 10,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        ///情報の更新処理
                                        ///copyWith使用で最小限の記述を実現
                                        box.put(
                                          _article.id,
                                          _article.copyWith(
                                            isFavorite: !_article.isFavorite,
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        CupertinoIcons.heart_fill,
                                        color: _article.isFavorite
                                            ? Colors.pink
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        box.delete(_article.id);
                                      },
                                      child: Icon(
                                        CupertinoIcons.delete_solid,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '性別 : ${_article.gender}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: Get.width * 0.030,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _article.createdAt,
                            style: TextStyle(
                              fontSize: Get.width * 0.030,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(2.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 3.5,
                                top: 3.5,
                                left: 7.5,
                                right: 7.5,
                              ),
                              child: Text(
                                'ー タイトル ー',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Get.width * 0.030,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Text(_article.title),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(2.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 3.5,
                                top: 3.5,
                                left: 7.5,
                                right: 7.5,
                              ),
                              child: Text(
                                'ー 内容 ー',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Get.width * 0.030,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Text(_article.sentence),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/article_posting_page');
        },
        child: Icon(
          CupertinoIcons.plus_rectangle_fill_on_rectangle_fill,
        ),
      ),
    );
  }
}
