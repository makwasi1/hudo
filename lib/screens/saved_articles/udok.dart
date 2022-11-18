import 'package:hudo/utils/audio_controller.dart';
import 'package:hudo/utils/file_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedBansUdok extends StatefulWidget {
  @override
  _SavedBansUdokState createState() => _SavedBansUdokState();
}

class _SavedBansUdokState extends State<SavedBansUdok> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  FocusNode fieldNode = FocusNode();
  String currentUserId = "default user id";

  final titles = [
    "Ban 1",
    "Ban 2",
    "Ban 3",
    "Ban 4",
    "Ban 5",
    "Ban 6",
    "Ban 7",
    "Ban 8",
    "Ban 9",
    "Ban 10",
    "Ban 11",
    "Ban 12",
    "Ban 13",
    "Ban 14",
    "Ban 15",
    "Ban 16",
    "Ban 17",
    "Ban 18",
    "Ban 19",
    "Ban 20",
    "Ban 21",
    "Ban 22",
    "Ban 23",
    "Ban 24",
    "Ban 25",
    "Ban 26",
    "Ban 27",
    "Ban 28",
    "Ban 29",
    "Ban 30"
  ];

  List Bans = [
    "Aris ’kwaniny’ceshi ’baar mo dho’thkunu ’ba\u006Bany mo dhali mmomiiya \u0074u’c imon\u0074al ’de/ mo dhali mii ma \u006Bar/e mo. Uni mini ta gi gwo mo dhali mii mo dhali uni mini mii ka karambuye/ ’kup̱ ki cin tiya mo e shi/in mo dhali mii kun tanu ikam mo.",
    "Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ yu\u006Bunu mo e mii ma isiŋ gana/ mo dhali gwo jin \u0074orkunu mo gom moŋ’ko jin ’konu ki ’kus mo, ki dar gi mo jin ’konu ka \u006Bwa/um bwa ki she/ ki she/ mo, hili ka Awa\u006B mo, jamas, wathiŋ gwa\u0074\u0068 dhali a’bom mo, ’twa/ mo, mmoluŋa luŋ mo, imanmii gwo a’cesh mo walla gwon tiya mo wathi/ jin cila bampa/ mo walla amannya\u006B to mii mo, dhali mal mo, dhali mondho’th mo. Hili, a\u006Bwa/um bwa minu ’koki mii mo e ’kwani kun mii gwo a’cesh mo, dhali mmomii to ka p̱ara p̱o/ mo me’d jin dhala gwoŋ\u006Ban a’di bway mo walla eya ris kal gi ’kwaniny’cesh mo e bampa/ mo walla e ’peŋkuman bampa/ mo a’di jin ta ji gi wathi/ mo, walla a’di di’d ki ’pen piti mo, mii ma \u006Bar/e mo, diki ji is piti a’di ’de/ mo walla e ’bame’di kun tiya kun ta gi moshirr kun jikina ji mo.",
    "Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ mini ’ko ’ba\u006Bany e moŋ’koki/e mo, mmokwanya kwany mo dhali wathi/ midi c̱a’bki ’dantar mo.",
    "Wathin \u0074al ’deŋ kamu/ minu ’koki mii ki miiny c̱iŋkina/ mo walla ka jinthus mo, miiny c̱iŋkina/ mo dhali mii jin yolkunu c̱iŋkina/ minu non ’twa/ mo eya aris jamas gi miim buni ki she/ ki she/ mo.",
    "Wathin \u0074al ’deŋ kamu/ minu ’koki ’kosh mo walla miinu ’koki jee mo, wathi/ minu ’koki mii ka jinthus mo walla minu ’koki sirija ap̱o/ gi sho’k mo walla minu ’koki dor mo.",
    "Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ minu dhu ki monta\u006B ki ’twaŋ\u006Bal kuku/ mo me’d wathi/ jin diki’d e buŋ’kus gi gwoŋ\u006Ban mo.",
    "Aris uni ’baar mo inya\u006Bkan imon\u0074al ’de/ mbwambor gi gwoŋ\u006Ban mo dhali uni yu\u006Bunu mo ki dargi mii ma gwar’de/ mo e mo jin miinu cesh uni ka p̱o/ imon\u0074al ’de/ gi gwoŋ\u006Ban mo. Aris uni ’baar mo yu\u006Bunu imon\u0074al ’de/ mo e mo jin ceshuwa cesh ka p̱o/ mo ’peni mii kun miinu mii ma gwar’de/ mo mmo’ce’d gwoŋ\u006Ban yansan jin \u0074orkunu mo dhali ap̱o/ mii kun yu\u006Bunu mo e mii kun ’koshuwa mee mo hili e mii ma gwar’de/ mo.",
    "Aris uni ’baar mo ka ’de\u0074e/ ’de\u0074e/ mo tani, tan gi tom buni mo kun wanuwa wan ’ba/ mo eya awa\u006B gi kal gi ’kwaniny’cesh mo gom mii jin ’ce’du gwoŋ\u006Ban mo gom mii ma isiŋ gana/ mo jin gamkina a’di mo e gwoŋ\u006Ban jin ye’thkunu a’di sho’k mo walla gi gwoŋ\u006Ban mo.",
    "Wathin \u0074al ’deŋ kamu/ minu ’koki bu’th mo mmota habus mo, walla a’di minu diki ur mo bway bampaŋ kamu/ mo.",
    "Aris uni ’baar mo ka ’de\u0074e/ ’de\u0074e/ yu\u006Bunu mo e mii ma p̱ara p̱o/ mo dhali ’kwani kun ci\u006Bki gwo mo gom mo jin ’konu ki ’pen buni mo, dhali e bwaman ma Awa\u006B mo, e mo jin \u0074oru mii ma \u006Bar/em piti mo dhali mo miiya \u0074u’c mo dhali iman’kosha mee kun miiki mii ap̱o/i a’di mo.",
    "1. Aris uni ’baar mo ka ’de\u0074e/ ’de\u0074e/ miikina \u0074u’c gom mondor ki mii kun ’thenu is mo a’di ta’d gi gwo mmo/o mo a’di jin dargi mii m’ba/ ntagi miinthus piti thimki’d mo isi ki gwoŋ\u006Ban ma wambuhany ’kwani gi mompal mo e a’di jin tana a’di i’baar mo dhali aris gwo jin ona a’di is mo gom mo jin je\u0074\u0074a a’di sho’ka ’cesh mo.\n2. Wathin \u0074al ’deŋ kamu/ minu diki kar miinthusa kamu/ jin midi ’kosh a’di is ka nyor mo gom tonthus mo, e bwaŋ’kwariny gi kal gi ’kwaniny’cesh mo walla gwoŋ\u006Ban gi kal gi ’kwaniny’cesh mo, ka tee c̱aan mo ki a’di miiki tonthus mo. Walla a’di karkunu ton di\u0074i’d e ’bam piti jin burjurkunu a’di ki mondor mo mmobol a’din ’de/ e mo jin miiki to mo ka tee jin dorkunu a’di mo gom tonthus jin miikina a’di mo.",
    "Wathin \u0074al ’de/ kamu/ minu ’koki mii ki miiny c̱iŋkina/ mo ki mii jin minu thul tom piti me’da p̱o/ mo ki tom piti jin tana a’di mo, Awa\u006B piti mo, e kuŋ gu’b piti mo walla ton tiya gunn kun cila a’di mo, walla mmo’kosh monta\u006B piti mo, dhali yer gway mo. Aris ’kwani ’baar mo uni tan gi gwoŋ\u006Ban mo mmocesh tom buni kun tana uni ka p̱o/ mo walla jin ’koshkunu mo.",
    "1. Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ uni dhala gwon\u006Ban bway mo mmo/ii ki ’kus mo dhali mmo/ii bampa/ gi moŋ’ko’d gwar gi gwayu/ gi bampa/ i’baar mo.\n2. Aris ’kwani ’baar ka ’de\u0074e/ ’de\u0074e/ uni mini dhal bampaŋ kamu/ ’pen mo me’d bwam buni mo dhali nya\u006Bki bampam buni mo dhali ki a’di midi do\u006B ka nyaŋ’ko’d bway bampam piti mo.",
    "1. Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ uni mini ŋap̱ bway mo dhali ’kuny bwa mo mmodi mo e bampan tiya kun ’kona ’kwani kun urkunu mo ’peni bampam buni mo ’peni mon\u0074o’c bwa mo.\n2. A’di ta gwoŋ gana/ a’dan jin minu ’koki yu\u006B um mo e mii jin \u0074ojuwa \u0074o’c ’kus ’peni gwo ma isiŋ gana/ mo jin cuki mis mo ’peni ’kwani kun ’koki ta imanmii gwo a’cesh mo kun ’koki ta imanmii tonthus mo walla ’peni mii jin uru gwo mo gom mii mo dhali gwoŋ\u006Ban gi ’kwaniny’cesh kun nya\u006Bki to mii mo.",
    "1. Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ dhala gwoŋ\u006Ban gi bampam piti a’di bway mo mmota com bampa/ mo.\n2. Wathin \u0074al ’deŋ kamu/ minu ’koki non ’twa/ mo ’peni miim buyem bampam piti mo walla minu ’koki non ’twa/ mo mmo/a\u006B miim buyem bampam piti e mo.",
    "1. ’Kwaniŋ gwa\u0074\u0068 dhali aris up̱ kun cakin ki yil mo, uni minu ’koki cesh mo mo gom awa\u006B buni mo walla gom miim buyem bampam buni mo walla gom mo luŋ buni mo. Uni dhala gwoŋ\u006Ban bway mo mmomash mo ki uni mini gam uci mo. Uni yu\u006Bunu mo imon\u0074al ’de/ mo isi ki mii ma \u006Bar/e mo gom mii mash mo, ki embul gi mii mash mo dhali ki mom piti jin karkunu ’kup̱ mo.\n2. Miimash minu thim ki gwoŋ ’kwanin su/ mo dhali gam gwo me’d ki ’bore/ mo jin thosonkina uni is mo mmo\u0074al ’de/ mo.\n3. Awa\u006B a’di ta’da ’kaŋ ’kup̱ mo dhali moŋ\u006Ba’b jin de\u006Bu imon\u0074al ’de/ mo e kuŋ ’kup̱ piti mo dhali a’di yu\u006Bunu mo ki a’di mina ’kwani cesh ka p̱o/ mo dhali ki bampam piti mo.",
    "1. Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ uni tan gi embul mo mmota ki to gom is piti mo ki ’bore/ mo, me’d isi ciki/ mo mmonya\u006B to mii inya\u006Bki ’kwanin tiya mo.\n2. Wathin \u0074al ’deŋ kamu/ minu ’koki non ’twa/ ’peni tom piti jin tana a’di jin ishi’d ka enthus mo.",
    "Aris ’kwani ’baar mo mini ’ko ki ’kom ’pempaŋ gana/ ’ba\u006Bany e bwaŋ kulum buni mo, eya dum buni mo dhali e moŋluŋ buni mo, a’di ta mo jin ’konu ki ’kus mo mmo/a\u006B mo jin luŋuwa luŋ e mo walla moŋgam gwo is mo, dhali di ki ’kus mo, walla a’di midi di a’di ’de/ mo, walla di mo e bwaman ma Awa\u006Ba tiya mo dhali di e bwamani ’kwani mo walla di a’di ’de/ mo, dhali \u0074or moŋluŋ piti mo walla \u0074or moŋgam gwo is piti mo, dhali a’di midi miiya \u0074u’c mo, mmoluŋa luŋ mo dhali mmohila hil ka ’thime mo.",
    "Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ mo uni tan gi embul mo mmo/o gwo jin di’d e bwam buni mo dhali mmo\u0074or mii eya tente/ mo, a’di ta mo jin ’konu ki ’kus jin midi bu’th mo mo gom gwoŋ kulum mo ki dargi mo jin ceshu mo mo dhali simm a’di e mo, mmobu’th mo dhali da/ar gwo jin \u0074oru mo dhali gwo kun c̱inu mo e to jin \u0074orkunuwa \u0074or nycine/ mo dhali dargi mo jin a\u006Bu gwayu/ e mo.",
    "1. Aris uni ’baar mo ka ’de\u0074e/ ’de\u0074e/ dhalu bway mo mmo’ko ki ’kus mo e moŋ\u006Bu’th is mo gi montul is mo dhali e mo jin tula ’kwani ’kup̱ mo.\n2. Wathin \u0074al ’deŋ kamu/ minu ’koki non ’twa/ mo ’peni montul is jin tulu ka ŋul’kup mo.",
    "1. Aris uni ’baar mo ka ’de\u0074e/ ’de\u0074e/ mo dhala gwoŋ\u006Ban bway mo mmonya\u006Ba \u0074u’c mii eya hakuma gi bampam piti mo, ka ji sho’k mo walla gom wathi/ jin kwanykunu ’ba\u006Bany mo e bwambori uni mo.\n2. Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ mo dhala gwoŋ\u006Ban bway mo mmonya\u006B \u0074u’c mii mo inya\u006Bki ’kwani gi bampam piti mo.\n3. Dhali ’kwani mini mii mo me’d bwa gi ’kwani kun ta gi moshirr kun miikina \u0074u’c ma hakuma mo, a’di ta mii jin minu mii ki ari momo dhali aris ’kwani gi mony’cesh mini kwany to jin mina uni ta\u006B toŋ \u006Bar/e mo dhali uni mini ta\u006B to imon\u0074al ’de/ mo dhali mini bu’th to kun tagu ka \u006Bwal is mo walla to jin tagu ka p̱ara p̱o/ mo e mo jin ta\u006Bunu uni mo.",
    "Aris uni ’baar mo ka ’de\u0074e/ ’de\u0074e/ mo, isi me’d jin tana uni imannya\u006Ba \u0074u’c mii mo, uni tan gi moshirr mo mmo’ko ’ba\u006Bany ki ’dantar mo dhali uni yu\u006Bunu mo e mo jin minu ka uni e mo, e mii gi bampam buni mo dhali mii gi ’peŋkuman bampan tiya mo dhali inya\u006Bki isi mii gi ’kwani kun miikina \u0074u’c kun wo\u0074\u0068kina wo\u0074\u0068 mo dhali goma aris tom buni kun ish \u006Bumma/ mo, to kun miinu me’d ka woho/ mo, mo kun nya\u006Bku to mii mo dhali gom mii kun miinu mo kun cilkina a’di mo dhali mii jin nyaŋkina buŋgwar is gi wathimpa en’thi/ mo.",
    "1. Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ uni dhala gwoŋ\u006Ban bway mo mmomiiya \u0074u’c ’ba\u006Bany mo, dhali jin minu kwany uni mo mmomiiya \u0074u’c mo, dhali isi ki mo mii mii ma isiŋ gana/ mo dhali mmogama ’the eya \u0074u’c jin miikina uni mo, dhali cesh uni gwansan ka p̱o/ uni kun ’kokin mo ki darga \u0074u’c mo.\n2. Aris uni ’baar mo ka ’de\u0074e/ ’de\u0074e/, kun dargi mii ma gwar’de/ mo, uni ’kon ki ’kus mo mmoc̱i to imon\u0074al ’de/ mo goma \u0074u’c jin miikunu ka p̱ara p̱o/ mo.\n3. Aris uni ’baar mo ka ’de\u0074e/ ’de\u0074e/ kun miikina \u0074u’c mo uni ’kon ki ’kus mo mmomii mii ma isiŋ gana/ mo dhali gam to jin minu c̱i ki ’bore/ gom is buni mo ki ’dantar mo dhali goma Awa\u006B buni kun ’kokin kun ta\u006Ba ’kwaniny’cesh goma \u0074u’c mo, dhali mar tom buni is mo, wa\u006Bki/ a’di mishu mii mo ki ’kwanin tiya kun ceshki mo ka p̱o/ kun ’kokin ka ŋul’kup̱ mo. \n4. Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ uni tan gi embul mo mmo/u\u006B to mo dhali ki a’di minu c̱i’th ka warka/ mo gom to jin mina a’di yol mo gom bwam piti jin o a’di ki \u006Bal to iyol mo.",
    "Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ uni tan gi moshirr mo mmosi/is mo dhali mmomalasa malas mo, inya\u006Bka usha \u0074u’ca gwa’dga/ jin miikina a’di mo dhali ka tee jin sinu is mo jin c̱ikunu to mo.",
    "1. Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ mini ta gi embul mo mmo’koki/e mo gom is piti ki ’bore/ mo dhali mmokar buŋgwar is piti ki dhelel dhelel mo dhali Awa\u006B piti mo, inya\u006Bki ton\u0074e/ mo dhali burrinye/ jin hi’thu i is mo dhali gu’b mo dhali thosona guruush goma dhawa/ mo dhali miiya \u0074u’c ka ŋul’kup̱ mo, dhali c̱a’bki ’dantar e to kun p̱̱u’dkin mo e uni kun darga \u0074u’c mo, uni kun ’ba’than mo dhali ’kwani kun a\u0074\u0068a is mo dhali a’bom jin wun ma ka\u0074\u0068im piti mo dhali kun cakin ki yil mo walla a’di jin gamki monyc̱a’b piti mo e mii kun tu\u006B ’ban mo kun jiki a’di mo.\n2. Ata’da mo dhali ushi uc̱i mo uni yu\u006Bunu mo mmodhip̱ ki ’bore/ mo dhali wo\u0074\u0068a wo\u0074\u0068 mo. Aris ushi uc̱i i’baar mo kun dho’thkunu mo e bwaman gi miimash mo walla ka pije/ gi miimash mo, uni mina bwa ’kuny inya\u006Bki ’kwani kun ceshkunu ka p̱o/ mo.",
    "1. Aris uni ’baar mo ka ’de\u0074e/ ’de\u0074e/ uni dhala gwoŋ\u006Ban bway mo mmomiiya awarka/ mo. Mo ma warka/ miinu mii ki me’d mo, isi ciki/ ki mon\u0074el ’pen gi Mo ma warka/ jin minu mii mo. Mmo/u\u006B to mo dhali mo ma warka/ minu nyaŋ ki ’bore/ mo dhali Mo ma warka/ jin miinu e gu’ba caaga/ imon\u0074al ’de/ mo e moŋ\u006Ba’b jin minu mii miim ’boro’d mo.\n2. Mo ma warka/ minu mii \u0074or gi ’kwaniny’cesh mo mmothim mo dhali ’bi’th ’kwani is mo mmodhu is ki gwa’d mo mmota\u006B ’kwani kun miikina \u0074u’c mo mmoc̱i ’kwani bway mo e gwoŋ \u006Bar/e mo dhali mmoc̱i mo jin ’konu ki ’kus mo. A’di midi hal ’kwani mo jin mishu gwo ’ban mo, mmo\u006Bu’c bwa ki ’kari’th mo dhali mmota mugu gi kal gi ’kwani gi mony’cesh mo, walla aŋul’kup̱ mo walla ’kwani kun luŋkina luŋ mo, dhali mii ki nyanye/ mo e ’kwani gi mony’cesh mo uni kun miiki moŋ\u006Bu’th is mo.\n3. Ibaba dhali ita’da uni tan gi embul mo mmokwany Mo ma warka/ jin ’boro’d mo jin mina uni dhu uc̱im buni nycine/ mo.",
    "1. Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ uni ’kokin ki ’kus mo mmomii miim buni mo e bwaman ma Awa\u006B mo, dhali lo’b mo mmo’kuny bwa mo dhali mii mondhelele’d bway \u0074wa/a mo dhali mii miim ’boron buni mo.\n2. Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ mini ti\u006B miim buni e jin midi wu mo dhali aris ton tiya kun ena uni kun dhelelin mo, awarka/ mo walla to kun u\u006Bu mo e a’di jin ta’da aman’kwar to mo.",
    "Aris ’kwani ’baar mo ka ’de\u0074e/ ’de\u0074e/ uni yu\u006Bunu mo dhali aris ’kwaniny’cesh kun thoson ki to mo e mii ma isiŋ gana/ mo dhali ’ko ki ’kus mo e mo jin \u0074orkunu gwo mo jin \u0074oru gwo eya tente/ mo.",
    "1. Aris ’kwani i’baar mo ka ’de\u0074e/ ’de\u0074e/ uni tan ga \u0074u’c e ’kwani mo e mo jin mina a’di di a’di ’de/ ki ’kus mo dhali jin mina a’di misha a\u0074u’c piti mii mo mmomar a’di is mo.\n2. E mii ma isiŋ ganam piti mo dhali di ki ’kus mo, aris uni ’baar mo ka ’de\u0074e/ ka ’de\u0074e/ minu ’koki mii ki miiny c̱iŋkina/ mo jin minu jiya ji jasi ’te/ mo me’d jin \u0074orkunu gwo ki gwoŋ\u006Ban gom wathin \u0074al ’deŋ kamu/ mo gom mii kun ’konu ki ’dantar mo ki mii jin minu pi gwo mo dhali dhu is ki gwa’d mo gom mii ma isiŋ gana/ mo dhali ’ko ki ’kus inya\u006Bki kun tiya mo dhali montul is jin do\u0074u gwo gom miim ’boro’d mo, mmothoson ’kwani mo dhali mmo\u006Bal ’kup̱ ŋwa/ pa mo mmomii ka p̱ara p̱o/ mo.\n3. Mii ma isiŋ gana/ yansan mo minu ’koki mii mo gom jasi a’di mo, dhali gom ’kup̱ gwo gi ’kwani gi mony’cesh mo.",
    "Toŋkamu/ yisa di’da jin minu ’koki \u0074or mo mmo’koki \u0074or ’pemen eya tente/ goma ris bampan tiya mo, ’kwani kun ’kon ka non she/ mo walla wathin ’deŋ kamu/ jin ona bwa ki miiya \u0074u’ca tiya mo walla a’di jin ona bwa ki u\u006B ton tiya mo mmo’ce’da ’ce’d sho’k mo e ton tiya jin ona bwa a’di mo dhali c̱a’b ’ba\u006Bany e mondim piti mo."
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

  unSaveBan() async {
  }

  bool isPlayerOpened = false;
  int indexNo = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Banu`b'),
      ),
      body: ListView.builder(
          itemCount: Bans.length,
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
                            Bans[index],
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
      lang: 'uduk',
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
