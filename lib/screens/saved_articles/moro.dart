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
    "Leđa pređ lal\u0259ŋ\u0259nia lëb\u0259rëinialo na l\u0259\u027D\u0259wa\u1E6Fo eŋen ŋ\u0259đamia na eŋen pređ iŋi ŋ\u0259rcađa\u1E6Fo \u1E6Fa leđa al\u0259fiđi. Lënŋulu pređ lananëinu đ\u0259naca đame \u027Det\u0259\u027Deto na ara g\u0259ŋ\u0259ra ŋenŋan\u1E6Fa al\u0259\u027D\u0259wađa\u1E6Fe alam\u0259đaiđe b\u0259\u027Dan usilaga g\u0259ŋ\u0259l\u0259ŋ\u0259nia na g\u0259ŋorba.",
    "Ŋen ŋaŋ\u0259ra \u1E6Fa leđa pređ al\u0259fiđi ŋen pređ iŋi ŋ\u0259rcađa\u1E6Fo \u1E6Fa aŋ\u0259fe\u1E6Fe eđ\u0259m\u0259\u1E6Fia eđen na đëb\u0259rëinialo eŋen iŋi ŋ\u0259wërđëinu e-Đ\u0259lwa\u027Da P\u0259lelo Đalo iđi eđa gero g\u0259n\u0259ŋ g\u0259đ\u0259rnëinu alo, ŋenŋa ŋëmcu, aŋ\u0259no, đ\u0259l\u0259ŋe, ole, ërđia, ŋen ŋ\u0259ŋamda ŋ\u0259\u1E6Fur, walla ŋen iŋi leđa lom\u0259n l\u0259sëcia, walla ŋen ŋalo irnuŋ walla ŋen ŋ\u0259ŋ\u0259\u027Do ŋ\u0259leđa, walla laŋge ildi eđa ger\u1E6F\u0259lo, đ\u0259l\u0259ŋ\u0259nia walla ŋen ŋ\u0259m\u0259n iŋi ŋakë\u027D\u0259nu, na \u1E6Fa đakarn\u0259điano ađer\u1E6Fe eleđa l\u0259rrwa walla l\u0259\u027D\u0259lda. Na eŋen ŋwaña ŋom\u0259n t\u0259ŋ, đ\u0259bapërđ\u0259niano ađer\u1E6Fe đ\u0259fia eŋen ŋ\u0259ŋamda iŋi eđa g\u0259n\u0259ŋ gëŋ\u0259n\u1E6Fu na ŋ\u0259l\u0259ŋe ŋalganun walla rađ irri Irnuŋ Go\u027Dra g\u0259l\u0259yerlda walla irnuŋ g\u0259rra geđa g\u0259n\u0259ŋ nd\u0259 gënŋu gak\u0259mia etam g\u0259lë\u027D\u0259ŋu walla g\u0259fo eđ\u0259ŋ đ\u0259ŋab\u0259\u027Da ŋom\u0259n.",
    "Leđa pređ ŋen ŋarcađa\u1E6Fo \u1E6Fa al\u0259fiđi eđ\u0259m\u0259\u1E6Fia eđen, đ\u0259m\u0259\u1E6Fia đ\u0259ŋ\u0259ra na đëb\u0259rëinialo na đëu\u1E6Faralo.",
    "Eđa gero g\u0259n\u0259ŋ giđi aŋiđ\u0259ni g\u0259\u027Do ebai walla aŋiđini ŋ\u0259baya. Ŋen ŋë\u1E6F\u0259muđu ŋ\u0259điđia leđa l\u0259\u027Do l\u0259bai na ŋ\u0259đirldiđëiđia leđa rađra pređ r\u0259lë\u027D\u0259ŋu.",
    "Eđa gero g\u0259n\u0259ŋ giđi aŋiđini ŋađ\u0259na aŋ\u0259nëini ŋen ŋibwa egaŋ\u0259no walla aŋ\u0259mwëđinialo walla aŋiđini ŋen ŋero ŋ\u0259barna ŋ\u0259leđa, walla aŋiđ\u0259n\u1E6Fi ŋen ŋ\u0259kera đamia đ\u0259lë\u027D\u0259ŋu walla aŋëbini eŋen ëpwaya.",
    "Leđa pređ ŋen ŋaŋ\u0259ra \u1E6Fa aliđ\u0259n\u1E6Fi ŋen ŋ\u0259rcađa\u1E6Fo \u1E6Fa aŋiđ\u0259n\u1E6Fi eđa g\u0259n\u0259ŋ nd\u0259 gënŋu g\u0259fo alganun nëñua.",
    "Leđa pređ la\u027D\u0259wa\u1E6Fo eŋen alganun nëñua na lënŋulu pređ ŋen ŋarcađa\u1E6Fo \u1E6Fa al\u0259fiđi ŋen ŋero ŋ\u0259m\u0259lađia eđak\u0259m\u0259đia. Na lënŋulu com ŋen ŋaŋ\u0259ra \u1E6Fa al\u0259fiđi đ\u0259b\u0259\u027D\u0259c\u0259niano đ\u0259\u027D\u0259wa\u1E6Fo alganun nëñua đ\u0259pëiđia leđano đero, ŋen iŋi ŋ\u0259kera ŋen ŋ\u0259 Đ\u0259lwa\u027Do P\u0259lelo Đalo iđi na ŋakia ŋen ŋ\u0259đ\u0259bwaiđia eŋen ŋ\u0259đakarn\u0259điano.",
    "Leđa pređ ŋen ŋarcađa\u1E6Fo \u1E6Fa al\u0259fiđi đak\u0259mia đ\u0259ŋ\u0259ra en\u0259l\u0259ŋ nak\u0259m\u0259đia nirnuŋ igi ld\u0259fau, nd\u0259 eđa g\u0259n\u0259ŋ giđ\u0259n\u1E6Fu ŋen ŋ\u0259b\u0259\u027Daŋ\u0259no eŋen iŋi ŋ\u0259\u027Do ađuna eŋen ŋ\u0259rcađa\u1E6Fo \u1E6Fa aŋ\u0259fidi eŋen iŋi ŋ\u0259fo i\u1E6Fas\u1E6Fur walla igalganun.",
    "Ŋen ŋero ŋaŋ\u0259ra \u1E6Fa eđa g\u0259n\u0259ŋ aŋënd\u0259ni m\u0259\u027D\u0259m\u0259\u027D\u0259ñ walla aŋ\u0259đurwini liga lob\u0259lano walla lwalano đak\u0259mia đero, walla aŋ\u0259miñ\u0259ni walla aŋ\u0259lëld\u0259ñ\u0259ni irnuŋ g\u0259lë\u027D\u0259ŋu aŋ\u0259đwëini nwaldaŋ ŋab\u0259\u027Daŋa.",
    "Leđa pređ ler\u1E6Fo ŋen ŋ\u0259\u027D\u0259wa\u1E6Fo \u1E6Fa đ\u0259skinia eđen ađ\u0259nwënëini n\u0259l\u0259ŋ nëñua nak\u0259m\u0259đia nalmak\u0259ma yero yeb\u0259r\u1E6Fa ŋ\u0259l\u0259ŋe ŋom\u0259n ŋ\u0259đuru ilë\u027Dua na yiđurwa\u1E6Fu yet\u0259\u027De, ŋenŋan\u1E6Fa n\u0259l\u0259ŋ nak\u0259m\u0259đia an\u0259lak\u0259m\u0259đ\u0259\u1E6Fi ŋenŋa ŋ\u0259đurwa\u1E6Fu iŋi ŋ\u0259rcađa\u1E6Fo \u1E6Fa al\u0259fiđi eŋen pređ iŋi lënŋulu l\u0259skiniau.",
    "Eđa g\u0259n\u0259ŋ gënd\u0259nu walla g\u0259s\u0259kinu ŋenŋa ŋ\u0259n\u0259ŋ, gënŋu gumađëinia \u1E6Fa gero m\u0259nna m\u0259ldin na ŋen iŋi g\u0259skiniya aŋ\u0259masa\u1E6Fe almak\u0259ma nëñua isi ye\u027D\u0259wađa\u1E6Fo \u1E6Fa ay\u0259manace liga \u1E6Fa aŋop\u0259\u1E6Fe etam g\u0259lë\u027D\u0259ŋu.Eđa gero g\u0259n\u0259ŋ giđi aŋak\u0259m\u0259ni ŋenŋan\u1E6Fa gënŋu gatođo walla gero g\u0259tođa ŋ\u0259më\u027Driaŋa ŋ\u0259n\u0259ŋ illi nd\u0259 ŋ\u0259më\u027Dria ŋak\u0259l ŋumađëinu \u1E6Fa ŋa\u027Do đ\u0259kera ŋen ŋalganun yeleđa lirnuŋ iliga đurri ildi eđa giđi\u1E6Fau walla gero g\u0259b\u0259đia ŋen ŋak\u0259l. Na eđa aŋer\u1E6Fe gak\u0259m\u0259nia ŋenŋa ŋ\u0259m\u0259ñ\u0259đialo eŋen iŋi ŋ\u0259rcađa\u1E6Fo \u1E6Fa aŋ\u0259yak\u0259m\u0259ni iliga ildi g\u0259fo giđi\u1E6Fau m\u0259nna gak\u0259l.",
    "Leđa pređ ŋen ŋaŋen đe\u1E6F\u0259m \u1E6Fa eđa g\u0259n\u0259ŋ aŋer\u1E6Fe jinsiya.Ŋen ŋafo m\u0259nna \u1E6Fa eđa g\u0259n\u0259ŋ aŋ\u0259mu\u027Dëini jinsiya ŋab\u0259\u027Daŋa walla aŋer\u1E6Fe g\u0259bëŋ\u0259n\u0259\u1E6Fia nd\u0259 gënŋu gona\u1E6Fa g\u0259m\u0259lëđia jinsiya alo yilë\u027D\u0259ŋu.",
    "Ŋen ŋero ŋ\u0259ŋ\u0259ra \u1E6Fa eđa g\u0259n\u0259ŋ aŋën\u1E6Fi eŋen eđa gom\u0259n m\u0259\u027D\u0259m\u0259\u027D\u0259ñ walla aŋën\u1E6Fi eŋen ŋe\u027Da g\u0259lë\u027D\u0259ŋu walla ekal isi g\u0259fau, walla aŋën\u1E6Fi eŋen leđa l\u0259yarr\u0259ŋ\u0259n\u0259đia, na eđa g\u0259n\u0259ŋ aŋer\u1E6Fe g\u0259đama đamia đeđa gom\u0259n na đ\u0259ŋ\u0259ra đ\u0259lë\u027D\u0259ŋu. Leđa pređ ler\u1E6Fo ŋen đe\u1E6F\u0259m \u1E6Fa alganun ay\u0259\u027Dr\u0259mo\u1E6Fwe eŋen iŋi ŋ\u0259đërr\u0259n\u1E6Fia eŋen ŋeđa g\u0259n\u0259ŋ walla đ\u0259đama eđa.",
    "Leđa pređ ŋen ŋaŋen đe\u1E6F\u0259m \u1E6Fa alakaldace alo irnuŋ \u027Det\u0259\u027Deto lëb\u0259rëinialo, na ŋen aŋer\u1E6Fe ŋ\u0259n\u0259ŋ ŋ\u0259tri\u1E6Fia eđa \u1E6Fa aŋ\u0259fe\u1E6Fe irnuŋ igi gona\u1E6Fo alo er\u0259\u027Diaŋ rirnuŋ g\u0259lë\u027D\u0259ŋu.Leđa pređ ŋen ŋaŋen đe\u1E6F\u0259m al\u0259mam\u0259ñe na alerlde\u1E6Fe irnuŋ ndëwur egen, na aloko\u027D\u0259ba\u1E6Fa irnuŋ egen ŋen ŋero ŋ\u0259n\u0259ŋ ŋ\u0259l\u0259đ\u0259rna",
    "Leđa pređ ŋen ŋaŋen na ŋarcađa\u1E6Fo \u1E6Fa nd\u0259 l\u0259nanënia ŋen ŋibwa ŋ\u0259b\u0259\u027Daŋ\u0259no irnuŋ egen al\u0259gakonde ŋen \u1E6Fa aldald\u0259ñ\u0259\u1E6Fe irnuŋ g\u0259rto ŋenŋan\u1E6Fa al\u0259wëb\u0259rđëini na alufiđi đ\u0259miñ\u0259niano.Ŋen iŋi ŋ\u0259rcađa\u1E6Fo \u1E6Fa aŋiđ\u0259n\u1E6Fi leđa, ŋaber ŋam\u0259đa\u1E6Fa eđa g\u0259n\u0259ŋ nd\u0259 g\u0259mamëinu nalmak\u0259ma ŋenŋa ŋ\u0259rto ŋer\u1E6Fa ŋaŋamda walla nd\u0259 gënŋu g\u0259tođo ŋ\u0259më\u027Driaŋa ŋ\u0259n\u0259ŋ ŋ\u0259m\u0259lađo eŋen ŋalganun ye Leđa ildi L\u0259rrëiđu ŋen na eŋen iŋi ldëkë\u027Du.",
    // "Leđa pređ ŋen ŋaŋen đe\u1E6F\u0259m \u1E6Fa eđa g\u0259n\u0259ŋ aŋer\u1E6Fe jinsiya.Ŋen ŋafo m\u0259nna \u1E6Fa eđa g\u0259n\u0259ŋ aŋ\u0259mu\u027Dëini jinsiya ŋab\u0259\u027Daŋa walla aŋer\u1E6Fe g\u0259bëŋ\u0259n\u0259\u1E6Fia nd\u0259 gënŋu gona\u1E6Fa g\u0259m\u0259lëđia jinsiya alo yilë\u027D\u0259ŋu.",
    "Orra na obwa nđ\u0259 lënŋulu l\u0259rma\u1E6Fo iliga l\u0259ŋ\u0259ra l\u0259\u027D\u0259wađa\u1E6Fo \u1E6Fa al\u0259m\u0259đe alwaḏe e\u027Da egen, ŋen ŋaŋ\u0259ra \u1E6Fa lënŋulu al\u0259m\u0259đe na ŋen aŋer\u1E6Fe ŋ\u0259n\u0259ŋ ŋ\u0259l\u0259tri\u1E6Fia, ŋen ŋarno ŋen ŋ\u0259đ\u0259l\u0259ŋe na ŋëmcu, walla ŋen ŋërđia g\u0259 R\u0259mwa. Lënŋulu nd\u0259m ler\u1E6Fo ŋen ŋ\u0259\u027D\u0259wa\u1E6Fo \u1E6Fa al\u0259m\u0259đe b\u0259\u027Dan, leđa aler\u1E6Fe l\u0259bën\u1E6Fia eŋen eŋen iliga ld\u0259m\u0259đia walla iliga ld\u0259neđia.Ŋen ŋaŋ\u0259ra \u1E6Fa đ\u0259ma ađëŋ\u0259n\u0259\u1E6Fi na ađiđ\u0259ni caŋ caŋ nd\u0259 leđa ildi l\u0259m\u0259đia lëŋ\u0259n\u0259c\u0259đu ŋamda ŋero na lero l\u0259đ\u0259rnađëiđ\u0259nia eŋen.E\u027Da ga\u027Do ađuna yiwëđ\u0259nu alo eleđa lirnuŋ yeleđa l\u0259\u027D\u0259jan l\u0259rrëiđu ŋen, na ŋen ŋarcađa\u1E6Fo \u1E6Fa lënŋulu al\u0259b\u0259\u027D\u0259c\u0259niano na a\u027Dr\u0259muj\u0259ni eleđa l\u0259\u027Dëwur na Irnuŋ Go\u027Dra.",
    "Leđa pređ ŋen ŋaŋ\u0259ra \u1E6Fa eđa g\u0259n\u0259ŋ naŋiđi đwala walla aŋer\u1E6Fe laŋge, g\u0259fo al\u0259soŋ gonto walla l\u0259rrëiđu ŋen leđala lom\u0259n.Ŋen ŋero ŋ\u0259ŋ\u0259ra đe\u1E6F\u0259m \u1E6Fa eđa g\u0259n\u0259ŋ aŋ\u0259mamëini đwala đ\u0259lë\u027D\u0259ŋu walla laŋge \u0259llë\u027D\u0259ŋu ildi ger\u1E6F\u0259lo m\u0259\u027D\u0259m\u0259\u027D\u0259ñ. ",
    "Leđa pređ ŋen ŋaŋen đe\u1E6F\u0259m \u1E6Fa eđa g\u0259n\u0259ŋ aŋ\u0259fe\u1E6Fe gëb\u0259rëinialo eŋen ŋ\u0259ŋ\u0259\u1E6F\u0259\u027Da ŋ\u0259lë\u027D\u0259ŋu, na ŋen ŋara g\u0259m\u0259\u1E6Fo g\u0259lë\u027D\u0259ŋu, na đëndia ŋen ŋërđia g\u0259 R\u0259mwa đ\u0259lë\u027D\u0259ŋu; na ŋen ŋ\u0259lë\u027D\u0259ŋu iŋi ŋan\u1E6Fa \u1E6Fa, eđa g\u0259n\u0259ŋ aŋ\u0259\u027D\u0259wađa\u1E6Fe aŋ\u0259m\u0259lëđi ŋen alo ŋërđia g\u0259lë\u027D\u0259ŋu walla ŋen iŋi gëndu ŋ\u0259 R\u0259mwa nd\u0259 gona\u1E6Fa, na ŋen aŋer\u1E6Fe ŋ\u0259n\u0259ŋ ŋ\u0259mađ\u0259rna \u1E6Fa ga\u027Dwata ŋenŋa ŋ\u0259lë\u027D\u0259ŋu ŋ\u0259 R\u0259mwa đarr\u0259ŋëiđiađa walla điđiaya ŋ\u0259me\u027Dria, na đëbuŋ\u0259\u1E6Fiađa R\u0259mwa g\u0259fo al\u0259soŋ walla l\u0259fo ld\u0259\u027Do leđala lwaña, eđa aŋer\u1E6Fe g\u0259n\u0259ŋ g\u0259bën\u1E6Fia eŋen ŋ\u0259lë\u027D\u0259ŋu.",
    "Leđa pređ ŋen ŋaŋen đe\u1E6F\u0259m \u1E6Fa eđa g\u0259n\u0259ŋ aŋëb\u0259rëini alo \u1E6Fa aŋaŋëiđi ŋen iŋi g\u0259sadëinia eŋ\u0259\u1E6F\u0259\u027Da ŋ\u0259lë\u027D\u0259ŋu na aŋ\u0259ye\u027Dwate; na ŋen iŋi ŋan\u1E6Fa eđa aŋëndëci na aŋ\u0259rmo\u1E6Fwe ŋen ŋ\u0259ŋ\u0259\u1E6F\u0259\u027Da ŋ\u0259lë\u027D\u0259ŋu eđa aŋer\u1E6Fe g\u0259n\u0259ŋ g\u0259mađ\u0259rna walla g\u0259bën\u1E6Fia eŋen ŋ\u0259lë\u027D\u0259ŋu, na ŋen ŋalë\u027D\u0259ŋu \u1E6Fa aŋgakonde na aŋ\u0259lald\u0259ŋe\u1E6Fe ŋen ŋ\u0259ŋ\u0259\u1E6F\u0259\u027Da ŋ\u0259leđa lom\u0259n na ŋen ŋ\u0259\u027Dwëtëinia imiḏia \u027Det\u0259\u027Deto na \u1E6Fa aŋ\u0259ye\u027Dwata\u1E6Fe ekal pređ r\u0259\u027Diaŋ ralo rero r\u0259mëtri\u1E6Fia.",
    "Ŋen ŋeđa g\u0259n\u0259ŋ đe\u1E6F\u0259m \u1E6Fa aŋe\u027D\u0259b\u0259đe gero g\u0259trin\u1E6Fia eŋen ŋ\u0259đ\u0259rarraiđia n\u0259ŋ\u0259\u027Do đ\u0259leđa đ\u0259fo đëu\u1E6Faral\u0259đa, na ŋen iŋi ŋ\u0259gakasaiđia leđa.Eđa gero g\u0259n\u0259ŋ giđi aŋ\u0259đ\u0259rnëini eŋen \u1E6Fa aŋën\u1E6Fi e\u027Do l\u0259n\u0259ŋ eŋ\u0259\u027Do ŋ\u0259leđa ŋab\u0259\u027Daŋa.",
    "Leđa pređ ŋen ŋaŋen đe\u1E6F\u0259m \u1E6Fa ale\u027D\u0259b\u0259đe eŋ\u0259l\u0259ŋe ŋak\u0259mia irnuŋ egen, garno gënŋu đurri walla leđala ildi lu\u1E6F\u0259nu ŋenŋa ŋëŋ\u0259n\u0259\u1E6Fu.Leđa pređ ler\u1E6Fo ŋen ŋ\u0259\u027D\u0259wa\u1E6Fo đe\u1E6F\u0259m \u1E6Fa alërr\u0259n\u1E6Fi iŋ\u0259më\u027Dria iŋi ŋ\u0259leđa pređ irnuŋ egen.Ŋen iŋi leđa lona\u1E6Fa đe\u1E6F\u0259m ŋen ŋarcađa\u1E6Fo \u1E6Fa aŋ\u0259\u027De\u1E6Fe iđuna yeŋ\u0259l\u0259ŋe ŋ\u0259đak\u0259mia, na đona\u1E6Fa iđi ŋen ŋaŋ\u0259ra \u1E6Fa ađ\u0259fe\u1E6Fe ŋenŋa ŋ\u0259đo\u1E6Fa leđa iŋiga ŋ\u0259l\u0259ŋinu na ŋ\u0259rcađa\u1E6Fo, na ŋ\u0259naco leđa pređ liga l\u0259\u027D\u0259wa\u1E6Fo ŋenŋan\u1E6Fa alo\u1E6Fe leđa ildi l\u0259lona\u1E6Fa đe\u1E6F\u0259mđa ŋamda ŋero. Na nab\u0259ređa n\u0259đo\u1E6Fa leđa an\u0259fe\u1E6Fe ŋenŋa ŋ\u0259wëc\u0259nu ŋenŋan\u1E6Fa đo\u1E6Fa leđa ađ\u0259fe\u1E6Fe ŋenŋa ŋ\u0259đurwa\u1E6Fu.",
    "Eđa g\u0259n\u0259ŋ g\u0259fo eleđa l\u0259\u027Dëwur, ŋen ŋalë\u027D\u0259ŋu đe\u1E6F\u0259m \u1E6Fa aŋer\u1E6Fe ŋen ŋ\u0259marmo\u1E6Fwa igëwur yilë\u027D\u0259ŋu  na aŋ\u0259l\u0259ŋini \u1E6Fa ŋen aŋ\u0259miđ\u0259n\u1E6Fi ŋ\u0259më\u027Driaŋa ŋ\u0259leđa lirnuŋ đam\u0259điađiađa đ-Irnuŋ Go\u027Dra l\u0259bate nano na ŋen aŋ\u0259fe\u1E6Fe ŋenŋa ŋarno Irnuŋ Go\u027Dra gakë\u027Dëcu đwalađa đ\u0259lë\u027D\u0259ŋu garno rađ irri r\u0259bëncia đwala eŋen ŋ\u0259đwala na đ\u0259fia eŋ\u0259\u027Do ŋ\u0259leđa ŋërriaŋa eŋen iŋi ŋ\u0259ŋ\u0259ra ŋam\u0259đa\u1E6Fa đamia đ\u0259lë\u027D\u0259ŋu na đëb\u0259rëinialo đ\u0259miñiađëcia ŋen nëñua ŋegaŋ\u0259no yilë\u027D\u0259ŋu.",
    "Leđa pređ ŋen ŋarcađa\u1E6Fo \u1E6Fa aliđi ŋ\u0259më\u027Dria, na \u1E6Fa eđa g\u0259n\u0259ŋ aŋo\u1E6Fe ŋ\u0259më\u027Dria iŋi gona\u1E6Fo na ŋ\u0259rcađa\u1E6F\u0259ma nano ŋenŋa ŋ\u0259đurwa\u1E6Fu na ŋëŋ\u0259n\u0259\u1E6Fu. Na com ŋen ŋalë\u027D\u0259ŋu đe\u1E6F\u0259m \u1E6Fa aŋ\u0259b\u0259\u027D\u0259c\u0259niano iliga gero g\u0259fiđia ŋ\u0259më\u027Dria. Leđa pređ ŋen ŋarcađa\u1E6Fo \u1E6Fa al\u0259p\u0259\u027D\u0259ni iŋ\u0259më\u027Dria eŋen đwalađa đ\u0259\u027D\u0259wa\u1E6Fo đ\u0259pëiđiano đero eŋen.Leđa pređ ildi l\u0259b\u0259đia ŋ\u0259më\u027Dria, ŋen ŋaŋ\u0259ra \u1E6Fa al\u0259nëini đ\u0259p\u0259\u027Da đ\u0259ŋ\u0259ra đ\u0259rcađa\u1E6Fo ŋ\u0259më\u027Dria nano eŋen \u1E6Fa ađ\u0259\u027D\u0259wađace eđa na leđa le\u027Da g\u0259lë\u027D\u0259ŋu ŋenŋan\u1E6Fa al\u0259\u027D\u0259wađa\u1E6Fe l\u0259m\u0259\u1E6Fia đ\u0259m\u0259\u1E6Fia đame đ\u0259rcađa\u1E6Fo, na com \u1E6Fa aŋë\u027D\u0259jin\u1E6Fi egorb, nd\u0259 ŋen ŋ\u0259fo ŋ\u0259ma\u1E6Fan ŋunëinia, ŋenŋan\u1E6Fa eđa aŋ\u0259fe\u1E6Fe iđ\u0259rmo\u1E6Fwa eleđa l\u0259\u027Dëwur.Leđa pređ ŋen ŋaŋ\u0259ra na ŋarcađa\u1E6Fo \u1E6Fa al\u0259tuđi ŋ\u0259\u027Do ŋ\u0259ŋ\u0259më\u027Dria pređ eŋen ŋenŋan\u1E6Fa ŋ\u0259\u027Do ŋen iŋi aŋ\u0259rmo\u1E6Fwe ŋen eŋen ŋ\u0259ŋ\u0259më\u027Dria.",
    "Leđa pređ ŋen ŋarcađa\u1E6Fo \u1E6Fa aler\u1E6Fe liga l\u0259đ\u0259miñ\u0259niano, na ŋiga ŋ\u0259piano ŋero ŋ\u0259më\u027Driano. Na \u1E6Fa eđa aŋënd\u0259n\u1E6Fi liga na sa ye\u027D\u0259wađa\u1E6Fo ŋ\u0259më\u027Dria nano na eđa aŋer\u1E6Fe ñoman ñ\u0259đ\u0259miñ\u0259niano ñ\u0259l\u0259ŋinu na ñup\u0259\u027D\u0259đ\u0259nia.",
    "Leđa pređ ŋen ŋarcađa\u1E6Fo \u1E6Fa al\u0259fiđi ŋen ŋ\u0259đ\u0259m\u0259\u1E6Fia đ\u0259ŋ\u0259ra đ\u0259\u027D\u0259wađaco eđa g\u0259n\u0259ŋ \u1E6Fa gënŋu na leđa le\u027Da g\u0259lë\u027D\u0259ŋu al\u0259fiđi đ\u0259ŋ\u0259ra egaŋ\u0259no na al\u0259fe\u1E6Fe eđ\u0259ŋ\u0259ranano na aler\u1E6Fe ŋ\u0259sa, ndrenia, e\u027Da, na al\u0259fiđi ñakim na đ\u0259b\u0259\u027D\u0259c\u0259niano ŋ\u0259më\u027Driaŋa pređ iŋi ŋam\u0259đa\u1E6Fa ëwur. Na nd\u0259 eđa g\u0259n\u0259ŋ gero g\u0259\u027D\u0259wađa\u1E6Fia walla nd\u0259 gëy\u0259niau walla go\u027Dra in\u1E6F\u0259lia walla nd\u0259 gero ŋen ŋ\u0259mam\u0259đa\u1E6Fa eđ\u0259m\u0259\u1E6Fia đ\u0259lë\u027D\u0259ŋu, ŋen ŋaŋ\u0259ra \u1E6Fa eđa gak\u0259l aŋ\u0259b\u0259\u027D\u0259c\u0259niano aŋ\u0259rmuj\u0259ni.Ŋen ŋaŋ\u0259ra đe\u1E6F\u0259m \u1E6Fa ñ\u0259ŋgenia na ñere ñ\u0259l\u0259ŋ\u0259nu maj\u0259n al\u0259fiđi\u1E6Fi đ\u0259b\u0259\u027D\u0259c\u0259niano đ\u0259ŋ\u0259ra. Na ñere pređ ñ\u0259l\u0259ŋ\u0259nu ŋenŋa ŋ\u0259đurwa\u1E6Fu walla ñ\u0259l\u0259ŋ\u0259nu alo, ŋen ŋarcađa\u1E6Fota añ\u0259fidi đ\u0259b\u0259\u027D\u0259c\u0259niano đ\u0259ŋ\u0259ra na đam\u0259đa\u1E6Fa ŋenŋa ŋ\u0259\u027D\u0259wa\u1E6Fo.",
    "Ŋen ŋaŋ\u0259ra đe\u1E6F\u0259m \u1E6Fa eđa g\u0259n\u0259ŋ aŋ\u0259fidi đëgria. Đëgria iđi đ\u0259twalalo đananoŋ ŋen ŋarcađa\u1E6Fo \u1E6Fa đëgria ađer\u1E6Fe đup\u0259\u027D\u0259đ\u0259nia. Na đëgria đananoŋ iđi ađ\u0259fe\u1E6Fe ŋ\u0259maŋa eñere pređ. Na đëgria iđi đ\u0259\u1E6Fiknoloji na đ\u0259ŋo\u027Dofa ŋ\u0259ŋ\u0259më\u027Dria \u027Det\u0259\u027Deto ađ\u0259fe\u1E6Fe đwaña alo. Na đëgria iđi đo\u027Dra đ\u0259jama ađ\u0259fe\u1E6Fe ŋenŋa ŋ\u0259\u027D\u0259wa\u1E6Fo ŋen ŋarno ŋ\u0259lwa iŋi ñere ñ\u0259bëgria ñarr\u0259po.Ŋen ŋaŋ\u0259ra \u1E6Fa đëgria ađ\u0259\u1E6Fu\u027Dëini ŋenŋa ŋ\u0259đam\u0259đa\u1E6Fa đ\u0259borkwađa\u1E6Fa nëñua đ\u0259leđa entam enen na \u1E6Fa ađonḏ\u0259ce ŋen ŋ\u0259đ\u0259rmo\u1E6Fwa ŋen ŋ\u0259ŋ\u0259ra \u1E6Fa aŋiđ\u0259n\u1E6Fi leđa ŋenŋa ŋ\u0259đëb\u0259rëinialo eđen. Na ŋen ŋalë\u027D\u0259ŋu com \u1E6Fa ađ\u0259ma đ\u0259l\u0259ŋe\u1E6Fa, na đ\u0259\u027D\u0259ña\u1E6Fa ŋen na ŋ\u0259l\u0259ŋ\u0259nia eleđa lalo pređ, garno đ\u0259l\u0259ŋe \u027Det\u0259\u027Deto walla ŋ\u0259\u027Do ŋërđia g\u0259 R\u0259mwa, \u1E6Fa ŋ\u0259më\u027Dria ŋ\u0259 Leđa ildi L\u0259rrëiđu ŋen  aŋ\u0259\u027Dalađa\u1E6Fe nëñua eŋen ŋ\u0259rmo\u1E6Fwa đëu\u1E6Faralo.Apaŋ\u0259nda l\u0259l\u0259ŋo ñere ŋen ŋaŋ\u0259ra đe\u1E6F\u0259m \u1E6Fa alo\u1E6Fe ŋen ŋ\u0259đ\u0259m\u0259ca ñere eñen nađëgria iđi lënŋulu lona\u1E6Fa \u1E6Fa ñere añëgri.",
    "Leđa pređ ŋen ŋaŋ\u0259ra đe\u1E6F\u0259m \u1E6Fa eđa g\u0259n\u0259ŋ naŋe\u027D\u0259b\u0259đe eŋen ŋ\u0259ŋërria ŋ\u0259leđa l\u0259\u027Dëwur , \u1E6Fa aŋ\u0259re\u1E6Fe nano ŋo\u027Dofaŋa pređ na aŋe\u027D\u0259b\u0259đe eŋen ŋ\u0259đ\u0259borkwađa\u1E6Fa nëñua eŋen ŋ\u0259đ\u0259l\u0259ŋe\u1E6Fa \u027Det\u0259\u027Deto na eŋ\u0259lwa ŋ\u0259lë\u027D\u0259ŋu. Leđa pređ ŋen ŋaŋ\u0259ra đe\u1E6F\u0259m \u1E6Fa eđa g\u0259n\u0259ŋ aŋ\u0259rmuđ\u0259n\u1E6Fi ŋen ŋara g\u0259lë\u027D\u0259ŋu na ŋaŋ\u0259no yilë\u027D\u0259ŋo na ŋen iŋi aŋgace \u1E6Fa aŋela eŋ\u0259lwa ŋak\u0259l iŋi eđa g\u0259miñu eŋen ŋ\u0259đ\u0259l\u0259ŋe\u1E6Fa, ŋ\u0259đëgria walla ŋ\u0259ŋo\u027Dofa.",
    "Ŋen ŋaŋ\u0259ra \u1E6Fa leđa pređ al\u0259fiđi ŋen iŋi ŋ\u0259\u1E6Fo\u027Da\u1E6Fa ëwur yeleđa lirnuŋ na l\u0259bate nano ŋenŋan\u1E6Fa eđa g\u0259n\u0259ŋ aŋ\u0259\u027D\u0259wađa\u1E6Fe g\u0259fiđia ŋen pređ iŋi ŋ\u0259ŋ\u0259ra \u1E6Fa leđa aler\u1E6Fe na ŋen ŋ\u0259đëb\u0259rëinial pređ iŋi ŋ\u0259wërđëinu eŋen ŋ\u0259 Đ\u0259lwa\u027Da P\u0259lelo Đalo iđi aŋ\u0259\u027Diñađëini ŋopia.",
    "Leđa pređ ler\u1E6Fo ŋ\u0259më\u027Dria igëwur esen iŋi ŋ\u0259ŋgi\u1E6Fia eđa g\u0259n\u0259ŋ go\u027D\u0259wađa\u1E6Fia gufiđia liga l\u0259ŋ\u0259ra \u1E6Fa aŋ\u0259burkwëđëci etam nëñua g\u0259lë\u027D\u0259ŋu ŋen ŋero ŋ\u0259n\u0259ŋ ŋ\u0259đ\u0259rnaiđ\u0259ma.Iliga eđa g\u0259n\u0259ŋ g\u0259tođa ŋ\u0259më\u027Driaŋa ŋ\u0259lë\u027D\u0259ŋu ŋenŋa iŋi ŋ\u0259rcađa\u1E6Fo \u1E6Fa aŋer\u1E6Fe eŋen ŋ\u0259đëb\u0259rëinialo đ\u0259lë\u027D\u0259ŋu, ŋen ŋaŋ\u0259ra \u1E6Fa leđa pređ al\u0259kasëiđ\u0259ni ŋenŋa iŋi ŋ\u0259fo igalganun ik\u0259r\u0259ŋ, ŋenŋan\u1E6Fa ŋen aŋëŋ\u0259n\u0259\u1E6Fi na aŋ\u0259rmuj\u0259ni iŋi ŋ\u0259ŋ\u0259ra \u1E6Fa leđa aler\u1E6Fe lom\u0259n, na đëb\u0259rëinialo eđen, \u1E6Fa ŋen aŋ\u0259\u027D\u0259ñađaiđe iŋi ŋ\u0259mama ŋen ŋ\u0259đurwa\u1E6Fu eŋen iŋi ŋ\u0259\u1E6Fo\u027Da\u1E6Fa leđa pređ na eŋen iŋi leđa pređ lona\u1E6Fa \u1E6Fa aŋ\u0259fe\u1E6Fe igëwur yeleđa ye\u027Do ḏimugra\u1E6Fi.Ŋen ŋero ŋ\u0259fia ŋopia \u1E6Fa ŋen iŋi ŋ\u0259ŋ\u0259ra \u1E6Fa leđa aler\u1E6Fe na đëb\u0259rëinialo eđen al\u0259fe\u1E6Fe ŋenŋa ŋ\u0259m\u0259lađo eŋen iŋi Leđa ildi L\u0259rrëiđu ŋen lëkë\u027Du ŋ\u0259\u027Do iđuna.",
    "Ŋen pređ iŋi ŋ\u0259wërđëinu e-Đ\u0259lwa\u027Da P\u0259lelo Đalo iđi aŋer\u1E6Fe ŋiđi aŋ\u0259m\u0259lëđini alo \u1E6Fa aŋiđi ŋen ŋam\u0259đa\u1E6Fa Irnuŋ Go\u027Dra g\u0259n\u0259ŋ, eđa g\u0259n\u0259ŋ walla leđa eŋ\u0259\u027Do aler\u1E6Fe l\u0259b\u0259r\u1E6Fa ŋ\u0259l\u0259ŋe \u1E6Fa al\u0259tođe ŋenŋa ŋ\u0259n\u0259ŋ walla ŋ\u0259më\u027Driaŋa ŋ\u0259n\u0259ŋ ŋenŋan\u1E6Fa al\u0259kere ŋen ŋ\u0259n\u0259ŋ iŋi ŋ\u0259wërđëinu e-Đ\u0259lwa\u027Da P\u0259lelo Đalo iđi eŋen iŋi ŋ\u0259rcađa\u1E6Fo \u1E6Fa leđa aler\u1E6Fe na đëb\u0259rëinialo eđen.",
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
