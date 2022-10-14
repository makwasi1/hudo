import 'package:flutter/material.dart';
import 'package:hudo/screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:hudo/utils/check_direction.dart';
import 'package:hudo/utils/colors.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class IntroScreen extends StatefulWidget {
  final String intro1_title_ar;
  final String intro2_title_ar;
  final String intro3_title_ar;
  final String intro1_title_en;
  final String intro2_title_en;
  final String intro3_title_en;
  final String intro1_content_ar;
  final String intro2_content_ar;
  final String intro3_content_ar;
  final String intro1_content_en;
  final String intro2_content_en;
  final String intro3_content_en;
  IntroScreen(
      this.intro1_title_ar,
      this.intro2_title_ar,
      this.intro3_title_ar,
      this.intro1_title_en,
      this.intro2_title_en,
      this.intro3_title_en,
      this.intro1_content_ar,
      this.intro2_content_ar,
      this.intro3_content_ar,
      this.intro1_content_en,
      this.intro2_content_en,
      this.intro3_content_en,
      {Key key})
      : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState(
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
      intro3_content_en);
}

class IntroScreenState extends State<IntroScreen> {
  final String intro1_title_ar;
  final String intro2_title_ar;
  final String intro3_title_ar;
  final String intro1_title_en;
  final String intro2_title_en;
  final String intro3_title_en;
  final String intro1_content_ar;
  final String intro2_content_ar;
  final String intro3_content_ar;
  final String intro1_content_en;
  final String intro2_content_en;
  final String intro3_content_en;
  IntroScreenState(
      this.intro1_title_ar,
      this.intro2_title_ar,
      this.intro3_title_ar,
      this.intro1_title_en,
      this.intro2_title_en,
      this.intro3_title_en,
      this.intro1_content_ar,
      this.intro2_content_ar,
      this.intro3_content_ar,
      this.intro1_content_en,
      this.intro2_content_en,
      this.intro3_content_en,
      );
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(Slide(
      styleDescription: TextStyle(color: whiteColor),
      styleTitle: TextStyle(color: whiteColor),
      title: translator.translate(
        checkDirection(dirArabic: intro1_title_ar, dirEnglish: intro1_title_en),
      ),
      description:"\n\n\n\n\n\n\n\n\n\n${ translator.translate(
        checkDirection(
            dirArabic: intro1_content_ar ?? "fff", dirEnglish: intro1_content_en ?? "ffff"),)}",
      backgroundImage: "assets/images/image16.jpg",
      pathImage: "assets/images/image1.jpg",
      heightImage: .00000200,
      widthImage: .0000400,
      backgroundColor: mainColor,
    ));

    slides.add(
      Slide(
        styleDescription: TextStyle(color: whiteColor),
        styleTitle: TextStyle(color: whiteColor),
        title: translator.translate(
          checkDirection(
              dirArabic: intro2_title_ar, dirEnglish: intro2_title_en),
        ),
        description:"\n\n\n\n\n\n\n\n\n\n${ translator.translate(
          checkDirection(
              dirArabic: intro2_content_ar, dirEnglish: intro2_content_en),)}",

        pathImage: "assets/images/image1.jpg",
        backgroundImage: "assets/images/image12.jpg",
        heightImage: .00000200,
        widthImage: .0000400,
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      Slide(
        styleDescription: TextStyle(color: whiteColor),
        styleTitle: TextStyle(color: whiteColor),
        title: translator.translate(
          checkDirection(
              dirArabic: intro3_title_ar, dirEnglish: intro3_title_en),
        ),
        description:"\n\n\n\n\n\n\n\n\n\n${ translator.translate(
          checkDirection(
              dirArabic: intro3_content_ar, dirEnglish: intro3_content_en),)}",
        pathImage: "assets/images/image1.jpg",
        backgroundImage: "assets/images/image1.jpg",
        heightImage: .000200,
        widthImage: .00400,
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigationBarForTheApp(checkDirection(dirEnglish: "1" , dirArabic: "2") , checkDirection(
          dirEnglish: "English" , dirArabic: "Arabic"
      ) , 0)),
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: mainColor,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: mainColor,
    );
  }

  Widget renderSkipBtn() {
    return Icon(Icons.navigate_before, color: mainColor);
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(
          Color(0x33F3B4BA).withOpacity(.0001)),
      overlayColor: MaterialStateProperty.all<Color>(
          Color(0x33FFA8B0).withOpacity(.000001)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: this.renderNextBtn(),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: mainColor.withOpacity(.5),
      colorActiveDot: mainColor,
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: false,
      backgroundColorAllSlides: Colors.grey,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}