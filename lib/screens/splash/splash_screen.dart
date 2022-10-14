import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hudo/custom_widgets/custom_description_text.dart';
import 'package:hudo/custom_widgets/responsive_sized_box.dart';
import 'package:hudo/screens/intro/intro.dart';
import 'package:hudo/utils/file_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String intro1_title_ar = "Who we Are?";
  String intro2_title_ar = "Our Vision";
  String intro3_title_ar = "Our Mission";
  String intro1_title_en = "Who we Are?";
  String intro2_title_en = "Our Vision";
  String intro3_title_en = "Our Mission";

  String intro1_content_ar = "Who we Are details";
  String intro2_content_ar = "Our Vision details";
  String intro3_content_ar = "Our Mission details";
  String intro1_content_en = "Who we Are details";
  String intro2_content_en = "Our Vision details";
  String intro3_content_en = "Our Mission details";


  String userId = "";
  bool idIsSaved = false ;

  void initState() {
    // getIntroInfo();
    getId();
    setSavedTrue();
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => IntroScreen(
                intro1_title_ar,
                intro2_title_ar,
                intro3_title_ar,
                intro1_title_en,
                intro2_title_en,
                intro3_title_en,
                intro1_content_ar,
                intro2_content_ar,
                intro3_content_ar,
                intro1_content_en,
                intro2_content_en,
                intro3_content_en))));}

  setSavedTrue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("is_saved", true);
  }

  getId() async {
    if (idIsSaved == true) {
      print("there is an id already saved ");
      print("saved  id is ${userId}");
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("id", DateTime.now().toString());
    }
  }

  // getIntroInfo() async{
  //   await  DioHelper.init();
  //   DioHelper.getAllData(url: 'info').then((value) async {
  //     print("Intro status code is ${value.statusCode}");
  //     print("Intro response is : ${value.data}");
  //
  //
  //     setState(() {
  //
  //       // intro1_title_ar = value.data["intro1_title_ar"];
  //       // intro2_title_ar = value.data["intro2_title_ar"];
  //       // intro3_title_ar = value.data["intro3_title_ar"];
  //       // intro1_title_en = value.data["intro1_title_en"];
  //       // intro2_title_en = value.data["intro2_title_en"];
  //       // intro3_title_en = value.data["intro3_title_en"];
  //
  //       // intro1_content_ar = value.data["intro1_content_ar"];
  //       // intro2_content_ar = value.data["intro2_content_ar"];
  //       // intro3_content_ar = value.data["intro3_content_ar"];
  //       // intro1_content_en = value.data["intro1_content_en"];
  //       // intro2_content_en = value.data["intro2_content_en"];
  //       // intro3_content_en = value.data["intro3_content_en"];
  //     });
  //   }).catchError((error) {
  //     print(error);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
//        Container(
//          height: height(context),
//          width: width(context),
//          child: Image.asset(
//            "assets/images/b1.jpg",
//            fit: BoxFit.cover,
//          ),
//        ),
            Container(
              height: height(context),
              width: width(context),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    responsiveSizedBox(context: context, percentageOfHeight: .35),
                    customDescriptionTextText(
                        context: context,
                        textColor: blackColor,
                        fontWeight: FontWeight.bold,
                        percentageOfHeight: .04,
                        text: "HUDO Centre"),
                    responsiveSizedBox(context: context, percentageOfHeight: .02),
                    Image.asset(
                      "assets/images/hudo_logo.jpg",
                      height: isLandscape(context)
                          ? 2 * height(context) * .2
                          : height(context) * .2,
                    ),
                    responsiveSizedBox(context: context, percentageOfHeight: .02),
                    customDescriptionTextText(
                        context: context,
                        textColor: blackColor,
                        fontWeight: FontWeight.bold,
                        percentageOfHeight: .02,
                        text: "Together We Can")
                  ],
                ),
              ),
            ),
//        Container(height: height(context),width: width(context),color: mainColor.withOpacity(.4),)
          ],
        ));
  }
}
