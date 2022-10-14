import 'package:hudo/custom_widgets/custom_description_text.dart';
import 'package:hudo/custom_widgets/responsive_sized_box.dart';
import 'package:hudo/utils/check_direction.dart';
import 'package:hudo/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_share/flutter_share.dart';


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String shareAppLink = "";
  String aboutHudo_en = "about details";
  String aboutHudo_ar = "about details";
  String app_description_en = "about details";
  String app_description_ar = "about details";
  String email = "";
  String facebook = "";
  String phoneNumber = "";
  String twitter = "";
  String linkedIn = "";
  String whatsap = "";
  String vk = "";
  String qq = "";
  String version = "1.0";
  String web = "";
  String youtube = "";
  String instagram = "";
  @override
  void initState() {
    getIntroInfo();
    super.initState();
  }

  getIntroInfo() async {
    // await DioHelper.init();
    // DioHelper.getAllData(url: 'info').then((value) async {
    //   print("Intro status code is ${value.statusCode}");
    //   print("Intro response is : ${value.data}");
    //
    //   setState(() {
    //     shareAppLink = value.data["Google Play"];
    //     aboutHudo_en = value.data["About_us-en"];
    //     aboutHudo_ar = value.data["About_us-ar"];
    //     app_description_ar = value.data["app_share_description_ar"];
    //     app_description_en = value.data["app_share_description_en"];
    //     email = value.data["E-mail"];
    //     phoneNumber = value.data["Phone"];
    //     facebook = value.data["Facebook"];
    //     twitter = value.data["Twitter"];
    //     linkedIn = value.data["Linkedin"];
    //     instagram = value.data["Instagram"];
    //     whatsap = value.data["Whatsapp"];
    //     vk = value.data["Vk"];
    //     qq = value.data["Qq"];
    //     version = value.data["Version"];
    //     web = value.data["Web"];
    //     youtube  = value.data["Youtube"];
    //   });
    //   print(linkedIn);
    // }).catchError((error) {
    //   print(error);
    // });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: Image.asset(
                "assets/images/b1.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: width * .05, right: width * .05),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    responsiveSizedBox(context: context, percentageOfHeight: .08),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customDescriptionTextText(
                            context: context,
                            text: "Settings",
                            textColor: mainColor,
                            percentageOfHeight: .03),
                      ],
                    ),
                    responsiveSizedBox(context: context, percentageOfHeight: .02),
                    Column(
                      children: <Widget>[
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .05),
                        Container(
                          padding: EdgeInsets.only(
                              right: width * .05, left: width * .05),
                          child: Column(
                            children: [],
                          ),
                        ),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .03),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .03),
                        singleSettingsRow(
                            context: context,
                            iconData: Icons.language_outlined,
                            text: "Change Language",
                            onTaoIcon: () {
                              // customAnimatedPushNavigation(
                              //     context, ChangeLanguage());
                            }),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .03),
                        singleSettingsRow(
                            context: context,
                            iconData: Icons.share_outlined,
                            text: "Share The App",
                            onTaoIcon: () {
                              share();
                            }),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .03),
                        singleSettingsRow(
                            context: context,
                            iconData: Icons.error_outline,
                            text: "About Hudo",
                            onTaoIcon: () {
                              // customAnimatedPushNavigation(
                              //     context, AboutUsScreen(aboutEn: aboutHudo_en , aboutAr: aboutHudo_ar));
                            }),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .03),
                        singleSettingsRow(
                            context: context,
                            iconData: Icons.message_outlined,
                            text: "Contact Us",
                            onTaoIcon: () {
                              // customAnimatedPushNavigation(
                              //     context, ContactUsScreen());
                            }),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .05),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              singleIconButton(
                                  context: context,
                                  iconData: "assets/icons/facebook.png",
                                  onTapIcon: () {
                                    _launchURL(facebook);
                                  }),
                              singleIconButton(
                                  context: context,
                                  iconData: "assets/icons/phone-call.png",
                                  onTapIcon: () {
                                    _launchCaller();
                                  }),
                              singleIconButton(
                                  context: context,
                                  iconData: "assets/icons/twitter.png",
                                  onTapIcon: () {
                                    _launchURL(twitter);
                                  }),
                              singleIconButton(
                                  context: context,
                                  iconData: "assets/icons/linkedin.png",
                                  onTapIcon: () {
                                    _launchURL(linkedIn);
                                  }),
                              singleIconButton(
                                  context: context,
                                  iconData: "assets/icons/whatsapp.png",
                                  onTapIcon: () {
                                    _launchURL(whatsap);
                                  }),
                            ],
                          ),
                        ),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .03),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              singleIconButton(
                                  context: context,
                                  iconData: "assets/icons/internet.png",
                                  onTapIcon: () {
                                    _launchURL(web);
                                  }),
                              singleIconButton(
                                  context: context,
                                  iconData: "assets/icons/youtube.png",
                                  onTapIcon: () {
                                    _launchURL(youtube);
                                  }),
                              singleIconButton(
                                  context: context,
                                  iconData: "assets/icons/instagram.png",
                                  onTapIcon: () {
                                    _launchURL(instagram);
                                  }),
                              singleIconButton(
                                  context: context,
                                  iconData: "assets/icons/qq.png",
                                  onTapIcon: () {
                                    _launchURL(qq);
                                  }),
                              singleIconButton(
                                  context: context,
                                  iconData: "assets/icons/vk.png",
                                  onTapIcon: () {
                                    _launchURL(vk);
                                  }),
                            ],
                          ),
                        ),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .03),
                        customDescriptionTextText(
                            context: context,
                            text: "info@hudocentre.org ",
                            percentageOfHeight: .02,
                            textColor: mainColor),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .01),
                        customDescriptionTextText(
                            context: context,
                            text: "${translator.translate("Version")} ${version}",
                            percentageOfHeight: .02,
                            textColor: mainColor),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  singleSettingsRow(
      {BuildContext context,
        IconData iconData,
        Function onTaoIcon,
        String text}) {
    return Container(
      width: width(context) * .9,
      child: GestureDetector(
        onTap: onTaoIcon,
        child: Row(
          children: [
            SizedBox(
              width: width(context) * .03,
            ),
            Icon(
              iconData,
              color: secondaryColor,
            ),
            SizedBox(
              width: width(context) * .03,
            ),
            customDescriptionTextText(
                context: context,
                text: text,
                textColor: secondaryColor,
                percentageOfHeight: .024),
            SizedBox(
              width: width(context) * .03,
            ),
          ],
        ),
      ),
    );
  }

  singleIconButton(
      {BuildContext context, Function onTapIcon, String iconData}) {
    return GestureDetector(
      onTap: onTapIcon,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        height: isLandscape(context)
            ? 2 * height(context) * .05
            : height(context) * .05,
        width: width(context) * .11,
        child: Center(
          child: Image.asset(iconData),

//        Icon(iconData , color: mainColor , size: isLandscape(context) ? 2*height(context)*.03: height(context)*.03,)
        ),
      ),
    );
  }

  _launchURL(String url) async {
    url = url;
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  _launchCaller() async {
    String url = "tel:${phoneNumber}";
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  Future<void> share() async {
    // await FlutterShare.share(
    //     title: 'Hudo app',
    //     text: checkDirection(
    //         dirArabic: app_description_ar, dirEnglish:app_description_en),
    //
    //     linkUrl:  shareAppLink ,
    //     chooserTitle: 'Hudo App');
  }
}

