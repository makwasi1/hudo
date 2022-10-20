import 'package:hudo/screens/home/widget/top_slider.dart';
import 'package:hudo/utils/file_export.dart';


class HomeScreen extends StatefulWidget {
  final String langId ;
  final String LangName ;
  HomeScreen(this.langId , this.LangName);
  @override
  _HomeScreenState createState() => _HomeScreenState(langId , LangName);
}

class _HomeScreenState extends State<HomeScreen> {
  final String langId ;
  String langName ;
  _HomeScreenState(this.langId , this.langName);
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool isLanguageContainerExpanded = false;

  //list of strings
  List languagesList = [
    "English",
    "Arabic",
    "Edok",
    "Fur",
    "Moro",
  ];


  FocusNode fieldNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      body: Container(
        height: height(context),
        width: width(context),
        child:  SingleChildScrollView(
          child: Column(

            children: [

              topSlider(context: context),
              SizedBox(
                  height:10
              ),
              Text('About Us', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
              Container(

                child: Text('Human Rights and Development Organization (HUDO) is an independent, non-government, non-partisan and non-profit Sudanese organization dedicated to the promotion and protection of human rights, peace building and development.', style: TextStyle(fontSize: 14),textAlign: TextAlign.center),
              ),
              SizedBox(
                  height:15
              ),
              Text('Vision Statemant', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
              Container(

                child: Text('A world where everyone’s human rights are protected and fulfilled without discrimination', style: TextStyle(fontSize: 14),textAlign: TextAlign.center),
              ),
              SizedBox(
                  height:15
              ),
              Text('Our Mission', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
              Container(

                child: Text('To champion universal access to rights based information and services to vulnerable and underserved communities’ through sustainable innovations, humanitarian support, strategic partnerships, rights empowerment, capacity building, research and advocacy .', style: TextStyle(fontSize: 14),textAlign: TextAlign.center),
              ),
              SizedBox(
                  height:15
              ),
              Text('Background', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              Container(

                child: Text('HUDO was established and confined to South Kordufan (SK) state in Sudan, registered under the State Humanitarian Aid Commission / Sudan Relief and Rehabilitation Commission joint office for Nuba Region (HAC /SRRC). On 25th Oct 2009 HUDO was officially recognized as a non-governmental organization NGO. In June 2011 when South Kordufan conflict started, HUDO’s certificate was revoked by the Sudanese Government. However, HUDO continued to work under very tight and threatening conditions. In order to fulfill its mission, HUDO office was moved and officially registered in Uganda on 13th March 2013 as non-profit company registered by guarantee and in South Sudan on 3rd April 2014 as NGO under the same name of HUDO centre. Later on 4th May 2017, HUDO Centre has been registered in Uganda NGO Board as a foreign NGO. Nevertheless, the mandate has been extended to cover the entire Sudan and Sudanese refugees in Uganda, South Sudan and special program for other refugees. HUDO Centre is highly committed to achieving sustainable development, promoting human welfare without racial, religious, gender discrimination or political affiliation.', style: TextStyle(fontSize: 14),textAlign: TextAlign.center),
              )
              // ListView.builder(
              //         itemCount: languagesList.length,
              //         itemBuilder: (context , index){
              //           return Text(languagesList[index]);
              //         },

              //         )

            ],
          ),
        ),
      ),
      // drawer: SettingsDrawer(
      //   node: fieldNode,
      // ),
    );
  }
}