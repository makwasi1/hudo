import 'package:flutter/cupertino.dart';

import 'package:hudo/utils/audio_controller.dart';
import 'package:hudo/utils/check_direction.dart';
import 'package:hudo/utils/file_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedArticlesArabic extends StatefulWidget {
  @override
  _SavedArticlesArabicState createState() => _SavedArticlesArabicState();
}

class _SavedArticlesArabicState extends State<SavedArticlesArabic> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  FocusNode fieldNode = FocusNode();
  String currentUserId = "default user id";

  final titles = [
    "المادة 1",
    "المادة 2",
    "المادة 3",
    // "المادة 4",
    // "المادة 5",
    // "المادة 6",
    // "المادة 7",
    // "المادة 8",
    // "المادة 9",
    // "المادة 10",
    // "المادة 11",
    // "المادة 12",
    // "المادة 13",
    // "المادة 14",
    // "المادة 15",
    // "المادة 16",
    // "المادة 17",
    // "المادة 18",
    // "المادة 19",
    // "المادة 20",
    // "المادة 21",
    // "المادة 22",
    // "المادة 23",
    // "المادة 24",
    // "المادة 25",
    // "المادة 26",
    // "المادة 27",
    // "المادة 28",
    // "المادة 29",
    // "المادة 30"
  ];

  List Articles = [
    'assets/images/arabic_6.jpg',
    'assets/images/arabic_8.jpg',
    'assets/images/arabic_10.jpg'
  ];


  @override
  void initState() {
    getSaveId();
    super.initState();
  }

  getSaveId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("id");
    setState(() {
      currentUserId = prefs.getString("id");
    });
    print("current User Id is ${currentUserId}");
  }

  unSaveArticle() async {
    // await DioHelper.init();
    // DioHelper.postData(url: 'artical_unsave/${"lamyaa6"}/1')
    //     .then((value) async {
    //   print("unsave Article  atatus code  ${value.statusCode}");
    //   print(" unsave Article response is : ${value.data}");
    // }).catchError((error) {
    //   print(error);
    // });
  }

  bool isPlayerOpened = false;
  int indexNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Articles'),
      ),
      body: ListView.builder(
          itemCount: Articles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                this.indexNo = index;
              },
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ExpansionTile(
                      title: Text(titles[index],style: TextStyle(color: Colors.black),),
                      children: [
                        ListTile(
                          subtitle: Image.asset(
                            Articles[index],
                            fit: BoxFit.fill,
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.play_arrow),
                            onPressed: () {
                              setState(() {
                                isPlayerOpened = true;
                                this.indexNo = index;
                              });
                              floatingActionItem;
                            },
                          ),
                          // style: TextStyle(
                          //   color: index.isEven ? Colors.white : Colors.green,
                          // ),
                        )
                      ]
                  ),
                ),
                color: index.isEven ? Colors.white70 : Colors.blue,
              ),
            );
          }),
      floatingActionButton: floatingActionItem,
    );
//      drawer: SettingsDrawer(node: fieldNode,)
  }

  onPaused() {
    setState(() {
      isPlayerOpened = false;
    });
  }

  get floatingActionItem {
    Widget floatingPlayer = FloatingAudioPlayer(
      onPaused: onPaused,
      index: indexNo,
      lang: 'arabic',
    );

    Widget floatingActionButton = FloatingActionButton(
      onPressed: () {
        setState(() {
          isPlayerOpened = true;
        });
      },
      child: Icon(Icons.play_arrow_outlined),
    );

    return AnimatedSwitcher(
      reverseDuration: Duration(milliseconds: 0),
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
      child: isPlayerOpened ? floatingPlayer : floatingActionButton,
    );
  }
}
