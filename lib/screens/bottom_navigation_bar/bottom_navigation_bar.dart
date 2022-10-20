import 'package:hudo/screens/home/home_screen.dart';
import 'package:hudo/screens/saved_articles/saved_articles.dart';
import 'package:hudo/settings/settings.dart';

import 'package:hudo/utils/file_export.dart';

class BottomNavigationBarForTheApp extends StatefulWidget {
  final langName ;
  final  langId ;
  final int index  ;
  BottomNavigationBarForTheApp(this.langId , this.langName , this.index ) ;
  @override
  _BottomNavigationBarForTheAppState createState() => _BottomNavigationBarForTheAppState(langId , langName , index);
}

class _BottomNavigationBarForTheAppState extends State<BottomNavigationBarForTheApp> {
  final langName ;
  final  langId ;
  final int index ;

  _BottomNavigationBarForTheAppState(this.langId , this.langName , this.index) ;

  int currentIndex = 0 ;
  @override
  void initState() {
    setState(() {
      currentIndex = index ;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade100,

        body: Container(

          child:
          currentIndex == 0 ? HomeScreen(langId , langName) :
          Container(child: Stack(children: [
            Container(
              child:  currentIndex == 1 ? SelectLanguageScreen()
                  : SettingsScreen(),

            ),],)),),
        bottomNavigationBar: Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              boxShadow: [
                BoxShadow(color: blackColor.withOpacity(.7)
                    , spreadRadius:2, blurRadius: 30 ),
              ],
            ),
            child: ClipRRect(

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              child: BottomNavigationBar(
                backgroundColor:
                Color(0xffcad2d9),
                currentIndex: currentIndex,
                onTap: (index){
                  if(index == 0){
                    print("0") ;
                    setState(() {
                      currentIndex = 0 ;
                    });

                  }else if(index == 1){
                    print("1") ;
                    setState(() {
                      currentIndex = 1 ;
                    });

                  }
                  else{
                    print("2") ;
                    setState(() {
                      currentIndex = 2 ;
                    });
                  }

                },

                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      backgroundColor: Colors.red,
                      activeIcon: Icon(Icons.home , ),

                      icon: Icon(Icons.home_outlined , color: greyColor ) ,

                      label: "Home"),
                  BottomNavigationBarItem(
                      activeIcon: Icon(Icons.bookmark , ),

                      icon: Icon(Icons.bookmark_border , color: greyColor ) ,

                      label: "Saved Articles"), BottomNavigationBarItem(
                      activeIcon: Icon(Icons.settings , ),

                      icon: Icon(Icons.settings_outlined , color: greyColor ) ,

                      label: "Settings"),

                ],
              ),
            ))
    );
  }
}
