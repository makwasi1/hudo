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
    "Aris ꞌkwaninyꞌceshi ꞌbaar mo dhoꞌthkunu ꞌbaḵany mo dhali mmomiiya ṯuꞌc imonṯal ꞌde/ mo dhali mii ma ḵar/e mo. Uni mini ta gi gwo mo dhali mii mo dhali uni mini mii ka karambuye/ ꞌkup̱ ki cin tiya mo e shi/in mo dhali mii kun tanu ikam mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ yuḵunu mo e mii ma isiŋ gana/ mo dhali gwo jin ṯorkunu mo gom moŋꞌko jin ꞌkonu ki ꞌkus mo, ki dar gi mo jin ꞌkonu ka ḵwa/um bwa ki she/ ki she/ mo, hili ka Awaḵ mo, jamas, wathiŋ gwaṯẖ dhali aꞌbom mo, ꞌtwa/ mo, mmoluŋa luŋ mo, imanmii gwo aꞌcesh mo walla gwon tiya mo wathi/ jin cila bampa/ mo walla amannyaḵ to mii mo, dhali mal mo, dhali mondhoꞌth mo. Hili, aḵwa/um bwa minu ꞌkoki mii mo e ꞌkwani kun mii gwo aꞌcesh mo, dhali  mmomii to ka p̱ara p̱o/ mo meꞌd jin dhala gwoŋḵan aꞌdi bway mo walla eya ris kal gi ꞌkwaninyꞌcesh mo e bampa/ mo walla e ꞌpeŋkuman bampa/ mo aꞌdi jin ta ji gi wathi/ mo, walla aꞌdi diꞌd ki ꞌpen piti mo, mii ma ḵar/e mo, diki ji is piti aꞌdi ꞌde/ mo walla e ꞌbameꞌdi kun tiya kun ta gi moshirr kun jikina ji mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ mini ꞌko ꞌbaḵany e moŋꞌkoki/e mo, mmokwanya kwany mo dhali wathi/ midi c̱aꞌbki ꞌdantar mo.",
    "Wathin ṯal ꞌdeŋ kamu/ minu ꞌkoki mii ki miiny c̱iŋkina/ mo walla ka jinthus mo, miiny c̱iŋkina/ mo dhali mii jin yolkunu c̱iŋkina/ minu non ꞌtwa/ mo eya aris jamas gi miim buni ki she/ ki she/ mo.",
    "Wathin ṯal ꞌdeŋ kamu/ minu ꞌkoki ꞌkosh mo walla miinu ꞌkoki jee mo, wathi/ minu ꞌkoki mii ka jinthus mo walla minu ꞌkoki sirija ap̱o/ gi shoꞌk mo walla minu ꞌkoki dor mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ minu dhu ki montaḵ ki ꞌtwaŋḵal kuku/ mo meꞌd wathi/ jin dikiꞌd e buŋꞌkus gi gwoŋḵan mo.",
    "Aris uni ꞌbaar mo inyaḵkan imonṯal ꞌde/ mbwambor gi gwoŋḵan mo dhali uni yuḵunu mo ki dargi mii ma gwarꞌde/ mo e mo jin miinu cesh uni ka p̱o/  imonṯal ꞌde/ gi gwoŋḵan mo. Aris uni ꞌbaar mo yuḵunu imonṯal ꞌde/ mo e mo jin ceshuwa cesh ka p̱o/ mo ꞌpeni mii kun miinu mii ma gwarꞌde/ mo mmoꞌceꞌd gwoŋḵan yansan jin ṯorkunu mo dhali ap̱o/  mii kun yuḵunu mo e mii kun ꞌkoshuwa mee mo hili e mii ma gwarꞌde/ mo.",
    "Aris uni ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ mo tani, tan gi tom buni mo kun wanuwa wan ꞌba/ mo eya awaḵ gi kal gi ꞌkwaninyꞌcesh mo gom mii jin ꞌceꞌdu gwoŋḵan mo gom mii ma isiŋ gana/ mo jin gamkina aꞌdi mo e gwoŋḵan jin yeꞌthkunu aꞌdi shoꞌk mo walla gi gwoŋḵan mo.",
    "Wathin ṯal ꞌdeŋ kamu/ minu ꞌkoki buꞌth mo mmota habus mo, walla aꞌdi minu diki ur mo bway bampaŋ kamu/ mo.",
    "Aris uni ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ yuḵunu mo e mii ma p̱ara p̱o/ mo dhali ꞌkwani kun ciḵki gwo mo gom mo jin ꞌkonu ki ꞌpen buni mo, dhali e bwaman ma Awaḵ mo, e mo jin ṯoru mii ma ḵar/em piti mo dhali mo miiya ṯuꞌc mo dhali imanꞌkosha mee kun miiki mii ap̱o/i aꞌdi mo.",
    "Aris uni ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ miikina ṯuꞌc gom mondor ki mii kun ꞌthenu is mo aꞌdi taꞌd gi gwo mmo/o mo aꞌdi jin dargi mii mꞌba/ ntagi miinthus piti thimkiꞌd mo isi ki gwoŋḵan ma wambuhany ꞌkwani gi mompal mo e aꞌdi jin tana aꞌdi iꞌbaar mo dhali aris gwo jin ona aꞌdi is mo gom mo jin jeṯṯa aꞌdi shoꞌka ꞌcesh mo. Wathin ṯal ꞌdeŋ kamu/ minu diki kar miinthusa kamu/ jin midi ꞌkosh aꞌdi is ka nyor mo gom tonthus mo, e bwaŋꞌkwariny gi kal gi ꞌkwaninyꞌcesh mo walla gwoŋḵan gi kal gi ꞌkwaninyꞌcesh mo, ka tee c̱aan mo ki aꞌdi miiki tonthus mo. Walla aꞌdi karkunu ton diṯiꞌd e ꞌbam piti jin burjurkunu aꞌdi ki mondor mo mmobol aꞌdin ꞌde/ e mo jin miiki to mo ka tee jin dorkunu aꞌdi mo gom tonthus jin miikina aꞌdi mo.",
    "Wathin ṯal ꞌde/ kamu/ minu ꞌkoki mii ki miiny c̱iŋkina/ mo ki mii jin minu thul tom piti meꞌda p̱o/ mo ki tom piti jin tana aꞌdi mo, Awaḵ piti mo, e kuŋ guꞌb piti mo walla ton tiya gunn kun cila aꞌdi mo, walla mmoꞌkosh montaḵ piti mo, dhali yer gway mo. Aris ꞌkwani ꞌbaar mo uni tan gi gwoŋḵan mo mmocesh tom buni kun tana uni ka p̱o/ mo walla jin ꞌkoshkunu mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ uni dhala gwonḵan bway mo mmo/ii ki ꞌkus mo dhali mmo/ii bampa/ gi moŋꞌkoꞌd gwar gi gwayu/ gi bampa/ iꞌbaar mo.",
    // "Aris ꞌkwani ꞌbaar ka ꞌdeṯe/ ꞌdeṯe/ uni mini dhal bampaŋ kamu/ ꞌpen mo meꞌd bwam buni mo dhali nyaḵki bampam buni mo dhali ki aꞌdi midi doḵ ka nyaŋꞌkoꞌd bway bampam piti mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ uni mini ŋap̱ bway mo dhali ꞌkuny bwa mo mmodi mo e bampan tiya kunꞌkona ꞌkwani kun urkunu mo ꞌpeni bampam buni mo ꞌpeni monṯoꞌc bwa mo.",
    "Aꞌdi ta gwoŋ gana/ aꞌdan jin minu ꞌkoki yuḵ um mo e mii jin ṯojuwa ṯoꞌc ꞌkus ꞌpeni gwo ma isiŋ gana/ mo jin cuki mis mo ꞌpeni ꞌkwani kun ꞌkoki ta imanmii gwo aꞌcesh mo kun ꞌkoki ta imanmii tonthus mo walla ꞌpeni mii jin uru gwo mo gom mii mo dhali gwoŋḵan gi ꞌkwaninyꞌcesh kun nyaḵki to mii mo.",
    // "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ dhala gwoŋḵan gi bampam piti aꞌdi bway mo mmota com bampa/ mo.",
    // "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ dhala gwoŋḵan gi bampam piti aꞌdi bway mo mmota com bampa/ mo. .Wathin ṯal ꞌdeŋ kamu/ minu ꞌkoki nonꞌtwa/ mo ꞌpeni miim buyem bampam piti mo walla minu ꞌkoki non ꞌtwa/ mo mmo/aḵ miim buyem bampam piti e mo.",
    "ꞌKwaniŋ gwaṯẖ dhali aris up̱ kun cakin ki yil mo, uni minu ꞌkoki cesh mo mo gom awaḵ buni mo walla gom miim buyem bampam buni mo walla gom mo luŋ buni mo. Uni dhala gwoŋḵan bway mo mmomash mo ki uni mini gam uci mo. Uni yuḵunu mo imonṯal ꞌde/ mo isi ki mii ma ḵar/e mo gom mii mash mo, ki embul gi mii mash mo dhali ki mom piti jin karkunu ꞌkup̱ mo. Miimash minu thim ki gwoŋ ꞌkwanin su/ mo dhali gam gwo meꞌd ki ꞌbore/ mo jin thosonkina uni is mo mmoṯalꞌde/ mo. Awaḵ aꞌdi taꞌda ꞌkaŋꞌkup̱ mo dhali moŋḵaꞌb jin deḵu imonṯal ꞌde/ mo e kuŋꞌkup̱ piti mo dhali aꞌdi yuḵunu mo ki aꞌdi mina ꞌkwani cesh ka p̱o/ mo dhali ki bampam piti mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ uni tan gi embul mo mmota ki to gom is piti mo ki ꞌbore/ mo, meꞌd isi ciki/ mo mmonyaḵ to mii inyaḵki ꞌkwanin tiya mo.Wathin ṯal ꞌdeŋ kamu/ minu ꞌkoki non ꞌtwa/ ꞌpeni tom piti jin tana aꞌdi jin ishiꞌd ka enthus mo.",
    "Aris ꞌkwani ꞌbaar mo mini ꞌko ki ꞌkom ꞌpempaŋ gana/ ꞌbaḵany e bwaŋ kulum buni mo, eya dum buni mo dhali e moŋluŋ buni mo, aꞌdi ta mo jin ꞌkonu ki ꞌkus mo mmo/aḵ mo jin luŋuwa luŋ e mo walla moŋgam gwo is mo, dhali di ki ꞌkus mo, walla aꞌdi midi di aꞌdi ꞌde/ mo, walla di mo e bwaman ma Awaḵa tiya mo dhali di e bwamani ꞌkwani mo walla di aꞌdi  ꞌde/ mo, dhali ṯor moŋluŋ piti mo walla ṯor moŋgam gwo is piti mo, dhali aꞌdi midi miiya ṯuꞌc mo, mmoluŋa luŋ mo dhali mmohila hil ka ꞌthime mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ mo uni tan gi embul mo mmo/o gwo jin diꞌd e bwam buni mo dhali mmoṯor mii eya tente/ mo, aꞌdi ta mo jin ꞌkonu ki ꞌkus jin midi buꞌth mo mo gom gwoŋ kulum mo ki dargi mo jin ceshu mo mo dhali simm aꞌdi e mo, mmobuꞌth mo dhali da/ar gwo jin ṯoru mo dhali gwo kun c̱inu mo e to jin ṯorkunuwa ṯor nycine/ mo dhali dargi mo jin aḵu gwayu/ e mo.",
    "Aris uni ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ dhalu bway mo mmoꞌko ki ꞌkus mo e moŋḵuꞌth is mo gi montul is mo dhali e mo jin tula ꞌkwani ꞌkup̱ mo. Wathin ṯal ꞌdeŋ kamu/ minu ꞌkoki non ꞌtwa/ mo ꞌpeni montul is jin tulu ka ŋulꞌkup mo.",
    "Aris uni ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ mo dhala gwoŋḵan bway mo mmonyaḵa ṯuꞌc mii eya hakuma gi bampam piti mo, ka ji shoꞌk mo walla gom wathi/ jin kwanykunu ꞌbaḵany mo e bwambori uni mo. Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ mo dhala gwoŋḵan bway mo mmonyaḵ ṯuꞌc mii mo inyaḵki ꞌkwani gi bampam piti mo.Dhali ꞌkwani mini mii mo meꞌd bwa gi ꞌkwani kun ta gi moshirr kun miikina ṯuꞌc ma hakuma mo, aꞌdi ta mii jin minu mii ki  ari momo dhali aris ꞌkwani gi monyꞌcesh mini kwany to jin mina uni taḵ toŋ ḵar/e mo dhali uni mini taḵ to imonṯal ꞌde/ mo dhali mini buꞌth to kun tagu ka ḵwal is mo walla to jin tagu ka p̱ara p̱o/  mo e mo jin taḵunu uni mo",
    // "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ uni tan gi moshirr mo mmosi/is mo dhali mmomalasa malas mo, inyaḵka usha ṯuꞌca gwaꞌdga/ jin miikina aꞌdi mo dhali ka tee jin sinu is mo jin c̱ikunu to mo."
    "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ mini ta gi embul mo mmoꞌkoki/e mo gom is piti ki ꞌbore/ mo dhali mmokar buŋgwar is piti ki dhelel dhelel mo dhali Awaḵ piti mo, inyaḵki tonṯe/ mo dhali burrinye/ jin hiꞌthu i is mo dhali guꞌb mo dhali thosona guruush goma dhawa/ mo dhali miiya ṯuꞌc ka ŋulꞌkup̱ mo, dhali c̱aꞌbki ꞌdantar e to kun p̱̱uꞌdkin mo e uni kun darga ṯuꞌc mo, uni kun ꞌbaꞌthan mo dhali ꞌkwani kun aṯẖa is mo dhali aꞌbom jin wun ma kaṯẖim piti  mo dhali kun cakin ki yil mo walla aꞌdi jin gamki  monyc̱aꞌb piti mo e mii kun tuḵ ꞌban mo kun jiki aꞌdi mo. Ataꞌda mo dhali ushi uc̱i mo uni yuḵunu mo mmodhip̱ ki ꞌbore/ mo dhali woṯẖa woṯẖ mo. Aris ushi uc̱i iꞌbaar mo kun dhoꞌthkunu mo e bwaman gi miimash mo walla ka pije/ gi miimash mo, uni mina bwa ꞌkuny inyaḵki ꞌkwani kun ceshkunu ka p̱o/ mo.",
    "Aris uni ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ mo, isi meꞌd jin tana uni imannyaḵa ṯuꞌc mii mo, uni tan gi moshirr mo mmoꞌko ꞌbaḵany ki ꞌdantar mo dhali uni yuḵunu mo e mo jin minu ka uni e mo, e mii gi bampam buni mo dhali mii gi ꞌpeŋkuman bampan tiya mo dhali inyaḵki isi mii gi ꞌkwani kun miikina ṯuꞌc kun woṯẖkina woṯẖ mo dhali goma aris tom buni kun ish ḵumma/ mo, to kun miinu meꞌd ka woho/ mo, mo kun nyaḵku to mii mo dhali gom mii kun miinu mo kun cilkina aꞌdi mo dhali mii jin nyaŋkina buŋgwar is gi wathimpa enꞌthi/ mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ uni dhala gwoŋḵan bway mo mmomiiya ṯuꞌc ꞌbaḵany mo, dhali jin minu kwany uni mo mmomiiya ṯuꞌc mo, dhali isi ki mo miimii ma isiŋ gana/ mo dhali mmogama ꞌthe eya ṯuꞌc jin miikina uni mo, dhali cesh uni gwansan ka p̱o/ uni kun ꞌkokin mo ki darga ṯuꞌc mo.Aris uni ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/, kun dargi mii ma gwarꞌde/ mo, uni ꞌkon ki ꞌkus mo mmoc̱i to imonṯal ꞌde/ mo goma ṯuꞌc jin miikunu ka p̱ara p̱o/ mo.Aris uni ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ kun miikina ṯuꞌc mo uni ꞌkon ki ꞌkus mo mmomii mii ma isiŋ gana/ mo dhali gam to jin minu c̱i ki ꞌbore/ gom is buni mo ki ꞌdantar mo dhali goma Awaḵ buni kun ꞌkokin kun taḵa ꞌkwaninyꞌcesh goma ṯuꞌc mo, dhali mar tom buni is mo, waḵki/ aꞌdi mishu mii mo ki ꞌkwanin tiya kun ceshki mo ka p̱o/ kun ꞌkokin ka ŋulꞌkup̱ mo.Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ uni tan gi embul mo mmo/uḵ to mo dhali ki aꞌdi minu c̱iꞌth ka warka/ mo gom to jin mina aꞌdi yol mo gom bwam piti jin o aꞌdi ki ḵal to iyol mo",
    // "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ uni tan gi moshirr mo mmosi/is mo dhali mmomalasa malas mo, inyaḵka usha ṯuꞌca gwaꞌdga/ jin miikina aꞌdi mo dhali ka tee jin sinu is mo jin c̱ikunu to mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ mini ta gi embul mo mmoꞌkoki/e mo gom is piti ki ꞌbore/ mo dhali mmokar buŋgwar is piti ki dhelel dhelel mo dhali Awaḵ piti mo, inyaḵki tonṯe/ mo dhali burrinye/ jin hiꞌthu i is mo dhali guꞌb mo dhali thosona guruush goma dhawa/ mo dhali miiya ṯuꞌc ka ŋulꞌkup̱ mo, dhali c̱aꞌbki ꞌdantar e to kun p̱̱uꞌdkin mo e uni kun darga ṯuꞌc mo, uni kun ꞌbaꞌthan mo dhali ꞌkwani kun aṯẖa is mo dhali aꞌbom jin wun ma kaṯẖim piti  mo dhali kun cakin ki yil mo walla aꞌdi jin gamki  monyc̱aꞌb piti mo e mii kun tuḵ ꞌban mo kun jiki aꞌdi mo.Ataꞌda mo dhali ushi uc̱i mo uni yuḵunu mo mmodhip̱ ki ꞌbore/ mo dhali woṯẖa woṯẖ mo. Aris ushi uc̱i iꞌbaar mo kun dhoꞌthkunu mo e bwaman gi miimash mo walla ka pije/ gi miimash mo, uni mina bwa ꞌkuny inyaḵki ꞌkwani kun ceshkunu ka p̱o/ mo.",
    "Aris uni ꞌbaar mo ka  ꞌdeṯe/ ꞌdeṯe/  uni dhala gwoŋḵan bway mo mmomiiya awarka/ mo. Mo ma warka/ miinu mii ki meꞌd mo, isi ciki/ ki monṯel ꞌpen gi Mo ma warka/ jin minu mii mo. Mmo/uḵ to mo dhali mo ma warka/ minu nyaŋ ki ꞌbore/ mo dhali Mo ma warka/ jin miinu e guꞌba caaga/ imonṯal ꞌde/ mo e moŋḵaꞌb jin minu mii miim ꞌboroꞌd mo.Mo a warka/ minu mii ṯor gi ꞌkwaninyꞌcesh mo mmothim mo dhali ꞌbiꞌth ꞌkwani is mo mmodhu is ki gwaꞌd mo mmotaḵ ꞌkwani kun miikina ṯuꞌc mo mmoc̱i ꞌkwani bway mo e gwoŋ ḵar/e mo dhali mmoc̱i mo jin ꞌkonu ki ꞌkus mo. Aꞌdi midi hal ꞌkwani mo jin mishu gwo ꞌban mo, mmoḵuꞌc bwa ki ꞌkariꞌth mo dhali mmota mugu gi kal gi ꞌkwani gi monyꞌcesh mo, walla aŋulꞌkup̱ mo walla ꞌkwani kun luŋkina luŋ mo, dhali mii ki nyanye/ mo e ꞌkwani gi monyꞌcesh mo uni kun miiki moŋḵuꞌth is mo.Ibaba dhali itaꞌda uni tan gi embul mo mmokwany Mo ma warka/ jinꞌboroꞌd mo jin mina uni dhu uc̱im buni nycine/ mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ uni ꞌkokin ki ꞌkus mo mmomii miim buni mo e bwaman ma Awaḵ mo, dhali loꞌb mo mmoꞌkuny bwa mo dhali mii mondheleleꞌd bway ṯwa/a mo dhali mii miim ꞌboron buni mo.Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ mini tiḵ miim buni e jin midi wu mo dhali aris ton tiya kun ena uni kun dhelelin mo, awarka/ mo walla to kun uḵu mo e aꞌdi jin taꞌda amanꞌkwar to mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ uni yuḵunu mo dhali aris ꞌkwaninyꞌcesh kun thoson ki to mo e mii ma isiŋ gana/ mo dhali ꞌko ki ꞌkus mo e mo jin ṯorkunu gwo mo jin ṯoru gwo eya tente/ mo.",
    "Aris ꞌkwani iꞌbaar mo ka ꞌdeṯe/ ꞌdeṯe/ uni tan ga ṯuꞌc e ꞌkwani mo e mo jin mina aꞌdi di aꞌdi ꞌde/ ki ꞌkus mo dhali jin mina aꞌdi misha aṯuꞌc piti mii mo mmomar aꞌdi is mo.E mii ma isiŋ ganam piti mo dhali di ki ꞌkus mo, aris uni ꞌbaar mo ka ꞌdeṯe/ ka ꞌdeṯe/ minu ꞌkoki mii ki miiny c̱iŋkina/  mo jin minu jiya ji jasi ꞌte/ mo meꞌd jin ṯorkunu gwo ki gwoŋḵan gom wathin ṯal ꞌdeŋ kamu/ mo gom mii kun ꞌkonu ki ꞌdantar mo ki mii jin minu pi gwo mo dhali dhu is ki gwaꞌd mo gom mii ma isiŋ gana/ mo dhali ꞌko ki ꞌkus inyaḵki kun tiya mo dhali montul is jin doṯu gwo gom miim ꞌboroꞌd mo, mmothoson ꞌkwani mo dhali mmoḵal ꞌkup̱ŋwa/ pa mo mmomii ka p̱ara p̱o/ mo.Mii ma isiŋ gana/ yansan mo minu ꞌkoki mii mo gom jasi aꞌdi mo, dhali gom ꞌkup̱ gwo gi ꞌkwani gi monyꞌcesh mo.",
    "Toŋkamu/ yisa diꞌda jin minu ꞌkoki ṯor mo mmoꞌkoki ṯor ꞌpemen eya tente/ goma ris bampan tiya mo, ꞌkwani kun ꞌkon ka non she/ mo walla wathin ꞌdeŋ kamu/ jin ona bwa ki miiya ṯuꞌca tiya mo walla aꞌdi jin ona bwa ki uḵ ton tiya mo mmoꞌceꞌda ꞌceꞌd shoꞌk mo e ton tiya jin ona bwa aꞌdi mo dhali c̱aꞌb ꞌbaḵany e mondim piti mo."
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
