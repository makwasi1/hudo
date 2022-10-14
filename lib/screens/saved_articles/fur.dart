

import 'package:hudo/screens/bottom_navigation_bar/bottom_navigation_bar.dart';

import 'package:hudo/utils/audio_controller.dart';
import 'package:hudo/utils/check_direction.dart';
import 'package:hudo/utils/file_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedBaamsFur extends StatefulWidget {
  @override
  _SavedBaamsFurState createState() => _SavedBaamsFurState();
}

class _SavedBaamsFurState extends State<SavedBaamsFur> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  FocusNode fieldNode = FocusNode();
  String currentUserId = "default user id";

  final titles = [
    "Baam 1",
    "Baam 2",
    "Baam 3",
    "Baam 4",
    "Baam 5",
    "Baam 6",
    "Baam 7",
    "Baam 8",
    "Baam 9",
    "Baam 10",
    "Baam 11",
    "Baam 12",
    "Baam 13",
    "Baam 14",
    "Baam 15",
    "Baam 16",
    "Baam 17",
    "Baam 18",
    "Baam 19",
    "Baam 20",
    "Baam 21",
    "Baam 22",
    "Baam 23",
    "Baam 24",
    "Baam 25",
    "Baam 26",
    "Baam 27",
    "Baam 28",
    "Baam 29",
    "Baam 30"
  ];

  List Baams = [
    "kwa-sí nyéttiŋ baajtólá kereli nás nisila na ta̠gɨdɨŋ arrá ka̠ɨŋ, Naŋ-sí ugola na kilmaŋá arrá ka̠ɨŋ namá in lóŋ áláŋ sǔrŋâ-sí kí jaiŋa in kéél ná sǔrŋâ suurꞌíŋ bârŋa.",
    "Dᵾó bi dᵾó nisil-si kee áláŋ kin nisila nyéttiŋ âl in sabarꞌíŋ dɨó ka̠ɨŋ áláŋ nyéttiŋ bʉ́lóŋ na áláŋ dᵾó bára-sí as jáwŋelba péllétíŋ inná úluꞌŋ ere, dɨɨrɨ́eŋ ere, wala gal tá̱á̱rɨ́ŋ ere, wala beléꞌŋ ere, wala gal tiríjinnéŋ járriꞌŋ {ra̱yꞌíŋ} ere, wala dᵾóꞌŋ da̱a̱rɨŋꞌíŋ ere, wala ba̠rʉ ǎl  yee ka̱rɨŋɨ, wala yé kaas kee, wala ba̠rʉ ǎl yé dée-lé êl, wala a̠rɨ keeríŋ ere. 2. Inná ǎlbá ka̠rɨ́ŋ eréŋ kwa ásáŋ kwa-sí ás kǎwŋelba inná tiríjinníŋ jaiŋaꞌŋ ere, dáálíꞌŋ ere, da̠ldɨꞌŋ bá̱rʉ́ŋáꞌŋ ere, wala ba̠rᵾꞌŋ sabba ela–lé ǎl dᵾó dée-le kee ati in lóŋ ná térríŋ kɨrél wala gal nás ba̠rʉ keeríŋ-si domoŋaꞌŋ-si dǔu ka̠ɨ́ŋ wala gal ba̠rʉ nás ba̠rʉ keeríŋ taála-lé ka̠ɨ́ŋ nás kʉrɨŋ dééŋ ás keba namás jɨgéŋáꞌŋ-si dǔu ka̠ɨ́ŋ",
    "Dᵾó bi dᵾó nisil-si kee inná jaiŋaꞌŋ ere áláŋ kee kí baaj na suurꞌíŋ a̱ndɨŋ.",
    "Dᵾó á keba áláŋ kooy-ii [koy]-ii káwa (kâlbá) pékkétíŋ na áláŋ kʉyɨŋ na kwǎꞌŋ julu-sí kí koraŋa nyét kaasi.",
    "Dᵾó á keba áláŋ kooy-ii [koy]-ii káwa (kâlbá) pékkétíŋ na áláŋ kʉyɨŋ na kwǎꞌŋ julu-sí kí koraŋa nyét kaasi.",
    "Dᵾldɨꞌŋkwě á keba ásáŋ kɨgɨ́al, wala ʉʉ ɨt ás káwalba áláŋ rágíseŋ wala bɨ́ɨ́leŋ eeŋ, namaŋ níŋ dééŋ ta̠gɨdɨŋ kúró wala ná jɨ́o.",
    "Dᵾldɨꞌŋkwě lóó bi lóó ná kee ásáŋ dééŋ suurꞌíŋ dáálí-sí ba̠gɨ káwal wala nás kɨnal inná kʉrɨŋꞌíŋ sabba.",
    "Kwa nyéttiŋ dáálíꞌŋ ta̠bʉ́ŋ arrá gé, naŋ-si nyéttiŋ nisil arrá ka̠ɨŋ ásáŋ á ka̱á̱ŋʉlba inná nimaꞌŋ jáaꞌŋ ere wala maméeŋ ere, naŋ-si dog nisil arrá ka̠ɨŋ. Atiŋ ja̱wnyɨŋ eŋa kila jaáŋoŋa ǎl in janyal (sabar) úríŋí wala a̱rɨ bi a̱rɨꞌŋ jaáŋoŋa–lé.",
    "Dᵾó bi dᵾó nisil-si kee áláŋ ba̠rʉꞌŋ jánsá jee ná arrájaa kóíŋí abá in lóŋ nás kééŋ nisila-lé ka̠rɨ́e kila asá kʉrɨŋ jáá walas dáálí jáá.",
    "Dʉó á keba áláŋ á kǐalba wala dɨ́mɨ́l á kayeba, wala kí durú á kʉ̌rralba.",
    "Dʉó bi dᵾó nisil-si kee nyét-le kí kwaꞌŋ arrá ásáŋ dééŋ da̠lɨ́me jánsá ka̠gɨ́lal kí murulꞌíŋ dorá terere, ásáŋ nisila-sí na toósa-sís kerker káwal kí ja̱nɨ ɨt âl kíe kiímé.",
    "Dᵾó bi dʉó ná kí ja̠nɨ kiímé ja̠nɨ́on ǎ-iiba namaŋ-síŋ jansɨŋ káwal nás kí dáálíꞌŋ koraŋa tɨe, in jansa áláŋ paál-lé-ii áláŋ kí bʉ̌tʉ ǎ-iiba na ásáŋ kɨ̌nal nás mamêŋa káwal.Ásáŋ dʉó bi dᵾó-sí á kɨgɨ́alba dééŋ tááríꞌŋ ʉʉ́ŋ ǎl pii, wala táárí ǎl urel áláŋ piá, ila abá in lóŋ ná in táárí kí ba̠rʉꞌŋ dáálí-le ja̱nɨ-ii wala gal kí da̠ldɨꞌŋkuriꞌŋ dáálí-ii, maraŋ jɨgé ela-lé ás nyiíŋíba ǎl dáálíꞌŋ dɨó á keba, asá yé ila tin-lé ráwé kí ja̱nɨ.",
    "Dᵾó togbɨ́r báraꞌŋ ʉ́tóŋá-lé kí durú a ká̱rɨ́ba ati dééŋ suurꞌíŋ-le wala dééŋ toŋꞌíŋ kwaꞌŋ, wala oroŋaꞌŋ sǔbu na nyá̱lɨ́ŋɨ́ŋ, na dᵾó bi dᵾó nisil-si kee áláŋ-si dáálí mamêye piá kila ja̠a̱rɨ́ŋaꞌŋ ere.",
    "Dᵾó bi dʉó baaj jɨloŋꞌíŋ-si kee na lóó ɨt ná yé kǒel áláŋ oóŋ dééŋ ba̠rʉꞌŋ dɨó.Dᵾó bi dᵾó nisil-si kee áláŋ jee ba̠rʉŋa kerŋa-lé na dééŋ ba̠rʉ́, na áláŋ wá̱ɨ́ŋa tin ɨt-lé ná yé kǒel.",
    "Dʉó bi dᵾó nisil-si kee áláŋ sa̱kkɨ́á na tusus ammí na jee ba̠rʉ keer-lé abás jɨgɨ́ŋá suŋŋá ɨŋɨ ba̠rʉ ela–lé âl yé kee.In nisil-sí dᵾó ɨt-sí á kanníaba asá jansa kí da̠lɨme ɨt keéŋé nás kí tiríjinni ás tɨɨlɨba walá ʉ́tóŋá kɨt á geba âl kí dá̱ldɨ́ŋáꞌŋ ja̱nsɨŋꞌíŋ daara ká̱ldá̱bʉ kawe.",
    "Dᵾó bi dᵾó nisil-si kee ásáŋ tirgeꞌŋ gǎar kee nás táárí pii.Dᵾó-sí tirgeꞌŋ gǎar as ka̱wríŋíalba, na dééŋ nisil-sí ba̠gɨ káwal, na baaj ati in kwǎ ásáŋ já̱ɨ́ŋó dééŋ tirge-sí.",
    "Dʉó bi dᵾó nisil-si kee ásáŋ ótáŋá dééŋ dítiníŋ kee wala gal nás kí kwa kerŋaꞌŋ sa̠rɨ́ga (sa̱dɨ́ga) gé.Dʉó bi dʉó bára-sí kééŋ ótáŋá kí durú ásáŋ á rɨ́éba.",
    "Nɨw na dee ammíŋ jʉ́seꞌŋ ka̠a̠gʉl nisil-si ka̠ɨŋ ásáŋ jʉ́se káwal ná dɨ́eŋ tóŋ dítinꞌíŋ kʉ́ʉl, na áláŋ dɨ́eŋ órré káwa, ilâíŋ ere dᵾó togbɨ́r tabʉ́ŋ as keerba áláŋ-si úríŋí, ati tirgeꞌŋ ʉʉꞌŋ-ii wala tá̱á̱rɨ́ꞌŋ ere, naŋ-si dog nisil arrá ka̠ɨŋ jʉ́seꞌŋ jáa-lé namaŋ dééŋ jaaró-le.Jʉ́seꞌŋ gǎar-sí á keréŋéliba abá kí kwa a̠wdʉoŋ níŋ tᵾs {jɨɨn} janí, na áláŋ ila tᵾs janí kí dorá á-iiba.Toŋꞌíŋ jáa yé a̠rɨ ɨt-ii ǎl tɨmor kíe tᵾ́mɨ́ŋ na in lóŋ tɨmor ná ba̠rʉ ásáŋ toŋꞌíŋ jáa-sí kanyíŋíal nás ka̱á̱nʉl.",
    // "Dʉó bi dᵾó nisil-si kee ásáŋ ótáŋá dééŋ dítiníŋ kee wala gal nás kí kwa kerŋaꞌŋ sa̠rɨ́ga (sa̱dɨ́ga) gé.Dʉó bi dʉó bára-sí kééŋ ótáŋá kí durú ásáŋ á rɨ́éba.",
    "Dᵾó bi dᵾó nisil baaj jarriꞌŋ na suurꞌíŋ urmaꞌŋ na tá̱á̱rɨ́ꞌŋ-si kee, na in nisil dog gî baaj ínni ati dᵾó kǒel ásáŋ dééŋ tá̱á̱rɨ́ já̱ɨ́ŋó, wala ásáŋ ɨwɨ́ kí gʉʉd na áláŋ kééŋ taɨma piá ati kí bʉ̌tʉ-ii wala kí ʉrʉ́ ati in lóŋá ná dítinꞌíŋ-ii wala kí kwa suŋŋâŋ-ii.",
    "Dᵾó bi dʉó nisil-si kee baaj jírsíŋoꞌŋ, na dééŋ jwǎꞌŋ, na in nisil dog gî ʉʉŋa kɨt-sí ínni ǎl kǒel áláŋ deb kǎ̱ɨ dᵾó áláŋ ǎis úríŋíba (íríba), ilâíŋ ere na kin ʉʉŋaꞌŋ jǎ̱ɨ, na dééŋ jawar-sí ka̠tɨ́ as kayeba.",
    "Dʉó bi dʉó nisil na baaj-si kee áláŋ-si daaraŋa kwaꞌŋ jɨ́sɨ́ŋoŋaꞌŋ ǎl seeŋa gé nás dée-lé jɨ́gɨ́ŋɨ́e.Dᵾó-sí á keba áláŋ kɨgɨ́al ásáŋ daara díg-le jɨ́gɨ́ŋɨ́ kí durú.",
    "Dʉó bi dʉó nisil-si kee áláŋ dééŋ ba̠rʉꞌŋ ótáŋáꞌŋ táárí-le ká̱rɨ́ ati yé kí dééŋ suur-ii wala kí dʉó keerꞌíŋ dorá ǎl yé rééŋél kí baajꞌíŋ dorá.Dʉó bi dʉó nisil-si kee áláŋ ʉ́tóŋá nyéttiŋ sa̠ga̠lɨŋ tɨ̌ɨ dééŋ ba̠rʉ́.Kʉldɨŋaꞌŋ muráa yé-ii ǎl gî da̠lɨmɨŋ ínni na in muráa-sí áláŋ-si kí jᵾmbᵾtɨŋꞌíŋ dorá terere kélal, namá in lóŋ paraŋaꞌŋ jiŋí-le áláŋ kí bʉ̌tʉ-ii wala gal kí â̱y dorá keer ǎl jʉ́ndɨ áláŋ paraŋaꞌŋ jiŋí kí baaj eeŋ.",
    "dʉó bi dʉó yé tɨmor-lé tógóló-ii tɨmorꞌíŋ-si mɨrod kee ǎl kí ba̠rʉꞌŋ kʉrroꞌŋ táas ja̠rɨ́ ɨ́ndélíŋ na da̠ldɨŋaꞌŋ kotte, ǎl jʉ́ndɨ áláŋ ba̠rʉ bi barʉ kééŋ kosomona na ɨwɨlɨ́ŋ nisila na bʉllɨŋ tɨmorꞌíŋ na jʉrnyó ǎl nyéttiŋ ta̠gɨdɨŋ-sí na suurꞌíŋ tʉ́ɨꞌŋ jʉ́ndɨ áláŋ kí baaj eeŋ. ",
    "Dʉó bi dʉó tááríꞌŋ nisil-si kee na dog baaj-si kee áláŋ táárí ɨt jááŋo ǎl yé kǒel áláŋ piá, kí moralꞌíŋ dorá naŋ-si dog nisil kee áláŋ ka̱a̱nʉl tááríꞌŋ wa̠rɨŋ ere.na dʉó á keba áláŋ-si kí bára kǎ̱wŋʉl (ka̱wgɨ́ŋíal) ǎ̠w ná soŋŋâ arrá kanníá. Dʉó bi dʉó ná táárí pii áláŋ sôŋgoŋa ɨt kaníal áláŋ ye-sí na dééŋ toŋꞌíŋ kwa-sí pa̱a̱gʉl ná ruugꞌíŋ kí ta̠gɨdꞌíŋ dorá, na ásáŋ tɨmorꞌíŋ jaánoꞌŋ koraŋa kerŋa nyiíŋí dée-lé.Dʉó bi dʉó nisil-si kee áláŋ tááríŋáꞌŋ jɨ́sɨ́ŋoꞌŋ daara piá wala ásáŋ ɨt-lé jɨ́gɨ́ŋɨ́ ǎl yé dée-lé dééŋ suur túllên la̠w.",
    "Dʉó bi dʉó nisil-si kee áláŋ ʉmel jáwíti, tina hǒoŋa-lé, na ásáŋ dɨoŋa dǐi kaye tááríꞌŋ, na pa̱rrɨ́ŋá ǎl terere ʉ́ndʉ́lá áláŋ kí sôŋgoŋa gé.",
    "Dʉó bi dʉó nisil-si kee áláŋ ruug ɨt bʉ́lóŋ ǎl jʉ́ndɨ áláŋ dééŋ suur ká̱kkɨ́ré-ii (da̠kkʉrɨŋ) na írí joo–si kee dééŋ suurꞌíŋ na dééŋ toŋꞌíŋ kwaꞌŋ, in namá in lóŋ áláŋ-si míŋ anni-le tuuŋ na̠mɨ́e-lé na jʉrɨŋa na jôŋꞌíŋ lóó na ɨpɨrɨŋꞌíŋ já̠lpʉ́ŋóla na dɨmorꞌíŋ ótáŋá, na áláŋ-si ruug kee ati in lóŋ ná hǒo ǎ̠w ná táárí ás keba, wala hǒo jaŋꞌíŋ ere, wala inná tʉyɨŋ wala gal nás a̠rɨ keer kee ná jɨ́gé áláŋ táárí júndí.Nyʉrgɨŋꞌíŋ na iyaŋaꞌŋ nisil-si ka̠ɨŋ ja̠lpʉŋꞌíŋ na jányíŋi-lé na ásáŋ dogólá nyéttiŋ dɨmoraꞌŋ jaáno ka̠ɨŋ arrá ati in lóŋ ná dééŋ da̱a̱rɨŋ kí asâb kéŋá wala gal kí asâb á kéŋaba.",
    "Dʉó bi dʉó nisil-si kee gʉʉd-lé, na in lóŋ áláŋ diílkuri (diílkuriŋaꞌŋ) na kʉréemeŋaꞌŋ gʉʉd áláŋ kee hǒo-ii na diílkuriŋaꞌŋ gʉʉd áláŋ kí jɨgé-ii, na gʉʉd in lóŋ áláŋ ʉstɨŋaꞌŋ na teŋgeŋaꞌŋ gʉʉd-ii na áláŋ gʉʉd íríkwǎꞌŋ-lé kwa-sí nyét arrá ka̠bɨ́a kí kɨ́eŋ kʉrroꞌŋ adde.Namá in lóŋ áláŋ kí dorá ɨt ná kí dᵾldɨꞌŋkwě'ŋ jᵾtᵾ́mó-le péégél na dᵾldɨꞌŋkwěŋ ba̠gɨ gîs nyiíŋíti na baaj dǔuŋa na áláŋ suurꞌíŋ jɨrmó na ja̱wrɨŋꞌíŋ kwa nyéttiŋ táas-lé kee ati tá̱á̱rɨ́ꞌŋ ere-ii wala inná dá̱ldɨ́ŋáꞌŋ toŋkuriꞌŋ daaraꞌŋ ta̱bʉ áláŋ dóŋáꞌŋ janí ta̱gɨdeŋ piá.Da̱a̱rɨŋkwǎ (íya kí  bba) nisil-si ka̠ɨŋ áláŋ dorá ɨt-sí kěyal kɨ́eŋ dogóláꞌŋ jᵾrnyóꞌŋ ǎl yɨeŋ taaras ka̠lʉe-ii.",
    "Dʉó bi dʉó nisil-si kee áláŋ dɨmoraꞌŋ bʉllɨŋ-lé ká̱rɨ́ kí baajꞌíŋ dorá, na áláŋ-si jápírtígoŋa na mʉʉgɨŋ-sís táárí piá áláŋ-si gʉʉdꞌíŋ írí joo-lé nyiíŋí ásáŋ kééŋ tulléŋa koomé.Dʉó bi dʉó nisil-si kee áláŋ-si kééŋ tulléŋa-sí ka̱a̱gʉl ati bʉllɨŋ-ii wala jápírtíŋogaꞌŋ ere ása gʉʉd-sí nyiíŋítíá na asá yé arríti.",
    "Dʉó bi dʉó tááríŋás kee dééŋ dɨmorꞌíŋ ere áláŋ piá ǎl yé kǒel áláŋ dée-lé tʉ́ɨ́ kí baaj.Dʉó asá kééŋ nisila na baaja-sís táárí pii ka̠tɨ́ŋás kee nás dáálí jáwríti délliŋ. Ɨdɨ̂ɨ́ŋ ná kǒel áláŋ dʉó keerꞌíŋ baaj na nisila-lé a ká̱rɨ́ba, Ɨdɨ̂ɨ́ŋ na kǒel áláŋ kwa kerŋaꞌŋ baaja ba̠gɨ káa, áláŋ kwa nyéttiŋ ótáŋá-sís ba̠gɨ na arrás káa, na dɨmora dɨmogurátês ka̠ɨŋ.Ásáŋ á kɨɨ́naba kí dorá bi dorá áláŋ-si kin nisila-sís táárí kí dorá ɨt káal ǎl kí dá̱ldɨ́ŋáꞌŋ toŋkuriꞌŋ daaraꞌŋ tááríŋá tarŋa sa̠rgɨ ba̠we.",
    "Ínné in janyal-lé rim togbɨ́r á keba áláŋ ba̱rʉ júndí, wala kwa dǐiŋa wala dʉó díg-sí áláŋ jee ná ʉʉ ɨt piá áláŋ kin nisila na baaja-sí jɨ́o ǎl in janyal (sabar-lé) ka̠ɨŋ."
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

  unSaveBaam() async {
  }

  bool isPlayerOpened = false;
  int indexNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Baama'),
      ),
      body: ListView.builder(
          itemCount: Baams.length,
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
                          subtitle: Text(
                            Baams[index],
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
      lang: 'fur',
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
