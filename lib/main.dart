import 'package:flutter/material.dart';
import 'package:hudo/screens/splash/splash_screen.dart';
import 'package:hudo/utils/check_direction.dart';
import 'package:hudo/utils/colors.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
    localeType: LocalizationDefaultType.asDefined,
    languagesList: <String>['en', 'ar'],
    assetsDirectory: 'assets/langs/',
  );
  runApp(
    LocalizedApp(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: mainColor ,
                fontFamily:checkDirection(dirArabic: "Almarai" , dirEnglish: "LibreBasker"), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: mainColor)),
            title: 'HUDO Centre ',
//            theme: AppTheme.lightTheme,
            home: const SplashScreen(),
          );
  }
}



