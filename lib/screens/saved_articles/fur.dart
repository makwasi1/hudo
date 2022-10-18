import 'dart:convert' show utf8;

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
    "kwa-sí nyéttiŋ baajtólá kereli nás nisila na ta̠g\u0069d\u0069ŋ arrá ka̠\u0069ŋ, Naŋ-sí ugola na kilmaŋá arrá ka̠\u0069ŋ namá in lóŋ áláŋ sǔrŋâ-sí kí jaiŋa in kéél ná sǔrŋâ suurꞌíŋ bârŋa.",
    "D\u0075ó bi d\u0075ó nisil-si kee áláŋ kin nisila nyéttiŋ âl in sabarꞌíŋ d\u0069ó ka̠\u0069ŋ áláŋ nyéttiŋ b\u0075́lóŋ na áláŋ d\u0075ó bára-sí as jáwŋelba péllétíŋ inná úluꞌŋ ere, d\u0069\u0069r\u0069́eŋ ere, wala gal tá̱á̱r\u0069́ŋ ere, wala beléꞌŋ ere, wala gal tiríjinnéŋ járriꞌŋ {ra̱yꞌíŋ} ere, wala d\u0075óꞌŋ da̱a̱r\u0069ŋꞌíŋ ere, wala ba̠r\u0075 ǎl  yee ka̱r\u0069ŋ\u0069, wala yé kaas kee, wala ba̠r\u0075 ǎl yé dée-lé êl, wala a̠r\u0069 keeríŋ ere. 2. Inná ǎlbá ka̠r\u0069́ŋ eréŋ kwa ásáŋ kwa-sí ás kǎwŋelba inná tiríjinníŋ jaiŋaꞌŋ ere, dáálíꞌŋ ere, da̠ld\u0069ꞌŋ bá̱r\u0075́ŋáꞌŋ ere, wala ba̠r\u0075ꞌŋ sabba ela–lé ǎl d\u0075ó dée-le kee ati in lóŋ ná térríŋ k\u0069rél wala gal nás ba̠r\u0075 keeríŋ-si domoŋaꞌŋ-si dǔu ka̠\u0069́ŋ wala gal ba̠r\u0075 nás ba̠r\u0075 keeríŋ taála-lé ka̠\u0069́ŋ nás k\u0075r\u0069ŋ dééŋ ás keba namás j\u0069géŋáꞌŋ-si dǔu ka̠\u0069́ŋ",
    "D\u0075ó bi d\u0075ó nisil-si kee inná jaiŋaꞌŋ ere áláŋ kee kí baaj na suurꞌíŋ a̱nd\u0069ŋ.",
    "D\u0075ó á keba áláŋ kooy-ii [koy]-ii káwa (kâlbá) pékkétíŋ na áláŋ k\u0075y\u0069ŋ na kwǎꞌŋ julu-sí kí koraŋa nyét kaasi.",
    "D\u0075ó á keba áláŋ kooy-ii [koy]-ii káwa (kâlbá) pékkétíŋ na áláŋ k\u0075y\u0069ŋ na kwǎꞌŋ julu-sí kí koraŋa nyét kaasi.",
    "D\u0075ld\u0069ꞌŋkwě á keba ásáŋ k\u0069g\u0069́al, wala \u0075 \u0069t ás káwalba áláŋ rágíseŋ wala b\u0069́\u0069́leŋ eeŋ, namaŋ níŋ dééŋ ta̠g\u0069d\u0069ŋ kúró wala ná j\u0069́o.",
    "D\u0075ld\u0069ꞌŋkwě lóó bi lóó ná kee ásáŋ dééŋ suurꞌíŋ dáálí-sí ba̠g\u0069 káwal wala nás k\u0069nal inná k\u0075r\u0069ŋꞌíŋ sabba.",
    "Kwa nyéttiŋ dáálíꞌŋ ta̠b\u0075́ŋ arrá gé, naŋ-si nyéttiŋ nisil arrá ka̠\u0069ŋ ásáŋ á ka̱á̱ŋ\u0075lba inná nimaꞌŋ jáaꞌŋ ere wala maméeŋ ere, naŋ-si dog nisil arrá ka̠\u0069ŋ. Atiŋ ja̱wny\u0069ŋ eŋa kila jaáŋoŋa ǎl in janyal (sabar) úríŋí wala a̱r\u0069 bi a̱r\u0069ꞌŋ jaáŋoŋa–lé.",
    "D\u0075ó bi d\u0075ó nisil-si kee áláŋ ba̠r\u0075ꞌŋ jánsá jee ná arrájaa kóíŋí abá in lóŋ nás kééŋ nisila-lé ka̠r\u0069́e kila asá k\u0075r\u0069ŋ jáá walas dáálí jáá.",
    "D\u0075ó á keba áláŋ á kǐalba wala d\u0069́m\u0069́l á kayeba, wala kí durú á k\u0075̌rralba.",
    "D\u0075ó bi d\u0075ó nisil-si kee nyét-le kí kwaꞌŋ arrá ásáŋ dééŋ da̠l\u0069́me jánsá ka̠g\u0069́lal kí murulꞌíŋ dorá terere, ásáŋ nisila-sí na toósa-sís kerker káwal kí ja̱n\u0069 \u0069t âl kíe kiímé.",
    "D\u0075ó bi d\u0075ó ná kí ja̠n\u0069 kiímé ja̠n\u0069́on ǎ-iiba namaŋ-síŋ jans\u0069ŋ káwal nás kí dáálíꞌŋ koraŋa t\u0069e, in jansa áláŋ paál-lé-ii áláŋ kí b\u0075̌t\u0075 ǎ-iiba na ásáŋ k\u0069̌nal nás mamêŋa káwal.Ásáŋ d\u0075ó bi d\u0075ó-sí á k\u0069g\u0069́alba dééŋ tááríꞌŋ \u0075́ŋ ǎl pii, wala táárí ǎl urel áláŋ piá, ila abá in lóŋ ná in táárí kí ba̠r\u0075ꞌŋ dáálí-le ja̱n\u0069-ii wala gal kí da̠ld\u0069ꞌŋkuriꞌŋ dáálí-ii, maraŋ j\u0069gé ela-lé ás nyiíŋíba ǎl dáálíꞌŋ d\u0069ó á keba, asá yé ila tin-lé ráwé kí ja̱n\u0069.",
    "D\u0075ó togb\u0069́r báraꞌŋ \u0075́tóŋá-lé kí durú a ká̱r\u0069́ba ati dééŋ suurꞌíŋ-le wala dééŋ toŋꞌíŋ kwaꞌŋ, wala oroŋaꞌŋ sǔbu na nyá̱l\u0069́ŋ\u0069́ŋ, na d\u0075ó bi d\u0075ó nisil-si kee áláŋ-si dáálí mamêye piá kila ja̠a̱r\u0069́ŋaꞌŋ ere.",
    "D\u0075ó bi d\u0075ó baaj j\u0069loŋꞌíŋ-si kee na lóó \u0069t ná yé kǒel áláŋ oóŋ dééŋ ba̠r\u0075ꞌŋ d\u0069ó.D\u0075ó bi d\u0075ó nisil-si kee áláŋ jee ba̠r\u0075ŋa kerŋa-lé na dééŋ ba̠r\u0075́, na áláŋ wá̱\u0069́ŋa tin \u0069t-lé ná yé kǒel.",
    "D\u0075ó bi d\u0075ó nisil-si kee áláŋ sa̱kk\u0069́á na tusus ammí na jee ba̠r\u0075 keer-lé abás j\u0069g\u0069́ŋá suŋŋá \u0069ŋ\u0069 ba̠r\u0075 ela–lé âl yé kee.In nisil-sí d\u0075ó \u0069t-sí á kanníaba asá jansa kí da̠l\u0069me \u0069t keéŋé nás kí tiríjinni ás t\u0069\u0069l\u0069ba walá \u0075́tóŋá k\u0069t á geba âl kí dá̱ld\u0069́ŋáꞌŋ ja̱ns\u0069ŋꞌíŋ daara ká̱ldá̱b\u0075 kawe.",
    "D\u0075ó bi d\u0075ó nisil-si kee ásáŋ tirgeꞌŋ gǎar kee nás táárí pii.D\u0075ó-sí tirgeꞌŋ gǎar as ka̱wríŋíalba, na dééŋ nisil-sí ba̠g\u0069 káwal, na baaj ati in kwǎ ásáŋ já̱\u0069́ŋó dééŋ tirge-sí.",
    "D\u0075ó bi d\u0075ó nisil-si kee ásáŋ ótáŋá dééŋ dítiníŋ kee wala gal nás kí kwa kerŋaꞌŋ sa̠r\u0069́ga (sa̱d\u0069́ga) gé.D\u0075ó bi d\u0075ó bára-sí kééŋ ótáŋá kí durú ásáŋ á r\u0069́éba.",
    "N\u0069w na dee ammíŋ j\u0075́seꞌŋ ka̠a̠g\u0075l nisil-si ka̠\u0069ŋ ásáŋ j\u0075́se káwal ná d\u0069́eŋ tóŋ dítinꞌíŋ k\u0075́\u0075l, na áláŋ d\u0069́eŋ órré káwa, ilâíŋ ere d\u0075ó togb\u0069́r tab\u0075́ŋ as keerba áláŋ-si úríŋí, ati tirgeꞌŋ \u0075ꞌŋ-ii wala tá̱á̱r\u0069́ꞌŋ ere, naŋ-si dog nisil arrá ka̠\u0069ŋ j\u0075́seꞌŋ jáa-lé namaŋ dééŋ jaaró-le.J\u0075́seꞌŋ gǎar-sí á keréŋéliba abá kí kwa a̠wd\u0075oŋ níŋ t\u0075s {j\u0069\u0069n} janí, na áláŋ ila t\u0075s janí kí dorá á-iiba.Toŋꞌíŋ jáa yé a̠r\u0069 \u0069t-ii ǎl t\u0069mor kíe t\u0075́m\u0069́ŋ na in lóŋ t\u0069mor ná ba̠r\u0075 ásáŋ toŋꞌíŋ jáa-sí kanyíŋíal nás ka̱á̱n\u0075l.",
    // "D\u0075ó bi d\u0075ó nisil-si kee ásáŋ ótáŋá dééŋ dítiníŋ kee wala gal nás kí kwa kerŋaꞌŋ sa̠r\u0069́ga (sa̱d\u0069́ga) gé.D\u0075ó bi d\u0075ó bára-sí kééŋ ótáŋá kí durú ásáŋ á r\u0069́éba.",
    "D\u0075ó bi d\u0075ó nisil baaj jarriꞌŋ na suurꞌíŋ urmaꞌŋ na tá̱á̱r\u0069́ꞌŋ-si kee, na in nisil dog gî baaj ínni ati d\u0075ó kǒel ásáŋ dééŋ tá̱á̱r\u0069́ já̱\u0069́ŋó, wala ásáŋ \u0069w\u0069́ kí g\u0075d na áláŋ kééŋ ta\u0069ma piá ati kí b\u0075̌t\u0075-ii wala kí \u0075r\u0075́ ati in lóŋá ná dítinꞌíŋ-ii wala kí kwa suŋŋâŋ-ii.",
    "D\u0075ó bi d\u0075ó nisil-si kee baaj jírsíŋoꞌŋ, na dééŋ jwǎꞌŋ, na in nisil dog gî \u0075ŋa k\u0069t-sí ínni ǎl kǒel áláŋ deb kǎ̱\u0069 d\u0075ó áláŋ ǎis úríŋíba (íríba), ilâíŋ ere na kin \u0075ŋaꞌŋ jǎ̱\u0069, na dééŋ jawar-sí ka̠t\u0069́ as kayeba.",
    "D\u0075ó bi d\u0075ó nisil na baaj-si kee áláŋ-si daaraŋa kwaꞌŋ j\u0069́s\u0069́ŋoŋaꞌŋ ǎl seeŋa gé nás dée-lé j\u0069́g\u0069́ŋ\u0069́e.D\u0075ó-sí á keba áláŋ k\u0069g\u0069́al ásáŋ daara díg-le j\u0069́g\u0069́ŋ\u0069́ kí durú.",
    "D\u0075ó bi d\u0075ó nisil-si kee áláŋ dééŋ ba̠r\u0075ꞌŋ ótáŋáꞌŋ táárí-le ká̱r\u0069́ ati yé kí dééŋ suur-ii wala kí d\u0075ó keerꞌíŋ dorá ǎl yé rééŋél kí baajꞌíŋ dorá.D\u0075ó bi d\u0075ó nisil-si kee áláŋ \u0075́tóŋá nyéttiŋ sa̠ga̠l\u0069ŋ t\u0069̌\u0069 dééŋ ba̠r\u0075́.K\u0075ld\u0069ŋaꞌŋ muráa yé-ii ǎl gî da̠l\u0069m\u0069ŋ ínni na in muráa-sí áláŋ-si kí j\u0075mb\u0075t\u0069ŋꞌíŋ dorá terere kélal, namá in lóŋ paraŋaꞌŋ jiŋí-le áláŋ kí b\u0075̌t\u0075-ii wala gal kí â̱y dorá keer ǎl j\u0075́nd\u0069 áláŋ paraŋaꞌŋ jiŋí kí baaj eeŋ.",
    "d\u0075ó bi d\u0075ó yé t\u0069mor-lé tógóló-ii t\u0069morꞌíŋ-si m\u0069rod kee ǎl kí ba̠r\u0075ꞌŋ k\u0075rroꞌŋ táas ja̠r\u0069́ \u0069́ndélíŋ na da̠ld\u0069ŋaꞌŋ kotte, ǎl j\u0075́nd\u0069 áláŋ ba̠r\u0075 bi bar\u0075 kééŋ kosomona na \u0069w\u0069l\u0069́ŋ nisila na b\u0075ll\u0069ŋ t\u0069morꞌíŋ na j\u0075rnyó ǎl nyéttiŋ ta̠g\u0069d\u0069ŋ-sí na suurꞌíŋ t\u0075́\u0069ꞌŋ j\u0075́nd\u0069 áláŋ kí baaj eeŋ. ",
    "D\u0075ó bi d\u0075ó tááríꞌŋ nisil-si kee na dog baaj-si kee áláŋ táárí \u0069t jááŋo ǎl yé kǒel áláŋ piá, kí moralꞌíŋ dorá naŋ-si dog nisil kee áláŋ ka̱a̱n\u0075l tááríꞌŋ wa̠r\u0069ŋ ere.na d\u0075ó á keba áláŋ-si kí bára kǎ̱wŋ\u0075l (ka̱wg\u0069́ŋíal) ǎ̠w ná soŋŋâ arrá kanníá. D\u0075ó bi d\u0075ó ná táárí pii áláŋ sôŋgoŋa \u0069t kaníal áláŋ ye-sí na dééŋ toŋꞌíŋ kwa-sí pa̱a̱g\u0075l ná ruugꞌíŋ kí ta̠g\u0069dꞌíŋ dorá, na ásáŋ t\u0069morꞌíŋ jaánoꞌŋ koraŋa kerŋa nyiíŋí dée-lé.D\u0075ó bi d\u0075ó nisil-si kee áláŋ tááríŋáꞌŋ j\u0069́s\u0069́ŋoꞌŋ daara piá wala ásáŋ \u0069t-lé j\u0069́g\u0069́ŋ\u0069́ ǎl yé dée-lé dééŋ suur túllên la̠w.",
    "D\u0075ó bi d\u0075ó nisil-si kee áláŋ \u0075mel jáwíti, tina hǒoŋa-lé, na ásáŋ d\u0069oŋa dǐi kaye tááríꞌŋ, na pa̱rr\u0069́ŋá ǎl terere \u0075́nd\u0075́lá áláŋ kí sôŋgoŋa gé.",
    "D\u0075ó bi d\u0075ó nisil-si kee áláŋ ruug \u0069t b\u0075́lóŋ ǎl j\u0075́nd\u0069 áláŋ dééŋ suur ká̱kk\u0069́ré-ii (da̠kk\u0075r\u0069ŋ) na írí joo–si kee dééŋ suurꞌíŋ na dééŋ toŋꞌíŋ kwaꞌŋ, in namá in lóŋ áláŋ-si míŋ anni-le tuuŋ na̠m\u0069́e-lé na j\u0075r\u0069ŋa na jôŋꞌíŋ lóó na \u0069p\u0069r\u0069ŋꞌíŋ já̠lp\u0075́ŋóla na d\u0069morꞌíŋ ótáŋá, na áláŋ-si ruug kee ati in lóŋ ná hǒo ǎ̠w ná táárí ás keba, wala hǒo jaŋꞌíŋ ere, wala inná t\u0075y\u0069ŋ wala gal nás a̠r\u0069 keer kee ná j\u0069́gé áláŋ táárí júndí.Ny\u0075rg\u0069ŋꞌíŋ na iyaŋaꞌŋ nisil-si ka̠\u0069ŋ ja̠lp\u0075ŋꞌíŋ na jányíŋi-lé na ásáŋ dogólá nyéttiŋ d\u0069moraꞌŋ jaáno ka̠\u0069ŋ arrá ati in lóŋ ná dééŋ da̱a̱r\u0069ŋ kí asâb kéŋá wala gal kí asâb á kéŋaba.",
    "D\u0075ó bi d\u0075ó nisil-si kee g\u0075d-lé, na in lóŋ áláŋ diílkuri (diílkuriŋaꞌŋ) na k\u0075réemeŋaꞌŋ g\u0075d áláŋ kee hǒo-ii na diílkuriŋaꞌŋ g\u0075d áláŋ kí j\u0069gé-ii, na g\u0075d in lóŋ áláŋ \u0075st\u0069ŋaꞌŋ na teŋgeŋaꞌŋ g\u0075d-ii na áláŋ g\u0075d íríkwǎꞌŋ-lé kwa-sí nyét arrá ka̠b\u0069́a kí k\u0069́eŋ k\u0075rroꞌŋ adde.Namá in lóŋ áláŋ kí dorá \u0069t ná kí d\u0075ld\u0069ꞌŋkwě'ŋ j\u0075t\u0075́mó-le péégél na d\u0075ld\u0069ꞌŋkwěŋ ba̠g\u0069 gîs nyiíŋíti na baaj dǔuŋa na áláŋ suurꞌíŋ j\u0069rmó na ja̱wr\u0069ŋꞌíŋ kwa nyéttiŋ táas-lé kee ati tá̱á̱r\u0069́ꞌŋ ere-ii wala inná dá̱ld\u0069́ŋáꞌŋ toŋkuriꞌŋ daaraꞌŋ ta̱b\u0075 áláŋ dóŋáꞌŋ janí ta̱g\u0069deŋ piá.Da̱a̱r\u0069ŋkwǎ (íya kí  bba) nisil-si ka̠\u0069ŋ áláŋ dorá \u0069t-sí kěyal k\u0069́eŋ dogóláꞌŋ j\u0075rnyóꞌŋ ǎl y\u0069eŋ taaras ka̠l\u0075e-ii.",
    "D\u0075ó bi d\u0075ó nisil-si kee áláŋ d\u0069moraꞌŋ b\u0075ll\u0069ŋ-lé ká̱r\u0069́ kí baajꞌíŋ dorá, na áláŋ-si jápírtígoŋa na m\u0075g\u0069ŋ-sís táárí piá áláŋ-si g\u0075dꞌíŋ írí joo-lé nyiíŋí ásáŋ kééŋ tulléŋa koomé.D\u0075ó bi d\u0075ó nisil-si kee áláŋ-si kééŋ tulléŋa-sí ka̱a̱g\u0075l ati b\u0075ll\u0069ŋ-ii wala jápírtíŋogaꞌŋ ere ása g\u0075d-sí nyiíŋítíá na asá yé arríti.",
    "D\u0075ó bi d\u0075ó tááríŋás kee dééŋ d\u0069morꞌíŋ ere áláŋ piá ǎl yé kǒel áláŋ dée-lé t\u0075́\u0069́ kí baaj.D\u0075ó asá kééŋ nisila na baaja-sís táárí pii ka̠t\u0069́ŋás kee nás dáálí jáwríti délliŋ. \u0069d\u0069̂\u0069́ŋ ná kǒel áláŋ d\u0075ó keerꞌíŋ baaj na nisila-lé a ká̱r\u0069́ba, \u0069d\u0069̂\u0069́ŋ na kǒel áláŋ kwa kerŋaꞌŋ baaja ba̠g\u0069 káa, áláŋ kwa nyéttiŋ ótáŋá-sís ba̠g\u0069 na arrás káa, na d\u0069mora d\u0069mogurátês ka̠\u0069ŋ.Ásáŋ á k\u0069\u0069́naba kí dorá bi dorá áláŋ-si kin nisila-sís táárí kí dorá \u0069t káal ǎl kí dá̱ld\u0069́ŋáꞌŋ toŋkuriꞌŋ daaraꞌŋ tááríŋá tarŋa sa̠rg\u0069 ba̠we.",
    "Ínné in janyal-lé rim togb\u0069́r á keba áláŋ ba̱r\u0075 júndí, wala kwa dǐiŋa wala d\u0075ó díg-sí áláŋ jee ná \u0075 \u0069t piá áláŋ kin nisila na baaja-sí j\u0069́o ǎl in janyal (sabar-lé) ka̠\u0069ŋ."
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
