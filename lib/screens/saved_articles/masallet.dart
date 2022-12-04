import 'package:hudo/utils/audio_controller.dart';
import 'package:hudo/utils/file_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedArticlesMasallet extends StatefulWidget {
  @override
  _SavedArticlesMasalletState createState() => _SavedArticlesMasalletState();
}

class _SavedArticlesMasalletState extends State<SavedArticlesMasallet> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  FocusNode fieldNode = FocusNode();
  String currentUserId = "default user id";

  final titles = [
    "Bira 1",
    "Bira 2",
    "Bira 3",
    "Bira 4",
    "Bira 5",
    "Bira 6",
    "Bira 7",
    "Bira 8",
    "Bira 9",
    "Bira 10",
    "Bira 11",
    "Bira 12",
    "Bira 13",
    "Bira 14",
    "Bira 15",
    "Bira 16",
    "Bira 17",
    "Bira 18",
    "Bira 19",
    "Bira 20",
    "Bira 21",
    "Bira 22",
    "Bira 23",
    "Bira 24",
    "Bira 25",
    "Bira 26",
    "Bira 27",
    "Bira 28",
    "Bira 29",
    "Bira 30",
  ];

  List MasalletArticles = [
    "Kaa koy mârî\u006e de û\u006eê h\u006fgûdû ii koy gê ye neya\u006e mo wan kaaŋgi kandim wan, in taa wo daalo û\u006eââ ye \u006euuri înîm kalli kandi mbo wââyîrîî te ye.",
    "Kaaŋgi ŋgaa yan koy hâbîî ndar mo warcaanaa ilaa teneegiye, kammba yoŋ mûc\u006f\u006f yoŋ, kolaa ta ŋgonndaa yoŋ, dumi ta ŋgârîy\u006fŋ, kanaa tûûrêy ŋgârîy\u006fŋ, bâjîlê ta ŋgârîyôŋ, kûj\u006fm teneg ŋgârîy\u006fŋ, koyoŋa ta koccik ili ŋguriyoŋ, ŋgur u\u006eana yoŋ maa mendeeteŋ kede. H\u006fgûdû kaa wo ndeeta kûj\u006f\u006fm enee mbo, jêyâ înîŋ lardi taŋ mbo, kaa ûrcîî mbo, koyoŋa\u006e ûrcîî mbo koy ndeeta tâ\u006enjââjî ndaa ye.",
    "Kaaŋgi ŋgaa yan koy lîjîrââ mbo, mârî mbo kallo jîyâ mbo neyo teneegiye.",
    "Kaaŋgu in maaju geya mbo, naŋ rokaa mbo tâ\u006enjâânjî nde bûrîî koy mo.",
    "Kaaŋgu in rebebero ni\u006enjimo kaaŋgi kandi to baaka jû\u006enjâ ili tâ\u006eââjî nde.",
    "Kaaŋgi ŋgaa yan koy, gani tindam koy tii lardim kaaŋgi yen neyo nda ûsûr to teneegiye.",
    "Kaa koy lardi taŋ \u006fjîm gê ye, ii koy gasgalan ye lardi taŋ foŋ geyam ndeetaa kende, h\u006fgûdû ii hâbût\u006f\u006f nadar mo warcaanaa ilaa wo foŋ geyam koy gasgalan ye ndeeta kede, kaaŋgi ŋgaa yan koy ndeetaam tî\u006enjârîî ken îyâ irteye.",
    "Kaaŋgi ŋgaa yan koy kûtî u\u006e\u006ea koyoŋa tam ninda ilim koo kaaŋgi nerŋgeleemina ilu t\u006f\u006flîn neya\u006e taŋ lardim nindaa ilaa wo nda sîgâl û\u006enjî te ye.",
    "Kaaŋgi ŋgaa yan koy ime teneekede tûkûrkêm \u006fl\u006fwî te yaande, hâgûdû uraayete ya nde.",
    "Kaaŋgi ŋgaa yan koy tii kaa mbo gê ye, sirit ko teneeken kûtî u\u006e\u006ea kalli nda teser to neyo tenee giye kaa esero, neya\u006e taŋ mo yoŋ tiro kô\u006fr eena yan koy.",
    "1. Kaaŋgi ŋgaalo kôôr nda\u006eaka nû teneen koy ime kede tindede lardi ime ta gu tunuusuli gu bûrîî ndûûtô tuujurni te taŋ tarkite ye. \n2. Kaaŋgim ime uusulte yaande tanda\u006eaanuŋ, bîyô teenuŋ hâbûtô anndiye tîrnêŋ\u006fŋ kôôr ken, ba eenan gi tirom ime ye neya\u006e lardi\u006e  koyoŋa taŋam, hâgûdû nitikaa koy re\u006enje ime tûkâ ili molo u\u006e\u006ea ûûkî ndiye.",
    "Tâ\u006enjââjî nde kaaŋgim in fandaŋ taa taŋ mbo, nubaa taŋ mbo, taŋi ta mbo, uda\u006e taŋ mbo nââkûrûj ko nda geya, h\u006fkkôy tâ\u006enjââjî nde hâbûtôô taaŋa fandaŋ taam sûûr ko kee nda njârîyâ. Kaa koy de neya\u006e eneegi ye lardi nda tuucice to.",
    "1. Kaa koy de neya\u006e mârî\u006e nîŋ menmena eneegiye ganii iyeetiŋ mbo, hââgûdû indetiŋ mbo lardi koyoŋa tam kûdê.\n2. Kaa koy neya\u006e koyoŋa\u006e molo dîînjâ nû eneegi ye, koyoŋa ta gimolo yan koy, hâgûdû koyoŋa tam lââsîrâ nû koy.",
    "1. Kaa koy neya\u006e koyoŋa\u006e tôôm taŋ ken maa\u006eaam jêyâ nû eneegiye, nââkûrûj taa molo \u006eelle. \n2. Ndameya tâ\u006enjâânjî nde neya gimbo ba kaaŋgu uraayen koy, imo teneen koy mba ime ili ndâynjârâ meyoŋ kaa nûûcôŋââ nîŋâ lardi\u006e mo taci ndan.",
    "1. Kaa koy de neya\u006e dumi tôôm ruguluu\u006euŋ jêynîsâ nû ene.\n2. Tâ\u006enjââjî nde kaaŋgu dumi to nâânjîsâ hâgûdû neyo dumu kaaŋgi to torgoloo\u006eiŋ ko tene nde.",
    "1. Kammba yoŋ iyaŋaa yoŋ ba kaaŋgi tûkô toosiŋan, neyo gûlâsîrâ nû teneegiye, gârâl ko in nda enkede maŋ innaale ruu yoŋ, bâjîîlê na innaaye ruu yoŋ. Ii mbaraa koy gasgalan ye neya\u006e gûlâsîrîyâ nîm, hâgûdû re\u006enje ûûlâsîrnî tem urnaŋa molo tânndâjââjî.\n2. Gûlâsîrîyâ tâ\u006enjâânjî nde ii kaa mbaraa lo ûûlûsûrnîtê mbo uŋu\u006eurni kede, hââgûdû îyâ îrêrî ndite mbo.\n3. Taŋi tiilo kûrî loo kodo laar te kaam, hââgûdû neyo kaa mbo koyoŋa mbo tiro foŋ eeniken maa\u006eaam tindeto.",
    "1. Kaa koy neya\u006e fandaŋ taa nû ene, tîîlê înî yoŋ, kaa tôô mbo loon yoŋ.\n2. Tâ\u006enjâânjî nde kaaŋgu fandaŋtaa taaŋa tirmolo nââkûrûj mbo nâânjîsâ.",
    "Kaa koy neyo ene ndâynjêrâm wan, jêyâm wan, bâjîlêm wan, hâgûdû neya gi toloke mârû bâjîlê to ndeera wan lisa wan, hâgûdû mârû bâjîlê to nî\u006enjîŋêêsîrâ ta mbo geya ta mbo gosinja ta mbo tîîlê to yoŋ kaa mboyoŋ, kaa nîŋ ôjî meyoŋ tîîlê yan koy. ",
    "Kaa koy neya\u006e ene gûrêyââ meyoŋ, ndâynjârâ meyoŋ, hâgûdû neya gi toloke mârû agara\u006e kâânîŋâ koy gulusa dirne kede, hâgûdû njârîyâ mbo ndâynjêrâ mbo rak kaa tôôm ruku\u006ea, bûrtî ŋo\u006ee mbo koy lardu lûkû\u006eôŋ kede.",
    "1. Kaaŋgi ŋgaayan koy to fandaŋ koo mârî ta mbo dîîrâ\u006e mo tîdîîrêtê noŋ hâgûdû gûcâ\u006e âlâlîyê taŋ mo rok tîrêrîîtô teneegi ye.\n2. Tâ\u006enjâânjî nde kaaŋgi toŋo\u006e kede naŋ gûcâm rumaka.",
    "1. Kaaŋgi ŋgaayan koy neyo koti ta mbo tââyîrîtô koyoŋa tam tene, ba iliyandanndu tii mârî ta mbo kaa tôô tendeeleŋin mirsi taŋ mbo wââyîrîî te ye.\n2. Kaaŋgi ŋgaayan koy neyo kaa koyoŋa taŋ tôô mbo gê dê hâbûtôô koyoŋa taŋam tââyîrîtô teneegi ye.\n3. Kaa wo ndaa gâyîrîyâ ninndeya kâânî molo tarteye, hâgûdû kaaŋgi kaa wo koyoŋam ndaa nââyîrîîtê ilu nim mbo endeeleŋin tarteye. Yaagun kaaŋgi nendeeleŋke ili agaraa to mârî ta mbo norkan kaaŋgi tinnde ilu tû\u006etêyê, ba iliyandanndu hâbûtô tôô meenin ndeera kalla tûûtê ye.",
    "Kaaŋgi ŋgaayan koy kaa gê tindaa ilaam tii ceki ye, kallo tinde to neyo teneegi ye, hâgûdû koyoŋa koy gâjîî tene ili noŋ kaaŋgu tenndejebe te ye. ",
    "1. Kaaŋgi ŋgaayan koy gâyîrîy\u006f ndeeleŋ tââyîrîî tem neyo teneegi ye, hâgûdû gâyîrîyâ taŋ gârâl geya tekkerii kalla in ûûkên kaaŋgi tââyîrîî te ye- derbo tindete yande.\n2. Kaa koy ndeeta kede gâyîrîyâ gê wââyîrnâ ilim njiŋan taa gasgalan uuluste ye.\n3. Kaaŋgi ŋgaayan koy gâyîrîyâ ta ilim njiŋan ta kûrû narbasetiŋ tuuluste ye, tiro mbo nubaa taŋ nda n\u006fr\u006fc tiŋa.\n4. Kaaŋgi ŋgaayan koy neyo kaa mbo loon ndûû gâjîî taŋ foŋ nda nigeegu tento teneegiye.",
    "Kaagi ŋgaayaŋ koy neyo nuunasira to teneegiye, hâgûdû njiindii kaaŋgi tââyîrîî ilaa koso koso na ûûtê ye, hâgûdû joo tununaraa ilaa koy njiŋan ta taŋan ta tââyîrnââ noŋ de tuuluste ye.",
    "1. Kaaŋgi ŋgaayan koy neyo kallo sây berbere kotii ta mbo nubaa taŋ mbo teneegiye, hâgûdû \u006eêêtî noŋ laca noŋ taŋim jêyâ noŋ kâsîŋâr nura noŋ ndaŋ ndaŋ te, hâgûdû kaaŋgi hâbûtô\u006f kee ndîînjêrû ti\u006eeendoŋ, tuma\u006e ndoŋ, kûfô yoŋ, kaagŋi kaddî kûû nele\u006enja yoŋ, hâbûtô kûjôm teneenda kûû jêyâ nda tand\u006eaa noŋ, cuccuka koyoŋa ta molo û\u006enjî ken ti\u006eeete ye.\n2. Dââsî kimi\u006e nu\u006eee mbo kimi\u006e soonaa mbo foŋ tiro fandaŋ ko eneegiye, hâgûdû kimi\u006e inde u\u006eanaa ilaa koy neya\u006e kimi\u006e t\u006f\u006f ilaanoŋ eneegiye koyoŋa telte yande.",
    "1. Kaa ŋgaa yan koy neyo gosinjaam teneegiye. Gosinjaa gîlêŋ na ili du inde tûûtê ye kima toŋo\u006eoŋ toŋo\u006endoŋ. H\u006fgûdû gosinjaa kee \u006eêyâ nî ili gani kâdûr mo tindete ye. Ee gosinjaa doole na ili koy tindeken kaa ninndee kodo nasaŋanaa ilaa oosinjete ye.\n2. Gosinja ta ja gi tii kaa wo kûj\u006f\u006f tûttûrâŋîn neya\u006e kaa nîŋ mbo mârî\u006e mbo kosiŋ \u006f\u006fbêê igeete ye. Hâgûdû gosinjaa ii gîyêrîyâ kaa koy mo onookete ye bâjîlê\u006e înîŋ buut yan koy, hâgûdû gosinjaa tii gîyêrîyâ kaa koy ûûcââ ilaa wo âlâlîy\u006f dom tigeete ye.\n3. Tîîŋgêê mbo tunuŋgee mbo neyo kimi\u006e înîŋ gosinjo nda endeeleŋ ko ene.",
    "1. Kaaŋgi ŋgaa yan koy neyo mârî ta mbo kaam toloke to teneegiye, hâgûdû tii mârî ye jaariyaa mbo, ŋgârîî mbo kaa tindaa ilaam rok tigeeto.\n2. Kaaŋgi ŋgaa yan koy neyo hâbût\u006f\u006f ndûû\u006eân teenaa ilaa ŋgârîî yan koy foŋ geyo teneegi ye.",
    "Kaaŋgi ŋgaa yan koy neyo kaa tindaa ilaam yoŋ, koyoŋa tinda ilime yoŋ teneegi ye hâbût\u006f\u006f nadar mo warcaanaa ilaam.",
    "1. Kaaŋgi ŋgaa yan koy kaa tinday mo hâbût\u006f\u006f tââyîî teneete ye, tii kûj\u006f to mârî ta mbo tunuunus te ta jam.\n2. Kaaŋgu in neya taŋ mbo mârî ta mbo dil igeeteya nde lardi mbo awosondo, h\u006fgûdû neya\u006e kaa nîŋ mbo mârî\u006e înîŋ mbo nda sûr \u006f\u006fbêê tigeete ye.\n3. Wâârî\u006e koy mo tâ\u006enjâânjî nde neya\u006e kaa ûûâŋââ ilaa molo gondokol gento.",
    "Nadar gim hâbût\u006f \u006eeret eeno ke orgoloo\u006eiŋke k\u006fyyê, koyŋaa yoŋ, kaa kâgûr yoŋ, kaaŋgi tîîlê yoŋ, gâyîrîyâ in hâbîî wîî nâârûmbê tûûtê yaande.",
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

  unSaveMasalletArticle() async {
  }

  bool isPlayerOpened = false;
  int indexNo = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Biraa'),
      ),
      body: ListView.builder(
          itemCount: MasalletArticles.length,
          itemBuilder: (context, index) {
            return new GestureDetector(
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
                          // leading: CircleAvatar(
                          //   backgroundColor: Colors.purple,
                          //   child: Text((index + 1).toString()),
                          // ),
                          // title: Text(titles[index], style: TextStyle(fontSize: 20)),
                          subtitle: Text(
                            MasalletArticles[index],
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            softWrap: true,
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
      lang: 'masallet',
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
