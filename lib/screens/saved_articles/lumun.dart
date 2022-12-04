import 'package:hudo/utils/audio_controller.dart';
import 'package:hudo/utils/file_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedArticlesLumun extends StatefulWidget {
  @override
  _SavedArticlesLumunState createState() => _SavedArticlesLumunState();
}

class _SavedArticlesLumunState extends State<SavedArticlesLumun> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  FocusNode fieldNode = FocusNode();
  String currentUserId = "default user id";

  final titles = [
    "Lon nti ipangken 1 ",
    "Lon nti ipangken 2 ",
    "Lon nti ipangken 3 ",
    "Lon nti ipangken 4 ",
    "Lon nti ipangken 5 ",
    "Lon nti ipangken 6 ",
    "Lon nti ipangken 7 ",
    "Lon nti ipangken 8 ",
    "Lon nti ipangken 9 ",
    "Lon nti ipangken 10 ",
    "Lon nti ipangken 11 ",
    "Lon nti ipangken 12 ",
    "Lon nti ipangken 13 ",
    "Lon nti ipangken 14 ",
    "Lon nti ipangken 15 ",
    "Lon nti ipangken 16 ",
    "Lon nti ipangken 17 ",
    "Lon nti ipangken 18 ",
    "Lon nti ipangken 19 ",
    "Lon nti ipangken 20 ",
    "Lon nti ipangken 21 ",
    "Lon nti ipangken 22 ",
    "Lon nti ipangken 23 ",
    "Lon nti ipangken 24 ",
    "Lon nti ipangken 25 ",
    "Lon nti ipangken 26 ",
    "Lon nti ipangken 27 ",
    "Lon nti ipangken 28 ",
    "Lon nti ipangken 29 ",
    "Lon nti ipangken 30 ",
  ];

  List LumunArticles = [
    "Ul ionyi appik wokwontat wannaukkukkwakot mpuꞌran pꞌrek ana okin thulukku ilon ilonu itti lakkattanthet pul iponyi apuꞌran pꞌrek okorronno aukkukkwot kin. Okin thonu lon ilakin thokwantat ngngin thellek ana mïkït ana okin thonu itti okin thakkarnthet lon loprot akin thongarothe ammakka ukul woththan ana onnan pulukku.",
    "Ul appik wonu itti wikkoik llon appik apuꞌran pꞌrek pella oceꞌre kin ana lon ilakin thongothe itti okin thakkot ana ilakin thonu itti okin thakkot okorronno opakkukkwettat than mpuꞌran pꞌrek ilon elli iliꞌrettat,  okorronno opetto iul llon lꞌrek, ammakka itti ul ionyi ana itti okin thonyi ana manna itti okin thoꞌre ana manna okin thipuk ana itti okin thomura ana manna thaari, ana manna itti karru ken threk, ana manna itti okin thaꞌra ngaꞌrama  ngkathar ken threk, ana lon lokumitta len ana manna lon lꞌrek ana lon lopothok ana lonomun lothikkoik thoul, ana laꞌrpu, ana thokwonta  ana lon lꞌrek. Ana nnolon appik, thopettakorit thonu itti thannokkattat nolon lokumitta,ana lon lothakkma (lothattattaro) ana lon lopothok appik ana lon locik napul paik, antoka manna itti cik cen caik prek ana manna itti caik inyaun ngyoul wꞌrek, ana thonekket cïkït nolon ana thakkma(thattatta) ka pellek ana oka inyaun nyopuꞌran pꞌrek.",
    "Ul appik wonu itti wikkoik, okorronno ollikakine cik mpuꞌran pꞌrek, ana anguttat ammakka pul iponyi ponu itti panguttat.",
    "Pul pella pathikkietta piak ana manna okkiettat thiak, thokkiettat thiak ana thokette iak thonu itti thannokaik ammakka thaik.",
    "Lokïthak itti pul pakkiettat thiak ikkïtheththak ana manna ere okorronnoka pul iponyi ana mana pakkmakot(pattattakot) llon lꞌrek.",
    "Ul appik wonu itti wakkattanthet lon ilakin thonu itti okin thakkattanthet naꞌran appik ammakka ul ionyi tokït kolon lothoncꞌret lon cik.",
    "Ul appik wulukku tokït kolon lothonceꞌret lon cik ana okin thulukku ithanguttat llon lothonceꞌret lon cik.  Okin appik thonu itti okin thanguttat nolon lothopetto iul okorronno occïkot lon iliꞌrettat cene ana thereket thopetto iul.",
    "Ul appik wonu itti wacco aꞌrpu iakin thonu itti okin thacco ana manna itti okin thakketta ngngin nnopul iponu itti pethet kin nnokaꞌran komakkma(kothattattaro) ana manna kaꞌran kothonceꞌret lon cik ana manna nnoul iokkattanthet lon len.",
    "Pul pella pankkettat ikorkkor ana manna amuꞌruttako ncik nuthuk.",
    "Ul appik wonu itti wakkattanthet lon opekietta nnul wꞌrek, ana wonu itti wakkmako(wattattako) mmakkma(nthattattako) imakanno opetto iul ana imannongat ul wꞌrek amꞌra aꞌrek ana amokatha ilon lung kicce ana tokït koul appik amokkanthok ilonu itti lakkattanthok nnolon ilakin thorukethok ngngin.",
    "1. Ul appik iorukwiettathe llon wonu itti  wakathako itti wella lon moloko  ana manna itti wannokkot lon  moloko puccuk alon inakakat nan itti kwokkothe lon moloko nokaꞌran kothakkmako(kothattattako) nakkworrothe noka kung llon appik. \n2. Pul pella peettat lon moloko llon ilokïthak ana ila kwokkothe nolon lothonceꞌret lon cik lonoththok appik nocaꞌri ica lokkattathe nan. Ana manna lannoka loporot itti pul pakkmako ikkïtheththak nothakkmako itha kwokat pakkmakot akka lon lokkattathe.",
    "Pella pakkiettat thiak ntherettat llon lokïthak ana aꞌrupu wung nuthuk, ana manna nyukul nyung ana kaman kung ana manna ul iakin thïlettarnthet lon, ana manna eret lon lothikkoik thung llon lokïthak.Ul appik wonu itti wanguttat llon lothonceꞌret lon cik nnolon ilerettathe ana manna therettat llon lokïthak.",
    "1. Ul appik wonu itti wanyaro ana urttuttuko nnaꞌran akin eo naꞌran wꞌrek akin nopothok ana manna nokaꞌran nakin thaik, okorrnno aukkwukkwakot mpuꞌran pꞌrek.\n2. Ul appik wonu itti waththe noththok ipakin thaik tit, ana manna pothok pung angnganna, akwopakkinthet pothok pung, apuꞌran pꞌrek okorronno aukkukkwothok.",
    "1. Ul appik wonu itti wakwancot ana opirie ka ken noka nomothok mꞌrek okorronno okkiettat thiak ana aukkukkwakot mpuꞌran pꞌrek ana opaꞌroik nothokkiettat thiak ikkïtheththak.\n2. Thikkoik nuthuk okorronno opakkukkettat than mpuꞌran pꞌrek enthi thikko thannona thokkiettat thiak angngana ithao nolon ilannoka lokumitta ana manna nolon ilokkattathe ila thonceꞌret lon cik tholon elli ana manna thoul iꞌrïkot lon tothun.",
    "1. Ul appik wonu itti wakkattanthet lon ilakin thonu itti okin thakkattanthet ammakka itti occo kaꞌramacak ikakene itti ook ponoththok pen.\n2. Pul pella pꞌretta lon ilonu itti lakkattanthet pul iponyi ammakka thoprtto kaꞌrmacak cik ikakene itti ook ponoththok pen.",
    "1. Ul iomura ana iari iocokkat, ana korronno occot kït nolon itti okin thonoul wia ana noththok pia ana manna thoccokot lon loKapik then thia, thonu itti okin thittetto akin okwono nyukul. Okin thonu itti okin thakkattanthet lon ilakin thonu itti okin thakkattanthet ammakka itti manna okin thappꞌraro akin othïllettat ammakka itti pꞌre ana pari.\n2. Thïpa thonu itti thitta amma ukul iocura ana iopari akkꞌrïkot lon itti okin thittetto.\n3. Ul woruan waik ammakka lon lonekkettatheik ana ien cillang cokuꞌri ana ul kurekkure ana okin thonu itti okin thanguttat nnul ana pothok nakin thaik.",
    "1. Ul appik wonu itti wamona aꞌrpu wen thellek ngkaken ana manna omona ithun nnul wꞌrek.\n2. Pul pakannonekittat aꞌrpu  wung mpuꞌran ana manna llon lꞌrek.",
    "Ul appik wonu itti wannoceꞌretta mpuꞌran pꞌrek itti wakkwarttikot cik nnocïkït ana ngkathar ika akin ommakot Kapik ngngin, ana elli lakorronno kin cakuruk itti okin thaprtto kathar kothommakot Kapik ngngin cik ana okin thonu cakuruk ittiokin thangkene pul pulukku ana manna ul woppot ana okin thonu cakuruk itti okin thangkene kathar kothommakot kapik ken tokït koul nthongkene ana manna okkot lon ana aꞌra ngaꞌrama ana occot kït nolon len.",
    "Ul appik wonu itti wakwarttikot cik apuꞌran pꞌrek pella papakkukkwet kin than ana there lon ammakka okin thongothe, lon elli cakuruk lonu itti kwappangkoik llon lung apuꞌran pella iꞌrethok ana akwokwancot cik ana occïkot lon ana ethet  ul lon ana thokwarttikot cik ngkathar kapul pella paceꞌrek.",
    "1. Ul appik wapuꞌran pꞌrek pella paceꞌre itti okin thaeo nomuththun ana iꞌrikikko imungkut moul imaꞌrntakinthet lon loprot.\n2. Pul pella pathïllat mpuꞌran pꞌrek itti kwaine cungkut icokkattathe.",
    "1. Ul appik wonu itti waka nti iul iakkma(iattatta) pothok pen antoka nci nokkït ana manna itti ul wꞌrek wumunta nti ipangen athïllat.\n2. Ul appik wonu itti wakkattanthet lon ila ul wakkattanthet appik noththok pen.\n3. Lon ila ul wongothe laka lon lorokït loul ionu lon ikkun, lon elli lakenetta maꞌri maꞌri nthaꞌrntakot thoul aummu pul pen ipakin thongothe ana lon len laka noul appik ana opekietta nthummu pul ana lon len lakkattat nthamuꞌruttako ncik apul ella ina nan.",
    "Ul appik iaul nti mungkut moul, wonu itti wanguttat ammakka ul appik ana wonu itti waccurat kït nan, ana okkinthet kin lon appik ila pothok okkinthet ul wꞌrek ammakka pothok ponekkethe lon cik ila apokkinthet ul wung naꞌrpu ia ponu,wothoꞌrattot aꞌrpu, ana puꞌran pꞌrek pella paceꞌrek nnothok lon lothathuma thung itha kwonu itti kwannokorronno ithathikkiek poporot ana theo tokït nothikkoik thung.",
    "1. Ul appik wonu itti wareko, ana wonu itti wareko ngre iakin thongothe, ana kwonu itti kwangkot lon ilonekkettanthet ngre cik ana anguttat ana kwonu itti kwareko nnothikkoik nuthuk.\n2. Ul appik wonu itti wacco akucci wore tothun nnul appik okorronno opetto iul.\n3. Ul appik iareko wonu itti wacco akucci woprot iangwot thikkoik then ana ul woruan amma ngre ngocothakothe ana nthokatha itti kwakkattanthet lon loporot ammakka pul iponyi, ana lon len lacothakot ngkathar kꞌrek llon lothangwot thikkoik thoul.\n4. Ul appik wonu itti wakkot cungkut ana manna okattakot mmungkut mꞌrek mothokette aꞌrupu othakka itti akin angwot tharttot nan thakucci wen ana manna aꞌrpu wꞌrek nnothekkette aꞌrpu wen.",
    "Ul appik wonu itti wangoko ana iththrako, ana lonu tit amma kwoccot maꞌri mekkot nan nti ire ana maꞌri mothapikot akwocco akucci ntit.",
    "1. Ul appik wonu itti wikkoik lon loprot ana kathar ikakin ikkoik ngngin kaka koprot,kangwot ka ken nnomio ana akin iththrako ngka ken ana ul woruan ana cannan llon lothuꞌrit ana eret ana kaman ikakin ikkoik tit ana thangwot ka nnomio ana lon ilonu itti lakkattanthe ul appik.\n2. Ana kwonu itti kwekko nan itti kwakero thuꞌrit amma kella ngre cik ana manna eo ialakkin ana eo nokaꞌran koul iocokkat ana manna alꞌrek prek nnelli ilalkothe cik ilakorronnok akwokorronno ikkoik thikkoik thoporot.",
    "1. Ul appik wonu itti wakkakkaro aina cik ana lonu itti aꞌrn wothakkakkaro wakaik ana aꞌrpu wꞌrek ella akucci ana cannan luput lorokït. Ana thakkakkaro thonomun thonu itti thaka nuthuk ana atheꞌrek thonu itti thakaik ammakka itti thokkot aꞌrpu ana athꞌrek prek. Ana thakkakkaro thaꞌrn ittïttïk thonu itti thakaik llon len appik.\n2. Thakkakkaro thonu itti thinie ul cik llon appik ana okene ul thothiarne cik. Ana lon ila pul ponu itti pakkattanthet ana ana thonu itti thakene kin itti okin therettarne lon loprot ana occikarnthet lon ana thuruko nnul appik kurekkurek ana akin ongat lon ila ul iꞌrikothe lon tothun wongothe alangwot lon loporot iul ana thocco.\n3. Ul woruan iocokkat wonu itti wangano ana ummo thakkakkaro ithakin thongothe itti nyukul ngyen nyakkakkaro.",
    "1. Ul appik wonu itti waka ilon ila aul okkot lothinaik wonokaꞌrn apu’ran pꞌrek pella ipaceꞌre kin ana akin ina lon iloprot ana ittarot thakkakkaro atheo tokït ana lon iloprot ilanthan nnan.\n2. Ul appik wonu itti wangwot aꞌrpu wen kurekkurek iakin thonu ana cannan iakin thokkothe nnothina cik then.",
    "Ul appik wonu itti withthrako llon ilokkattathe nnul iaik  noththok ana naꞌran wꞌrek ittittïk othakka itti amma manna lon len lakkot lon ila pul iponyi ponu itti pakkattanthet iliꞌrettat ilon elli.",
    "1. Ul appik wonu lon lakin thonu itti okin thakkinthet ul ilonu lon tit ilakorronno pul apothakka poprot apuꞌran pꞌrek pella paceꞌrek.\n2. Akkwaik akkwokkot ila puꞌran pella paceꞌrek, ul appik wonu itti wakkot lon mpuꞌran pꞌrek tulluk amma lon lon lothonceꞌret lon cik akkiꞌret itti lakkattat, kiccekicce othakka itti alangwot cik ana occot kït noul ana othiane lon ilonu itti lakkattanthet ul ionyi ana lon ila puꞌran pꞌrek pella paceꞌrek itti kwakkot lopilingon ana iliet thopekie lon, nolon lothikkoik thoprot ana lon ilonnekkettatheik loul appik noul iaik iannongkot itti puꞌran pꞌrek pallikine kin cik.\n3. Lannoka loprot itti ngkwakkot lon elli ila ngkwonu itti ngkwakkot alon len alokïtto lon ila ul 'ṛïkot lon tothun longothe.",
    "Lon lella ilon elli iliꞌrettat likko laprttako cik itti lareko noththok ana manna nocik cꞌrek ana manna orekine cungkut coul ana manna pul pellek lon ilonu itti lakkattat manna itti ngre ionu itti ngakïtto lon ilonu itti lakkattnthet pul iponyi.",
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

  unSaveLumunArticle() async {
  }

  bool isPlayerOpened = false;
  int indexNo = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Lon'),
      ),
      body: ListView.builder(
          itemCount: LumunArticles.length,
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
                            LumunArticles[index],
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
      lang: 'lumun',
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
