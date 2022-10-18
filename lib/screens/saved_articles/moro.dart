// import 'package:hudoapp/screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:hudo/utils/audio_controller.dart';
import 'package:hudo/utils/check_direction.dart';
import 'package:hudo/utils/file_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedAdunaMoro extends StatefulWidget {
  @override
  _SavedAdunaMoroState createState() => _SavedAdunaMoroState();
}

class _SavedAdunaMoroState extends State<SavedAdunaMoro> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  FocusNode fieldNode = FocusNode();
  String currentUserId = "default user id";

  final titles = [
    "Aduna 1",
    "Aduna 2",
    "Aduna 3",
    "Aduna 4",
    "Aduna 5",
    "Aduna 6",
    "Aduna 7",
    "Aduna 8",
    "Aduna 9",
    "Aduna 10",
    "Aduna 11",
    "Aduna 12",
    "Aduna 13",
    "Aduna 14",
    "Aduna 15",
    "Aduna 16",
    "Aduna 17",
    "Aduna 18",
    "Aduna 19",
    "Aduna 20",
    "Aduna 21",
    "Aduna 22",
    "Aduna 23",
    "Aduna 24",
    "Aduna 25",
    "Aduna 26",
    "Aduna 27",
    "Aduna 28",
    "Aduna 29",
    "Aduna 30"
  ];

  List Adunas = [
    "Leđa pređ lal\u0065ŋ\u0065nia lëb\u0065rëinialo na l\u0065\u0072\u0065wa\u0074o eŋen ŋ\u0065đamia na eŋen pređ iŋi ŋ\u0065rcađa\u0074o \u0074a leđa al\u0065fiđi. Lënŋulu pređ lananëinu đ\u0065naca đame \u0072et\u0065\u0072eto na ara g\u0065ŋ\u0065ra ŋenŋan\u0074a al\u0065\u0072\u0065wađa\u0074e alam\u0065đaiđe b\u0065\u0072an usilaga g\u0065ŋ\u0065l\u0065ŋ\u0065nia na g\u0065ŋorba.",
    "Ŋen ŋaŋ\u0065ra \u0074a leđa pređ al\u0065fiđi ŋen pređ iŋi ŋ\u0065rcađa\u0074o \u0074a aŋ\u0065fe\u0074e eđ\u0065m\u0065\u0074ia eđen na đëb\u0065rëinialo eŋen iŋi ŋ\u0065wërđëinu e-Đ\u0065lwa\u0072a P\u0065lelo Đalo iđi eđa gero g\u0065n\u0065ŋ g\u0065đ\u0065rnëinu alo, ŋenŋa ŋëmcu, aŋ\u0065no, đ\u0065l\u0065ŋe, ole, ërđia, ŋen ŋ\u0065ŋamda ŋ\u0065\u0074ur, walla ŋen iŋi leđa lom\u0065n l\u0065sëcia, walla ŋen ŋalo irnuŋ walla ŋen ŋ\u0065ŋ\u0065\u0072o ŋ\u0065leđa, walla laŋge ildi eđa ger\u0074\u0065lo, đ\u0065l\u0065ŋ\u0065nia walla ŋen ŋ\u0065m\u0065n iŋi ŋakë\u0072\u0065nu, na \u0074a đakarn\u0065điano ađer\u0074e eleđa l\u0065rrwa walla l\u0065\u0072\u0065lda. Na eŋen ŋwaña ŋom\u0065n t\u0065ŋ, đ\u0065bapërđ\u0065niano ađer\u0074e đ\u0065fia eŋen ŋ\u0065ŋamda iŋi eđa g\u0065n\u0065ŋ gëŋ\u0065n\u0074u na ŋ\u0065l\u0065ŋe ŋalganun walla rađ irri Irnuŋ Go\u0072ra g\u0065l\u0065yerlda walla irnuŋ g\u0065rra geđa g\u0065n\u0065ŋ nd\u0065 gënŋu gak\u0065mia etam g\u0065lë\u0072\u0065ŋu walla g\u0065fo eđ\u0065ŋ đ\u0065ŋab\u0065\u0072a ŋom\u0065n.",
    "Leđa pređ ŋen ŋarcađa\u0074o \u0074a al\u0065fiđi eđ\u0065m\u0065\u0074ia eđen, đ\u0065m\u0065\u0074ia đ\u0065ŋ\u0065ra na đëb\u0065rëinialo na đëu\u0074aralo.",
    "Eđa gero g\u0065n\u0065ŋ giđi aŋiđ\u0065ni g\u0065\u0072o ebai walla aŋiđini ŋ\u0065baya. Ŋen ŋë\u0074\u0065muđu ŋ\u0065điđia leđa l\u0065\u0072o l\u0065bai na ŋ\u0065đirldiđëiđia leđa rađra pređ r\u0065lë\u0072\u0065ŋu.",
    "Eđa gero g\u0065n\u0065ŋ giđi aŋiđini ŋađ\u0065na aŋ\u0065nëini ŋen ŋibwa egaŋ\u0065no walla aŋ\u0065mwëđinialo walla aŋiđini ŋen ŋero ŋ\u0065barna ŋ\u0065leđa, walla aŋiđ\u0065n\u0074i ŋen ŋ\u0065kera đamia đ\u0065lë\u0072\u0065ŋu walla aŋëbini eŋen ëpwaya.",
    "Leđa pređ ŋen ŋaŋ\u0065ra \u0074a aliđ\u0065n\u0074i ŋen ŋ\u0065rcađa\u0074o \u0074a aŋiđ\u0065n\u0074i eđa g\u0065n\u0065ŋ nd\u0065 gënŋu g\u0065fo alganun nëñua.",
    "Leđa pređ la\u0072\u0065wa\u0074o eŋen alganun nëñua na lënŋulu pređ ŋen ŋarcađa\u0074o \u0074a al\u0065fiđi ŋen ŋero ŋ\u0065m\u0065lađia eđak\u0065m\u0065đia. Na lënŋulu com ŋen ŋaŋ\u0065ra \u0074a al\u0065fiđi đ\u0065b\u0065\u0072\u0065c\u0065niano đ\u0065\u0072\u0065wa\u0074o alganun nëñua đ\u0065pëiđia leđano đero, ŋen iŋi ŋ\u0065kera ŋen ŋ\u0065 Đ\u0065lwa\u0072o P\u0065lelo Đalo iđi na ŋakia ŋen ŋ\u0065đ\u0065bwaiđia eŋen ŋ\u0065đakarn\u0065điano.",
    "Leđa pređ ŋen ŋarcađa\u0074o \u0074a al\u0065fiđi đak\u0065mia đ\u0065ŋ\u0065ra en\u0065l\u0065ŋ nak\u0065m\u0065đia nirnuŋ igi ld\u0065fau, nd\u0065 eđa g\u0065n\u0065ŋ giđ\u0065n\u0074u ŋen ŋ\u0065b\u0065\u0072aŋ\u0065no eŋen iŋi ŋ\u0065\u0072o ađuna eŋen ŋ\u0065rcađa\u0074o \u0074a aŋ\u0065fidi eŋen iŋi ŋ\u0065fo i\u0074as\u0074ur walla igalganun.",
    "Ŋen ŋero ŋaŋ\u0065ra \u0074a eđa g\u0065n\u0065ŋ aŋënd\u0065ni m\u0065\u0072\u0065m\u0065\u0072\u0065ñ walla aŋ\u0065đurwini liga lob\u0065lano walla lwalano đak\u0065mia đero, walla aŋ\u0065miñ\u0065ni walla aŋ\u0065lëld\u0065ñ\u0065ni irnuŋ g\u0065lë\u0072\u0065ŋu aŋ\u0065đwëini nwaldaŋ ŋab\u0065\u0072aŋa.",
    "Leđa pređ ler\u0074o ŋen ŋ\u0065\u0072\u0065wa\u0074o \u0074a đ\u0065skinia eđen ađ\u0065nwënëini n\u0065l\u0065ŋ nëñua nak\u0065m\u0065đia nalmak\u0065ma yero yeb\u0065r\u0074a ŋ\u0065l\u0065ŋe ŋom\u0065n ŋ\u0065đuru ilë\u0072ua na yiđurwa\u0074u yet\u0065\u0072e, ŋenŋan\u0074a n\u0065l\u0065ŋ nak\u0065m\u0065đia an\u0065lak\u0065m\u0065đ\u0065\u0074i ŋenŋa ŋ\u0065đurwa\u0074u iŋi ŋ\u0065rcađa\u0074o \u0074a al\u0065fiđi eŋen pređ iŋi lënŋulu l\u0065skiniau.",
    "1.Eđa g\u0065n\u0065ŋ gënd\u0065nu walla g\u0065s\u0065kinu ŋenŋa ŋ\u0065n\u0065ŋ, gënŋu gumađëinia \u0074a gero m\u0065nna m\u0065ldin na ŋen iŋi g\u0065skiniya aŋ\u0065masa\u0074e almak\u0065ma nëñua isi ye\u0072\u0065wađa\u0074o \u0074a ay\u0065manace liga \u0074a aŋop\u0065\u0074e etam g\u0065lë\u0072\u0065ŋu.\n2.Eđa gero g\u0065n\u0065ŋ giđi aŋak\u0065m\u0065ni ŋenŋan\u0074a gënŋu gatođo walla gero g\u0065tođa ŋ\u0065më\u0072riaŋa ŋ\u0065n\u0065ŋ illi nd\u0065 ŋ\u0065më\u0072ria ŋak\u0065l ŋumađëinu \u0074a ŋa\u0072o đ\u0065kera ŋen ŋalganun yeleđa lirnuŋ iliga đurri ildi eđa giđi\u0074au walla gero g\u0065b\u0065đia ŋen ŋak\u0065l. Na eđa aŋer\u0074e gak\u0065m\u0065nia ŋenŋa ŋ\u0065m\u0065ñ\u0065đialo eŋen iŋi ŋ\u0065rcađa\u0074o \u0074a aŋ\u0065yak\u0065m\u0065ni iliga ildi g\u0065fo giđi\u0074au m\u0065nna gak\u0065l.",
    "Ŋen ŋero ŋ\u0065ŋ\u0065ra \u0074a eđa g\u0065n\u0065ŋ aŋën\u0074i eŋen eđa gom\u0065n m\u0065\u0072\u0065m\u0065\u0072\u0065ñ walla aŋën\u0074i eŋen ŋe\u0072a g\u0065lë\u0072\u0065ŋu walla ekal isi g\u0065fau, walla aŋën\u0074i eŋen leđa l\u0065yarr\u0065ŋ\u0065n\u0065đia, na eđa g\u0065n\u0065ŋ aŋer\u0074e g\u0065đama đamia đeđa gom\u0065n na đ\u0065ŋ\u0065ra đ\u0065lë\u0072\u0065ŋu. Leđa pređ ler\u0074o ŋen đe\u0074\u0065m \u0074a alganun ay\u0065\u0072r\u0065mo\u0074we eŋen iŋi ŋ\u0065đërr\u0065n\u0074ia eŋen ŋeđa g\u0065n\u0065ŋ walla đ\u0065đama eđa.",
    "1.Leđa pređ ŋen ŋaŋen đe\u0074\u0065m \u0074a alakaldace alo irnuŋ \u0072et\u0065\u0072eto lëb\u0065rëinialo, na ŋen aŋer\u0074e ŋ\u0065n\u0065ŋ ŋ\u0065tri\u0074ia eđa \u0074a aŋ\u0065fe\u0074e irnuŋ igi gona\u0074o alo er\u0065\u0072iaŋ rirnuŋ g\u0065lë\u0072\u0065ŋu.\n2.Leđa pređ ŋen ŋaŋen đe\u0074\u0065m al\u0065mam\u0065ñe na alerlde\u0074e irnuŋ ndëwur egen, na aloko\u0072\u0065ba\u0074a irnuŋ egen ŋen ŋero ŋ\u0065n\u0065ŋ ŋ\u0065l\u0065đ\u0065rna.",
    "1.Leđa pređ ŋen ŋaŋen na ŋarcađa\u0074o \u0074a nd\u0065 l\u0065nanënia ŋen ŋibwa ŋ\u0065b\u0065\u0072aŋ\u0065no irnuŋ egen al\u0065gakonde ŋen \u0074a aldald\u0065ñ\u0065\u0074e irnuŋ g\u0065rto ŋenŋan\u0074a al\u0065wëb\u0065rđëini na alufiđi đ\u0065miñ\u0065niano.\n2.Ŋen iŋi ŋ\u0065rcađa\u0074o \u0074a aŋiđ\u0065n\u0074i leđa, ŋaber ŋam\u0065đa\u0074a eđa g\u0065n\u0065ŋ nd\u0065 g\u0065mamëinu nalmak\u0065ma ŋenŋa ŋ\u0065rto ŋer\u0074a ŋaŋamda walla nd\u0065 gënŋu g\u0065tođo ŋ\u0065më\u0072riaŋa ŋ\u0065n\u0065ŋ ŋ\u0065m\u0065lađo eŋen ŋalganun ye Leđa ildi L\u0065rrëiđu ŋen na eŋen iŋi ldëkë\u0072u.",
    "1.Leđa pređ ŋen ŋaŋen đe\u0074\u0065m \u0074a eđa g\u0065n\u0065ŋ aŋer\u0074e jinsiya.\n2.Ŋen ŋafo m\u0065nna \u0074a eđa g\u0065n\u0065ŋ aŋ\u0065mu\u0072ëini jinsiya ŋab\u0065\u0072aŋa walla aŋer\u0074e g\u0065bëŋ\u0065n\u0065\u0074ia nd\u0065 gënŋu gona\u0074a g\u0065m\u0065lëđia jinsiya alo yilë\u0072\u0065ŋu.",
    "1.Orra na obwa nđ\u0065 lënŋulu l\u0065rma\u0074o iliga l\u0065ŋ\u0065ra l\u0065\u0072\u0065wađa\u0074o \u0074a al\u0065m\u0065đe alwa\u0064e e\u0072a egen, ŋen ŋaŋ\u0065ra \u0074a lënŋulu al\u0065m\u0065đe na ŋen aŋer\u0074e ŋ\u0065n\u0065ŋ ŋ\u0065l\u0065tri\u0074ia, ŋen ŋarno ŋen ŋ\u0065đ\u0065l\u0065ŋe na ŋëmcu, walla ŋen ŋërđia g\u0065 R\u0065mwa. Lënŋulu nd\u0065m ler\u0074o ŋen ŋ\u0065\u0072\u0065wa\u0074o \u0074a al\u0065m\u0065đe b\u0065\u0072an, leđa aler\u0074e l\u0065bën\u0074ia eŋen eŋen iliga ld\u0065m\u0065đia walla iliga ld\u0065neđia.\n2.Ŋen ŋaŋ\u0065ra \u0074a đ\u0065ma ađëŋ\u0065n\u0065\u0074i na ađiđ\u0065ni caŋ caŋ nd\u0065 leđa ildi l\u0065m\u0065đia lëŋ\u0065n\u0065c\u0065đu ŋamda ŋero na lero l\u0065đ\u0065rnađëiđ\u0065nia eŋen.\n3.E\u0072a ga\u0072o ađuna yiwëđ\u0065nu alo eleđa lirnuŋ yeleđa l\u0065\u0072\u0065jan l\u0065rrëiđu ŋen, na ŋen ŋarcađa\u0074o \u0074a lënŋulu al\u0065b\u0065\u0072\u0065c\u0065niano na a\u0072r\u0065muj\u0065ni eleđa l\u0065\u0072ëwur na Irnuŋ Go\u0072ra.",
    "1.Leđa pređ ŋen ŋaŋ\u0065ra \u0074a eđa g\u0065n\u0065ŋ naŋiđi đwala walla aŋer\u0074e laŋge, g\u0065fo al\u0065soŋ gonto walla l\u0065rrëiđu ŋen leđala lom\u0065n.\n2.Ŋen ŋero ŋ\u0065ŋ\u0065ra đe\u0074\u0065m \u0074a eđa g\u0065n\u0065ŋ aŋ\u0065mamëini đwala đ\u0065lë\u0072\u0065ŋu walla laŋge \u0065llë\u0072\u0065ŋu ildi ger\u0074\u0065lo m\u0065\u0072\u0065m\u0065\u0072\u0065ñ.",
    "Leđa pređ ŋen ŋaŋen đe\u0074\u0065m \u0074a eđa g\u0065n\u0065ŋ aŋ\u0065fe\u0074e gëb\u0065rëinialo eŋen ŋ\u0065ŋ\u0065\u0074\u0065\u0072a ŋ\u0065lë\u0072\u0065ŋu, na ŋen ŋara g\u0065m\u0065\u0074o g\u0065lë\u0072\u0065ŋu, na đëndia ŋen ŋërđia g\u0065 R\u0065mwa đ\u0065lë\u0072\u0065ŋu; na ŋen ŋ\u0065lë\u0072\u0065ŋu iŋi ŋan\u0074a \u0074a, eđa g\u0065n\u0065ŋ aŋ\u0065\u0072\u0065wađa\u0074e aŋ\u0065m\u0065lëđi ŋen alo ŋërđia g\u0065lë\u0072\u0065ŋu walla ŋen iŋi gëndu ŋ\u0065 R\u0065mwa nd\u0065 gona\u0074a, na ŋen aŋer\u0074e ŋ\u0065n\u0065ŋ ŋ\u0065mađ\u0065rna \u0074a ga\u0072wata ŋenŋa ŋ\u0065lë\u0072\u0065ŋu ŋ\u0065 R\u0065mwa đarr\u0065ŋëiđiađa walla điđiaya ŋ\u0065me\u0072ria, na đëbuŋ\u0065\u0074iađa R\u0065mwa g\u0065fo al\u0065soŋ walla l\u0065fo ld\u0065\u0072o leđala lwaña, eđa aŋer\u0074e g\u0065n\u0065ŋ g\u0065bën\u0074ia eŋen ŋ\u0065lë\u0072\u0065ŋu.",
    "Leđa pređ ŋen ŋaŋen đe\u0074\u0065m \u0074a eđa g\u0065n\u0065ŋ aŋëb\u0065rëini alo \u0074a aŋaŋëiđi ŋen iŋi g\u0065sadëinia eŋ\u0065\u0074\u0065\u0072a ŋ\u0065lë\u0072\u0065ŋu na aŋ\u0065ye\u0072wate; na ŋen iŋi ŋan\u0074a eđa aŋëndëci na aŋ\u0065rmo\u0074we ŋen ŋ\u0065ŋ\u0065\u0074\u0065\u0072a ŋ\u0065lë\u0072\u0065ŋu eđa aŋer\u0074e g\u0065n\u0065ŋ g\u0065mađ\u0065rna walla g\u0065bën\u0074ia eŋen ŋ\u0065lë\u0072\u0065ŋu, na ŋen ŋalë\u0072\u0065ŋu \u0074a aŋgakonde na aŋ\u0065lald\u0065ŋe\u0074e ŋen ŋ\u0065ŋ\u0065\u0074\u0065\u0072a ŋ\u0065leđa lom\u0065n na ŋen ŋ\u0065\u0072wëtëinia imi\u0064ia \u0072et\u0065\u0072eto na \u0074a aŋ\u0065ye\u0072wata\u0074e ekal pređ r\u0065\u0072iaŋ ralo rero r\u0065mëtri\u0074ia.",
    "1.Ŋen ŋeđa g\u0065n\u0065ŋ đe\u0074\u0065m \u0074a aŋe\u0072\u0065b\u0065đe gero g\u0065trin\u0074ia eŋen ŋ\u0065đ\u0065rarraiđia n\u0065ŋ\u0065\u0072o đ\u0065leđa đ\u0065fo đëu\u0074aral\u0065đa, na ŋen iŋi ŋ\u0065gakasaiđia leđa.\n2.Eđa gero g\u0065n\u0065ŋ giđi aŋ\u0065đ\u0065rnëini eŋen \u0074a aŋën\u0074i e\u0072o l\u0065n\u0065ŋ eŋ\u0065\u0072o ŋ\u0065leđa ŋab\u0065\u0072aŋa.",
    "1.Leđa pređ ŋen ŋaŋen đe\u0074\u0065m \u0074a ale\u0072\u0065b\u0065đe eŋ\u0065l\u0065ŋe ŋak\u0065mia irnuŋ egen, garno gënŋu đurri walla leđala ildi lu\u0074\u0065nu ŋenŋa ŋëŋ\u0065n\u0065\u0074u.\n2.Leđa pređ ler\u0074o ŋen ŋ\u0065\u0072\u0065wa\u0074o đe\u0074\u0065m \u0074a alërr\u0065n\u0074i iŋ\u0065më\u0072ria iŋi ŋ\u0065leđa pređ irnuŋ egen.\n3.Ŋen iŋi leđa lona\u0074a đe\u0074\u0065m ŋen ŋarcađa\u0074o \u0074a aŋ\u0065\u0072e\u0074e iđuna yeŋ\u0065l\u0065ŋe ŋ\u0065đak\u0065mia, na đona\u0074a iđi ŋen ŋaŋ\u0065ra \u0074a ađ\u0065fe\u0074e ŋenŋa ŋ\u0065đo\u0074a leđa iŋiga ŋ\u0065l\u0065ŋinu na ŋ\u0065rcađa\u0074o, na ŋ\u0065naco leđa pređ liga l\u0065\u0072\u0065wa\u0074o ŋenŋan\u0074a alo\u0074e leđa ildi l\u0065lona\u0074a đe\u0074\u0065mđa ŋamda ŋero. Na nab\u0065ređa n\u0065đo\u0074a leđa an\u0065fe\u0074e ŋenŋa ŋ\u0065wëc\u0065nu ŋenŋan\u0074a đo\u0074a leđa ađ\u0065fe\u0074e ŋenŋa ŋ\u0065đurwa\u0074u.",
    "Eđa g\u0065n\u0065ŋ g\u0065fo eleđa l\u0065\u0072ëwur, ŋen ŋalë\u0072\u0065ŋu đe\u0074\u0065m \u0074a aŋer\u0074e ŋen ŋ\u0065marmo\u0074wa igëwur yilë\u0072\u0065ŋu na aŋ\u0065l\u0065ŋini \u0074a ŋen aŋ\u0065miđ\u0065n\u0074i ŋ\u0065më\u0072riaŋa ŋ\u0065leđa lirnuŋ đam\u0065điađiađa đ-Irnuŋ Go\u0072ra l\u0065bate nano na ŋen aŋ\u0065fe\u0074e ŋenŋa ŋarno Irnuŋ Go\u0072ra gakë\u0072ëcu đwalađa đ\u0065lë\u0072\u0065ŋu garno rađ irri r\u0065bëncia đwala eŋen ŋ\u0065đwala na đ\u0065fia eŋ\u0065\u0072o ŋ\u0065leđa ŋërriaŋa eŋen iŋi ŋ\u0065ŋ\u0065ra ŋam\u0065đa\u0074a đamia đ\u0065lë\u0072\u0065ŋu na đëb\u0065rëinialo đ\u0065miñiađëcia ŋen nëñua ŋegaŋ\u0065no yilë\u0072\u0065ŋu.",
    "1.Leđa pređ ŋen ŋarcađa\u0074o \u0074a aliđi ŋ\u0065më\u0072ria, na \u0074a eđa g\u0065n\u0065ŋ aŋo\u0074e ŋ\u0065më\u0072ria iŋi gona\u0074o na ŋ\u0065rcađa\u0074\u0065ma nano ŋenŋa ŋ\u0065đurwa\u0074u na ŋëŋ\u0065n\u0065\u0074u. Na com ŋen ŋalë\u0072\u0065ŋu đe\u0074\u0065m \u0074a aŋ\u0065b\u0065\u0072\u0065c\u0065niano iliga gero g\u0065fiđia ŋ\u0065më\u0072ria.\n2.Leđa pređ ŋen ŋarcađa\u0074o \u0074a al\u0065p\u0065\u0072\u0065ni iŋ\u0065më\u0072ria eŋen đwalađa đ\u0065\u0072\u0065wa\u0074o đ\u0065pëiđiano đero eŋen.\n3.Leđa pređ ildi l\u0065b\u0065đia ŋ\u0065më\u0072ria, ŋen ŋaŋ\u0065ra \u0074a al\u0065nëini đ\u0065p\u0065\u0072a đ\u0065ŋ\u0065ra đ\u0065rcađa\u0074o ŋ\u0065më\u0072ria nano eŋen \u0074a ađ\u0065\u0072\u0065wađace eđa na leđa le\u0072a g\u0065lë\u0072\u0065ŋu ŋenŋan\u0074a al\u0065\u0072\u0065wađa\u0074e l\u0065m\u0065\u0074ia đ\u0065m\u0065\u0074ia đame đ\u0065rcađa\u0074o, na com \u0074a aŋë\u0072\u0065jin\u0074i egorb, nd\u0065 ŋen ŋ\u0065fo ŋ\u0065ma\u0074an ŋunëinia, ŋenŋan\u0074a eđa aŋ\u0065fe\u0074e iđ\u0065rmo\u0074wa eleđa l\u0065\u0072ëwur. 4.Leđa pređ ŋen ŋaŋ\u0065ra na ŋarcađa\u0074o \u0074a al\u0065tuđi ŋ\u0065\u0072o ŋ\u0065ŋ\u0065më\u0072ria pređ eŋen ŋenŋan\u0074a ŋ\u0065\u0072o ŋen iŋi aŋ\u0065rmo\u0074we ŋen eŋen ŋ\u0065ŋ\u0065më\u0072ria.",
    "Leđa pređ ŋen ŋarcađa\u0074o \u0074a aler\u0074e liga l\u0065đ\u0065miñ\u0065niano, na ŋiga ŋ\u0065piano ŋero ŋ\u0065më\u0072riano. Na \u0074a eđa aŋënd\u0065n\u0074i liga na sa ye\u0072\u0065wađa\u0074o ŋ\u0065më\u0072ria nano na eđa aŋer\u0074e ñoman ñ\u0065đ\u0065miñ\u0065niano ñ\u0065l\u0065ŋinu na ñup\u0065\u0072\u0065đ\u0065nia.",
    "1.Leđa pređ ŋen ŋarcađa\u0074o \u0074a al\u0065fiđi ŋen ŋ\u0065đ\u0065m\u0065\u0074ia đ\u0065ŋ\u0065ra đ\u0065\u0072\u0065wađaco eđa g\u0065n\u0065ŋ \u0074a gënŋu na leđa le\u0072a g\u0065lë\u0072\u0065ŋu al\u0065fiđi đ\u0065ŋ\u0065ra egaŋ\u0065no na al\u0065fe\u0074e eđ\u0065ŋ\u0065ranano na aler\u0074e ŋ\u0065sa, ndrenia, e\u0072a, na al\u0065fiđi ñakim na đ\u0065b\u0065\u0072\u0065c\u0065niano ŋ\u0065më\u0072riaŋa pređ iŋi ŋam\u0065đa\u0074a ëwur. Na nd\u0065 eđa g\u0065n\u0065ŋ gero g\u0065\u0072\u0065wađa\u0074ia walla nd\u0065 gëy\u0065niau walla go\u0072ra in\u0074\u0065lia walla nd\u0065 gero ŋen ŋ\u0065mam\u0065đa\u0074a eđ\u0065m\u0065\u0074ia đ\u0065lë\u0072\u0065ŋu, ŋen ŋaŋ\u0065ra \u0074a eđa gak\u0065l aŋ\u0065b\u0065\u0072\u0065c\u0065niano aŋ\u0065rmuj\u0065ni.\n2.Ŋen ŋaŋ\u0065ra đe\u0074\u0065m \u0074a ñ\u0065ŋgenia na ñere ñ\u0065l\u0065ŋ\u0065nu maj\u0065n al\u0065fiđi\u0074i đ\u0065b\u0065\u0072\u0065c\u0065niano đ\u0065ŋ\u0065ra. Na ñere pređ ñ\u0065l\u0065ŋ\u0065nu ŋenŋa ŋ\u0065đurwa\u0074u walla ñ\u0065l\u0065ŋ\u0065nu alo, ŋen ŋarcađa\u0074ota añ\u0065fidi đ\u0065b\u0065\u0072\u0065c\u0065niano đ\u0065ŋ\u0065ra na đam\u0065đa\u0074a ŋenŋa ŋ\u0065\u0072\u0065wa\u0074o.",
    "1.Ŋen ŋaŋ\u0065ra đe\u0074\u0065m \u0074a eđa g\u0065n\u0065ŋ aŋ\u0065fidi đëgria. Đëgria iđi đ\u0065twalalo đananoŋ ŋen ŋarcađa\u0074o \u0074a đëgria ađer\u0074e đup\u0065\u0072\u0065đ\u0065nia. Na đëgria đananoŋ iđi ađ\u0065fe\u0074e ŋ\u0065maŋa eñere pređ. Na đëgria iđi đ\u0065\u0074iknoloji na đ\u0065ŋo\u0072ofa ŋ\u0065ŋ\u0065më\u0072ria \u0072et\u0065\u0072eto ađ\u0065fe\u0074e đwaña alo. Na đëgria iđi đo\u0072ra đ\u0065jama ađ\u0065fe\u0074e ŋenŋa ŋ\u0065\u0072\u0065wa\u0074o ŋen ŋarno ŋ\u0065lwa iŋi ñere ñ\u0065bëgria ñarr\u0065po.\n2.Ŋen ŋaŋ\u0065ra \u0074a đëgria ađ\u0065\u0074u\u0072ëini ŋenŋa ŋ\u0065đam\u0065đa\u0074a đ\u0065borkwađa\u0074a nëñua đ\u0065leđa entam enen na \u0074a ađon\u0064\u0065ce ŋen ŋ\u0065đ\u0065rmo\u0074wa ŋen ŋ\u0065ŋ\u0065ra \u0074a aŋiđ\u0065n\u0074i leđa ŋenŋa ŋ\u0065đëb\u0065rëinialo eđen. Na ŋen ŋalë\u0072\u0065ŋu com \u0074a ađ\u0065ma đ\u0065l\u0065ŋe\u0074a, na đ\u0065\u0072\u0065ña\u0074a ŋen na ŋ\u0065l\u0065ŋ\u0065nia eleđa lalo pređ, garno đ\u0065l\u0065ŋe \u0072et\u0065\u0072eto walla ŋ\u0065\u0072o ŋërđia g\u0065 R\u0065mwa, \u0074a ŋ\u0065më\u0072ria ŋ\u0065 Leđa ildi L\u0065rrëiđu ŋen aŋ\u0065\u0072alađa\u0074e nëñua eŋen ŋ\u0065rmo\u0074wa đëu\u0074aralo.\n3.Apaŋ\u0065nda l\u0065l\u0065ŋo ñere ŋen ŋaŋ\u0065ra đe\u0074\u0065m \u0074a alo\u0074e ŋen ŋ\u0065đ\u0065m\u0065ca ñere eñen nađëgria iđi lënŋulu lona\u0074a \u0074a ñere añëgri.",
    "1.Leđa pređ ŋen ŋaŋ\u0065ra đe\u0074\u0065m \u0074a eđa g\u0065n\u0065ŋ naŋe\u0072\u0065b\u0065đe eŋen ŋ\u0065ŋërria ŋ\u0065leđa l\u0065\u0072ëwur , \u0074a aŋ\u0065re\u0074e nano ŋo\u0072ofaŋa pređ na aŋe\u0072\u0065b\u0065đe eŋen ŋ\u0065đ\u0065borkwađa\u0074a nëñua eŋen ŋ\u0065đ\u0065l\u0065ŋe\u0074a \u0072et\u0065\u0072eto na eŋ\u0065lwa ŋ\u0065lë\u0072\u0065ŋu.\n2.Leđa pređ ŋen ŋaŋ\u0065ra đe\u0074\u0065m \u0074a eđa g\u0065n\u0065ŋ aŋ\u0065rmuđ\u0065n\u0074i ŋen ŋara g\u0065lë\u0072\u0065ŋu na ŋaŋ\u0065no yilë\u0072\u0065ŋo na ŋen iŋi aŋgace \u0074a aŋela eŋ\u0065lwa ŋak\u0065l iŋi eđa g\u0065miñu eŋen ŋ\u0065đ\u0065l\u0065ŋe\u0074a, ŋ\u0065đëgria walla ŋ\u0065ŋo\u0072ofa.",
    "Ŋen ŋaŋ\u0065ra \u0074a leđa pređ al\u0065fiđi ŋen iŋi ŋ\u0065\u0074o\u0072a\u0074a ëwur yeleđa lirnuŋ na l\u0065bate nano ŋenŋan\u0074a eđa g\u0065n\u0065ŋ aŋ\u0065\u0072\u0065wađa\u0074e g\u0065fiđia ŋen pređ iŋi ŋ\u0065ŋ\u0065ra \u0074a leđa aler\u0074e na ŋen ŋ\u0065đëb\u0065rëinial pređ iŋi ŋ\u0065wërđëinu eŋen ŋ\u0065 Đ\u0065lwa\u0072a P\u0065lelo Đalo iđi aŋ\u0065\u0072iñađëini ŋopia.",
    "1.Leđa pređ ler\u0074o ŋ\u0065më\u0072ria igëwur esen iŋi ŋ\u0065ŋgi\u0074ia eđa g\u0065n\u0065ŋ go\u0072\u0065wađa\u0074ia gufiđia liga l\u0065ŋ\u0065ra \u0074a aŋ\u0065burkwëđëci etam nëñua g\u0065lë\u0072\u0065ŋu ŋen ŋero ŋ\u0065n\u0065ŋ ŋ\u0065đ\u0065rnaiđ\u0065ma.\n2.Iliga eđa g\u0065n\u0065ŋ g\u0065tođa ŋ\u0065më\u0072riaŋa ŋ\u0065lë\u0072\u0065ŋu ŋenŋa iŋi ŋ\u0065rcađa\u0074o \u0074a aŋer\u0074e eŋen ŋ\u0065đëb\u0065rëinialo đ\u0065lë\u0072\u0065ŋu, ŋen ŋaŋ\u0065ra \u0074a leđa pređ al\u0065kasëiđ\u0065ni ŋenŋa iŋi ŋ\u0065fo igalganun ik\u0065r\u0065ŋ, ŋenŋan\u0074a ŋen aŋëŋ\u0065n\u0065\u0074i na aŋ\u0065rmuj\u0065ni iŋi ŋ\u0065ŋ\u0065ra \u0074a leđa aler\u0074e lom\u0065n, na đëb\u0065rëinialo eđen, \u0074a ŋen aŋ\u0065\u0072\u0065ñađaiđe iŋi ŋ\u0065mama ŋen ŋ\u0065đurwa\u0074u eŋen iŋi ŋ\u0065\u0074o\u0072a\u0074a leđa pređ na eŋen iŋi leđa pređ lona\u0074a \u0074a aŋ\u0065fe\u0074e igëwur yeleđa ye\u0072o \u0064imugra\u0074i.\n3.Ŋen ŋero ŋ\u0065fia ŋopia \u0074a ŋen iŋi ŋ\u0065ŋ\u0065ra \u0074a leđa aler\u0074e na đëb\u0065rëinialo eđen al\u0065fe\u0074e ŋenŋa ŋ\u0065m\u0065lađo eŋen iŋi Leđa ildi L\u0065rrëiđu ŋen lëkë\u0072u ŋ\u0065\u0072o iđuna.",
    "Ŋen pređ iŋi ŋ\u0065wërđëinu e-Đ\u0065lwa\u0072a P\u0065lelo Đalo iđi aŋer\u0074e ŋiđi aŋ\u0065m\u0065lëđini alo \u0074a aŋiđi ŋen ŋam\u0065đa\u0074a Irnuŋ Go\u0072ra g\u0065n\u0065ŋ, eđa g\u0065n\u0065ŋ walla leđa eŋ\u0065\u0072o aler\u0074e l\u0065b\u0065r\u0074a ŋ\u0065l\u0065ŋe \u0074a al\u0065tođe ŋenŋa ŋ\u0065n\u0065ŋ walla ŋ\u0065më\u0072riaŋa ŋ\u0065n\u0065ŋ ŋenŋan\u0074a al\u0065kere ŋen ŋ\u0065n\u0065ŋ iŋi ŋ\u0065wërđëinu e- Đ\u0065lwa\u0072a P\u0065lelo Đalo iđi eŋen iŋi ŋ\u0065rcađa\u0074o \u0074a leđa aler\u0074e na đëb\u0065rëinialo eđen.",
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

  unSaveAduna() async {
  }

  bool isPlayerOpened = false;
  int indexNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Iduna'),
      ),
      body: ListView.builder(
          itemCount: Adunas.length,
          itemBuilder: (context, index) {
            return  GestureDetector(
              onTap: () {
                this.indexNo = index;
              },
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ExpansionTile(
                      title: Text(
                        titles[index],
                        style: TextStyle(color: Colors.black),
                      ),
                      children: [
                        ListTile(
                          subtitle: Text(
                            Adunas[index],
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
                      ]),
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
      lang: 'moro',
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
