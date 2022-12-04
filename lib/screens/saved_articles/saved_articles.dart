import 'package:flutter/material.dart';
import 'package:hudo/screens/saved_articles/arabic.dart';
import 'package:hudo/screens/saved_articles/fur.dart';
import 'package:hudo/screens/saved_articles/moro.dart';
import 'package:hudo/screens/saved_articles/saved_articles_screen.dart';
import 'package:hudo/screens/saved_articles/udok.dart';
import 'package:hudo/screens/saved_articles/masallet.dart';
import 'package:hudo/screens/saved_articles/lumun.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({ Key key }) : super(key: key);

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  //List languages = ['English', 'Arabic', "Uduk", 'Fur', 'Moro','Lumun','Masallet'];
  List languages = ['English', 'Arabic/عربي', "Uduk/'Twam Pa", 'Fur/Belé Poor', 'Moro/Omareng','Lumun/Karru','Masallet/Masaraa'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
      ),
      body:ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100,

              child: Card(
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),

                  title: Text(languages[index], style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: () {
                    if(languages[index] == 'English') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SavedArticles()));
                    } else if(languages[index] == 'Arabic/عربي') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SavedArticlesArabic()));
                    } else if(languages[index] == "Uduk/'Twam Pa") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SavedBansUdok()));
                    } else if(languages[index] == 'Fur/Belé Poor') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SavedBaamsFur()));
                    } else if(languages[index] == 'Moro/Omareng') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SavedAdunaMoro()));
                    }else if(languages[index] == 'Lumun/Karru') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SavedArticlesLumun()));
                    }else if(languages[index] == 'Masallet/Masaraa') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SavedArticlesMasallet()));
                    }
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SavedArticles()));
                  },
                ),
              ),
            );
          }),
    );
  }
}