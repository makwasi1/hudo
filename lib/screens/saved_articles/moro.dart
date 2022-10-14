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
    "Leđa pređ lalǝŋǝnia lëbǝrëinialo na lǝɽǝwaṯo eŋen ŋǝđamia na eŋen pređ iŋi ŋǝrcađaṯo ṯa leđa alǝfiđi. Lënŋulu pređ lananëinu đǝnaca đame ɽetǝɽeto na ara gǝŋǝra ŋenŋanṯa alǝɽǝwađaṯe alamǝđaiđe bǝɽan usilaga gǝŋǝlǝŋǝnia na gǝŋorba.",
    "Ŋen ŋaŋǝra ṯa leđa pređ alǝfiđi ŋen pređ iŋi ŋǝrcađaṯo ṯa aŋǝfeṯe eđǝmǝṯia eđen na đëbǝrëinialo eŋen iŋi ŋǝwërđëinu e-Đǝlwaɽa Pǝlelo Đalo iđi eđa gero gǝnǝŋ gǝđǝrnëinu alo, ŋenŋa ŋëmcu, aŋǝno, đǝlǝŋe, ole, ërđia, ŋen ŋǝŋamda ŋǝṯur, walla ŋen iŋi leđa lomǝn lǝsëcia, walla ŋen ŋalo irnuŋ walla ŋen ŋǝŋǝɽo ŋǝleđa, walla laŋge ildi eđa gerṯǝlo, đǝlǝŋǝnia walla ŋen ŋǝmǝn iŋi ŋakëɽǝnu, na ṯa đakarnǝđiano ađerṯe eleđa lǝrrwa walla lǝɽǝlda. Na eŋen ŋwaña ŋomǝn tǝŋ, đǝbapërđǝniano ađerṯe đǝfia eŋen ŋǝŋamda iŋi eđa gǝnǝŋ gëŋǝnṯu na ŋǝlǝŋe ŋalganun walla rađ irri Irnuŋ Goɽra gǝlǝyerlda walla irnuŋ gǝrra geđa gǝnǝŋ ndǝ gënŋu gakǝmia etam gǝlëɽǝŋu walla gǝfo eđǝŋ đǝŋabǝɽa ŋomǝn.",
    "Leđa pređ ŋen ŋarcađaṯo ṯa alǝfiđi eđǝmǝṯia eđen, đǝmǝṯia đǝŋǝra na đëbǝrëinialo na đëuṯaralo.",
    "Eđa gero gǝnǝŋ giđi aŋiđǝni gǝɽo ebai walla aŋiđini ŋǝbaya. Ŋen ŋëṯǝmuđu ŋǝđiđia leđa lǝɽo lǝbai na ŋǝđirldiđëiđia leđa rađra pređ rǝlëɽǝŋu.",
    "Eđa gero gǝnǝŋ giđi aŋiđini ŋađǝna aŋǝnëini ŋen ŋibwa egaŋǝno walla aŋǝmwëđinialo walla aŋiđini ŋen ŋero ŋǝbarna ŋǝleđa, walla aŋiđǝnṯi ŋen ŋǝkera đamia đǝlëɽǝŋu walla aŋëbini eŋen ëpwaya.",
    "Leđa pređ ŋen ŋaŋǝra ṯa aliđǝnṯi ŋen ŋǝrcađaṯo ṯa aŋiđǝnṯi eđa gǝnǝŋ ndǝ gënŋu gǝfo alganun nëñua.",
    "Leđa pređ laɽǝwaṯo eŋen alganun nëñua na lënŋulu pređ ŋen ŋarcađaṯo ṯa alǝfiđi ŋen ŋero ŋǝmǝlađia eđakǝmǝđia. Na lënŋulu com ŋen ŋaŋǝra ṯa alǝfiđi đǝbǝɽǝcǝniano đǝɽǝwaṯo alganun nëñua đǝpëiđia leđano đero, ŋen iŋi ŋǝkera ŋen ŋǝ Đǝlwaɽo Pǝlelo Đalo iđi na ŋakia ŋen ŋǝđǝbwaiđia eŋen ŋǝđakarnǝđiano.",
    "Leđa pređ ŋen ŋarcađaṯo ṯa alǝfiđi đakǝmia đǝŋǝra enǝlǝŋ nakǝmǝđia nirnuŋ igi ldǝfau, ndǝ eđa gǝnǝŋ giđǝnṯu ŋen ŋǝbǝɽaŋǝno eŋen iŋi ŋǝɽo ađuna eŋen ŋǝrcađaṯo ṯa aŋǝfidi eŋen iŋi ŋǝfo iṯasṯur walla igalganun.",
    "Ŋen ŋero ŋaŋǝra ṯa eđa gǝnǝŋ aŋëndǝni mǝɽǝmǝɽǝñ walla aŋǝđurwini liga lobǝlano walla lwalano đakǝmia đero, walla aŋǝmiñǝni walla aŋǝlëldǝñǝni irnuŋ gǝlëɽǝŋu aŋǝđwëini nwaldaŋ ŋabǝɽaŋa.",
    "Leđa pređ lerṯo ŋen ŋǝɽǝwaṯo ṯa đǝskinia eđen ađǝnwënëini nǝlǝŋ nëñua nakǝmǝđia nalmakǝma yero yebǝrṯa ŋǝlǝŋe ŋomǝn ŋǝđuru ilëɽua na yiđurwaṯu yetǝɽe, ŋenŋanṯa nǝlǝŋ nakǝmǝđia anǝlakǝmǝđǝṯi ŋenŋa ŋǝđurwaṯu iŋi ŋǝrcađaṯo ṯa alǝfiđi eŋen pređ iŋi lënŋulu lǝskiniau.",
    "Eđa gǝnǝŋ gëndǝnu walla gǝsǝkinu ŋenŋa ŋǝnǝŋ, gënŋu gumađëinia ṯa gero mǝnna mǝldin na ŋen iŋi gǝskiniya aŋǝmasaṯe almakǝma nëñua isi yeɽǝwađaṯo ṯa ayǝmanace liga ṯa aŋopǝṯe etam gǝlëɽǝŋu.Eđa gero gǝnǝŋ giđi aŋakǝmǝni ŋenŋanṯa gënŋu gatođo walla gero gǝtođa ŋǝmëɽriaŋa ŋǝnǝŋ illi ndǝ ŋǝmëɽria ŋakǝl ŋumađëinu ṯa ŋaɽo đǝkera ŋen ŋalganun yeleđa lirnuŋ iliga đurri ildi eđa giđiṯau walla gero gǝbǝđia ŋen ŋakǝl. Na eđa aŋerṯe gakǝmǝnia ŋenŋa ŋǝmǝñǝđialo eŋen iŋi ŋǝrcađaṯo ṯa aŋǝyakǝmǝni iliga ildi gǝfo giđiṯau mǝnna gakǝl.",
    "Leđa pređ ŋen ŋaŋen đeṯǝm ṯa eđa gǝnǝŋ aŋerṯe jinsiya.Ŋen ŋafo mǝnna ṯa eđa gǝnǝŋ aŋǝmuɽëini jinsiya ŋabǝɽaŋa walla aŋerṯe gǝbëŋǝnǝṯia ndǝ gënŋu gonaṯa gǝmǝlëđia jinsiya alo yilëɽǝŋu.",
    "Ŋen ŋero ŋǝŋǝra ṯa eđa gǝnǝŋ aŋënṯi eŋen eđa gomǝn mǝɽǝmǝɽǝñ walla aŋënṯi eŋen ŋeɽa gǝlëɽǝŋu walla ekal isi gǝfau, walla aŋënṯi eŋen leđa lǝyarrǝŋǝnǝđia, na eđa gǝnǝŋ aŋerṯe gǝđama đamia đeđa gomǝn na đǝŋǝra đǝlëɽǝŋu. Leđa pređ lerṯo ŋen đeṯǝm ṯa alganun ayǝɽrǝmoṯwe eŋen iŋi ŋǝđërrǝnṯia eŋen ŋeđa gǝnǝŋ walla đǝđama eđa.",
    "Leđa pređ ŋen ŋaŋen đeṯǝm ṯa alakaldace alo irnuŋ ɽetǝɽeto lëbǝrëinialo, na ŋen aŋerṯe ŋǝnǝŋ ŋǝtriṯia eđa ṯa aŋǝfeṯe irnuŋ igi gonaṯo alo erǝɽiaŋ rirnuŋ gǝlëɽǝŋu.Leđa pređ ŋen ŋaŋen đeṯǝm alǝmamǝñe na alerldeṯe irnuŋ ndëwur egen, na alokoɽǝbaṯa irnuŋ egen ŋen ŋero ŋǝnǝŋ ŋǝlǝđǝrna",
    "Leđa pređ ŋen ŋaŋen na ŋarcađaṯo ṯa ndǝ lǝnanënia ŋen ŋibwa ŋǝbǝɽaŋǝno irnuŋ egen alǝgakonde ŋen ṯa aldaldǝñǝṯe irnuŋ gǝrto ŋenŋanṯa alǝwëbǝrđëini na alufiđi đǝmiñǝniano.Ŋen iŋi ŋǝrcađaṯo ṯa aŋiđǝnṯi leđa, ŋaber ŋamǝđaṯa eđa gǝnǝŋ ndǝ gǝmamëinu nalmakǝma ŋenŋa ŋǝrto ŋerṯa ŋaŋamda walla ndǝ gënŋu gǝtođo ŋǝmëɽriaŋa ŋǝnǝŋ ŋǝmǝlađo eŋen ŋalganun ye Leđa ildi Lǝrrëiđu ŋen na eŋen iŋi ldëkëɽu.",
    // "Leđa pređ ŋen ŋaŋen đeṯǝm ṯa eđa gǝnǝŋ aŋerṯe jinsiya.Ŋen ŋafo mǝnna ṯa eđa gǝnǝŋ aŋǝmuɽëini jinsiya ŋabǝɽaŋa walla aŋerṯe gǝbëŋǝnǝṯia ndǝ gënŋu gonaṯa gǝmǝlëđia jinsiya alo yilëɽǝŋu.",
    "Orra na obwa nđǝ lënŋulu lǝrmaṯo iliga lǝŋǝra lǝɽǝwađaṯo ṯa alǝmǝđe alwaḏe eɽa egen, ŋen ŋaŋǝra ṯa lënŋulu alǝmǝđe na ŋen aŋerṯe ŋǝnǝŋ ŋǝlǝtriṯia, ŋen ŋarno ŋen ŋǝđǝlǝŋe na ŋëmcu, walla ŋen ŋërđia gǝ Rǝmwa. Lënŋulu ndǝm lerṯo ŋen ŋǝɽǝwaṯo ṯa alǝmǝđe bǝɽan, leđa alerṯe lǝbënṯia eŋen eŋen iliga ldǝmǝđia walla iliga ldǝneđia.Ŋen ŋaŋǝra ṯa đǝma ađëŋǝnǝṯi na ađiđǝni caŋ caŋ ndǝ leđa ildi lǝmǝđia lëŋǝnǝcǝđu ŋamda ŋero na lero lǝđǝrnađëiđǝnia eŋen.Eɽa gaɽo ađuna yiwëđǝnu alo eleđa lirnuŋ yeleđa lǝɽǝjan lǝrrëiđu ŋen, na ŋen ŋarcađaṯo ṯa lënŋulu alǝbǝɽǝcǝniano na aɽrǝmujǝni eleđa lǝɽëwur na Irnuŋ Goɽra.",
    "Leđa pređ ŋen ŋaŋǝra ṯa eđa gǝnǝŋ naŋiđi đwala walla aŋerṯe laŋge, gǝfo alǝsoŋ gonto walla lǝrrëiđu ŋen leđala lomǝn.Ŋen ŋero ŋǝŋǝra đeṯǝm ṯa eđa gǝnǝŋ aŋǝmamëini đwala đǝlëɽǝŋu walla laŋge ǝllëɽǝŋu ildi gerṯǝlo mǝɽǝmǝɽǝñ. ",
    "Leđa pređ ŋen ŋaŋen đeṯǝm ṯa eđa gǝnǝŋ aŋǝfeṯe gëbǝrëinialo eŋen ŋǝŋǝṯǝɽa ŋǝlëɽǝŋu, na ŋen ŋara gǝmǝṯo gǝlëɽǝŋu, na đëndia ŋen ŋërđia gǝ Rǝmwa đǝlëɽǝŋu; na ŋen ŋǝlëɽǝŋu iŋi ŋanṯa ṯa, eđa gǝnǝŋ aŋǝɽǝwađaṯe aŋǝmǝlëđi ŋen alo ŋërđia gǝlëɽǝŋu walla ŋen iŋi gëndu ŋǝ Rǝmwa ndǝ gonaṯa, na ŋen aŋerṯe ŋǝnǝŋ ŋǝmađǝrna ṯa gaɽwata ŋenŋa ŋǝlëɽǝŋu ŋǝ Rǝmwa đarrǝŋëiđiađa walla điđiaya ŋǝmeɽria, na đëbuŋǝṯiađa Rǝmwa gǝfo alǝsoŋ walla lǝfo ldǝɽo leđala lwaña, eđa aŋerṯe gǝnǝŋ gǝbënṯia eŋen ŋǝlëɽǝŋu.",
    "Leđa pređ ŋen ŋaŋen đeṯǝm ṯa eđa gǝnǝŋ aŋëbǝrëini alo ṯa aŋaŋëiđi ŋen iŋi gǝsadëinia eŋǝṯǝɽa ŋǝlëɽǝŋu na aŋǝyeɽwate; na ŋen iŋi ŋanṯa eđa aŋëndëci na aŋǝrmoṯwe ŋen ŋǝŋǝṯǝɽa ŋǝlëɽǝŋu eđa aŋerṯe gǝnǝŋ gǝmađǝrna walla gǝbënṯia eŋen ŋǝlëɽǝŋu, na ŋen ŋalëɽǝŋu ṯa aŋgakonde na aŋǝlaldǝŋeṯe ŋen ŋǝŋǝṯǝɽa ŋǝleđa lomǝn na ŋen ŋǝɽwëtëinia imiḏia ɽetǝɽeto na ṯa aŋǝyeɽwataṯe ekal pređ rǝɽiaŋ ralo rero rǝmëtriṯia.",
    "Ŋen ŋeđa gǝnǝŋ đeṯǝm ṯa aŋeɽǝbǝđe gero gǝtrinṯia eŋen ŋǝđǝrarraiđia nǝŋǝɽo đǝleđa đǝfo đëuṯaralǝđa, na ŋen iŋi ŋǝgakasaiđia leđa.Eđa gero gǝnǝŋ giđi aŋǝđǝrnëini eŋen ṯa aŋënṯi eɽo lǝnǝŋ eŋǝɽo ŋǝleđa ŋabǝɽaŋa.",
    "Leđa pređ ŋen ŋaŋen đeṯǝm ṯa aleɽǝbǝđe eŋǝlǝŋe ŋakǝmia irnuŋ egen, garno gënŋu đurri walla leđala ildi luṯǝnu ŋenŋa ŋëŋǝnǝṯu.Leđa pređ lerṯo ŋen ŋǝɽǝwaṯo đeṯǝm ṯa alërrǝnṯi iŋǝmëɽria iŋi ŋǝleđa pređ irnuŋ egen.Ŋen iŋi leđa lonaṯa đeṯǝm ŋen ŋarcađaṯo ṯa aŋǝɽeṯe iđuna yeŋǝlǝŋe ŋǝđakǝmia, na đonaṯa iđi ŋen ŋaŋǝra ṯa ađǝfeṯe ŋenŋa ŋǝđoṯa leđa iŋiga ŋǝlǝŋinu na ŋǝrcađaṯo, na ŋǝnaco leđa pređ liga lǝɽǝwaṯo ŋenŋanṯa aloṯe leđa ildi lǝlonaṯa đeṯǝmđa ŋamda ŋero. Na nabǝređa nǝđoṯa leđa anǝfeṯe ŋenŋa ŋǝwëcǝnu ŋenŋanṯa đoṯa leđa ađǝfeṯe ŋenŋa ŋǝđurwaṯu.",
    "Eđa gǝnǝŋ gǝfo eleđa lǝɽëwur, ŋen ŋalëɽǝŋu đeṯǝm ṯa aŋerṯe ŋen ŋǝmarmoṯwa igëwur yilëɽǝŋu  na aŋǝlǝŋini ṯa ŋen aŋǝmiđǝnṯi ŋǝmëɽriaŋa ŋǝleđa lirnuŋ đamǝđiađiađa đ-Irnuŋ Goɽra lǝbate nano na ŋen aŋǝfeṯe ŋenŋa ŋarno Irnuŋ Goɽra gakëɽëcu đwalađa đǝlëɽǝŋu garno rađ irri rǝbëncia đwala eŋen ŋǝđwala na đǝfia eŋǝɽo ŋǝleđa ŋërriaŋa eŋen iŋi ŋǝŋǝra ŋamǝđaṯa đamia đǝlëɽǝŋu na đëbǝrëinialo đǝmiñiađëcia ŋen nëñua ŋegaŋǝno yilëɽǝŋu.",
    "Leđa pređ ŋen ŋarcađaṯo ṯa aliđi ŋǝmëɽria, na ṯa eđa gǝnǝŋ aŋoṯe ŋǝmëɽria iŋi gonaṯo na ŋǝrcađaṯǝma nano ŋenŋa ŋǝđurwaṯu na ŋëŋǝnǝṯu. Na com ŋen ŋalëɽǝŋu đeṯǝm ṯa aŋǝbǝɽǝcǝniano iliga gero gǝfiđia ŋǝmëɽria. Leđa pređ ŋen ŋarcađaṯo ṯa alǝpǝɽǝni iŋǝmëɽria eŋen đwalađa đǝɽǝwaṯo đǝpëiđiano đero eŋen.Leđa pređ ildi lǝbǝđia ŋǝmëɽria, ŋen ŋaŋǝra ṯa alǝnëini đǝpǝɽa đǝŋǝra đǝrcađaṯo ŋǝmëɽria nano eŋen ṯa ađǝɽǝwađace eđa na leđa leɽa gǝlëɽǝŋu ŋenŋanṯa alǝɽǝwađaṯe lǝmǝṯia đǝmǝṯia đame đǝrcađaṯo, na com ṯa aŋëɽǝjinṯi egorb, ndǝ ŋen ŋǝfo ŋǝmaṯan ŋunëinia, ŋenŋanṯa eđa aŋǝfeṯe iđǝrmoṯwa eleđa lǝɽëwur.Leđa pređ ŋen ŋaŋǝra na ŋarcađaṯo ṯa alǝtuđi ŋǝɽo ŋǝŋǝmëɽria pređ eŋen ŋenŋanṯa ŋǝɽo ŋen iŋi aŋǝrmoṯwe ŋen eŋen ŋǝŋǝmëɽria.",
    "Leđa pređ ŋen ŋarcađaṯo ṯa alerṯe liga lǝđǝmiñǝniano, na ŋiga ŋǝpiano ŋero ŋǝmëɽriano. Na ṯa eđa aŋëndǝnṯi liga na sa yeɽǝwađaṯo ŋǝmëɽria nano na eđa aŋerṯe ñoman ñǝđǝmiñǝniano ñǝlǝŋinu na ñupǝɽǝđǝnia.",
    "Leđa pređ ŋen ŋarcađaṯo ṯa alǝfiđi ŋen ŋǝđǝmǝṯia đǝŋǝra đǝɽǝwađaco eđa gǝnǝŋ ṯa gënŋu na leđa leɽa gǝlëɽǝŋu alǝfiđi đǝŋǝra egaŋǝno na alǝfeṯe eđǝŋǝranano na alerṯe ŋǝsa, ndrenia, eɽa, na alǝfiđi ñakim na đǝbǝɽǝcǝniano ŋǝmëɽriaŋa pređ iŋi ŋamǝđaṯa ëwur. Na ndǝ eđa gǝnǝŋ gero gǝɽǝwađaṯia walla ndǝ gëyǝniau walla goɽra inṯǝlia walla ndǝ gero ŋen ŋǝmamǝđaṯa eđǝmǝṯia đǝlëɽǝŋu, ŋen ŋaŋǝra ṯa eđa gakǝl aŋǝbǝɽǝcǝniano aŋǝrmujǝni.Ŋen ŋaŋǝra đeṯǝm ṯa ñǝŋgenia na ñere ñǝlǝŋǝnu majǝn alǝfiđiṯi đǝbǝɽǝcǝniano đǝŋǝra. Na ñere pređ ñǝlǝŋǝnu ŋenŋa ŋǝđurwaṯu walla ñǝlǝŋǝnu alo, ŋen ŋarcađaṯota añǝfidi đǝbǝɽǝcǝniano đǝŋǝra na đamǝđaṯa ŋenŋa ŋǝɽǝwaṯo.",
    "Ŋen ŋaŋǝra đeṯǝm ṯa eđa gǝnǝŋ aŋǝfidi đëgria. Đëgria iđi đǝtwalalo đananoŋ ŋen ŋarcađaṯo ṯa đëgria ađerṯe đupǝɽǝđǝnia. Na đëgria đananoŋ iđi ađǝfeṯe ŋǝmaŋa eñere pređ. Na đëgria iđi đǝṯiknoloji na đǝŋoɽofa ŋǝŋǝmëɽria ɽetǝɽeto ađǝfeṯe đwaña alo. Na đëgria iđi đoɽra đǝjama ađǝfeṯe ŋenŋa ŋǝɽǝwaṯo ŋen ŋarno ŋǝlwa iŋi ñere ñǝbëgria ñarrǝpo.Ŋen ŋaŋǝra ṯa đëgria ađǝṯuɽëini ŋenŋa ŋǝđamǝđaṯa đǝborkwađaṯa nëñua đǝleđa entam enen na ṯa ađonḏǝce ŋen ŋǝđǝrmoṯwa ŋen ŋǝŋǝra ṯa aŋiđǝnṯi leđa ŋenŋa ŋǝđëbǝrëinialo eđen. Na ŋen ŋalëɽǝŋu com ṯa ađǝma đǝlǝŋeṯa, na đǝɽǝñaṯa ŋen na ŋǝlǝŋǝnia eleđa lalo pređ, garno đǝlǝŋe ɽetǝɽeto walla ŋǝɽo ŋërđia gǝ Rǝmwa, ṯa ŋǝmëɽria ŋǝ Leđa ildi Lǝrrëiđu ŋen  aŋǝɽalađaṯe nëñua eŋen ŋǝrmoṯwa đëuṯaralo.Apaŋǝnda lǝlǝŋo ñere ŋen ŋaŋǝra đeṯǝm ṯa aloṯe ŋen ŋǝđǝmǝca ñere eñen nađëgria iđi lënŋulu lonaṯa ṯa ñere añëgri.",
    "Leđa pređ ŋen ŋaŋǝra đeṯǝm ṯa eđa gǝnǝŋ naŋeɽǝbǝđe eŋen ŋǝŋërria ŋǝleđa lǝɽëwur , ṯa aŋǝreṯe nano ŋoɽofaŋa pređ na aŋeɽǝbǝđe eŋen ŋǝđǝborkwađaṯa nëñua eŋen ŋǝđǝlǝŋeṯa ɽetǝɽeto na eŋǝlwa ŋǝlëɽǝŋu. Leđa pređ ŋen ŋaŋǝra đeṯǝm ṯa eđa gǝnǝŋ aŋǝrmuđǝnṯi ŋen ŋara gǝlëɽǝŋu na ŋaŋǝno yilëɽǝŋo na ŋen iŋi aŋgace ṯa aŋela eŋǝlwa ŋakǝl iŋi eđa gǝmiñu eŋen ŋǝđǝlǝŋeṯa, ŋǝđëgria walla ŋǝŋoɽofa.",
    "Ŋen ŋaŋǝra ṯa leđa pređ alǝfiđi ŋen iŋi ŋǝṯoɽaṯa ëwur yeleđa lirnuŋ na lǝbate nano ŋenŋanṯa eđa gǝnǝŋ aŋǝɽǝwađaṯe gǝfiđia ŋen pređ iŋi ŋǝŋǝra ṯa leđa alerṯe na ŋen ŋǝđëbǝrëinial pređ iŋi ŋǝwërđëinu eŋen ŋǝ Đǝlwaɽa Pǝlelo Đalo iđi aŋǝɽiñađëini ŋopia.",
    "Leđa pređ lerṯo ŋǝmëɽria igëwur esen iŋi ŋǝŋgiṯia eđa gǝnǝŋ goɽǝwađaṯia gufiđia liga lǝŋǝra ṯa aŋǝburkwëđëci etam nëñua gǝlëɽǝŋu ŋen ŋero ŋǝnǝŋ ŋǝđǝrnaiđǝma.Iliga eđa gǝnǝŋ gǝtođa ŋǝmëɽriaŋa ŋǝlëɽǝŋu ŋenŋa iŋi ŋǝrcađaṯo ṯa aŋerṯe eŋen ŋǝđëbǝrëinialo đǝlëɽǝŋu, ŋen ŋaŋǝra ṯa leđa pređ alǝkasëiđǝni ŋenŋa iŋi ŋǝfo igalganun ikǝrǝŋ, ŋenŋanṯa ŋen aŋëŋǝnǝṯi na aŋǝrmujǝni iŋi ŋǝŋǝra ṯa leđa alerṯe lomǝn, na đëbǝrëinialo eđen, ṯa ŋen aŋǝɽǝñađaiđe iŋi ŋǝmama ŋen ŋǝđurwaṯu eŋen iŋi ŋǝṯoɽaṯa leđa pređ na eŋen iŋi leđa pređ lonaṯa ṯa aŋǝfeṯe igëwur yeleđa yeɽo ḏimugraṯi.Ŋen ŋero ŋǝfia ŋopia ṯa ŋen iŋi ŋǝŋǝra ṯa leđa alerṯe na đëbǝrëinialo eđen alǝfeṯe ŋenŋa ŋǝmǝlađo eŋen iŋi Leđa ildi Lǝrrëiđu ŋen lëkëɽu ŋǝɽo iđuna.",
    "Ŋen pređ iŋi ŋǝwërđëinu e-Đǝlwaɽa Pǝlelo Đalo iđi aŋerṯe ŋiđi aŋǝmǝlëđini alo ṯa aŋiđi ŋen ŋamǝđaṯa Irnuŋ Goɽra gǝnǝŋ, eđa gǝnǝŋ walla leđa eŋǝɽo alerṯe lǝbǝrṯa ŋǝlǝŋe ṯa alǝtođe ŋenŋa ŋǝnǝŋ walla ŋǝmëɽriaŋa ŋǝnǝŋ ŋenŋanṯa alǝkere ŋen ŋǝnǝŋ iŋi ŋǝwërđëinu e-Đǝlwaɽa Pǝlelo Đalo iđi eŋen iŋi ŋǝrcađaṯo ṯa leđa alerṯe na đëbǝrëinialo eđen.",
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
