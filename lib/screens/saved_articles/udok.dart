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
    "Aris ꞌkwaninyꞌceshi ꞌbaar mo dhoꞌthkunu ꞌba\u1E35any mo dhali mmomiiya \u1E6Fuꞌc imon\u1E6Fal ꞌde/ mo dhali mii ma \u1E35ar/e mo. Uni mini ta gi gwo mo dhali mii mo dhali uni mini mii ka karambuye/ ꞌkup̱ ki cin tiya mo e shi/in mo dhali mii kun tanu ikam mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ yu\u1E35unu mo e mii ma isiŋ gana/ mo dhali gwo jin \u1E6Forkunu mo gom moŋꞌko jin ꞌkonu ki ꞌkus mo, ki dar gi mo jin ꞌkonu ka \u1E35wa/um bwa ki she/ ki she/ mo, hili ka Awa\u1E35 mo, jamas, wathiŋ gwa\u1E6Fẖ dhali aꞌbom mo, ꞌtwa/ mo, mmoluŋa luŋ mo, imanmii gwo aꞌcesh mo walla gwon tiya mo wathi/ jin cila bampa/ mo walla amannya\u1E35 to mii mo, dhali mal mo, dhali mondhoꞌth mo. Hili, a\u1E35wa/um bwa minu ꞌkoki mii mo e ꞌkwani kun mii gwo aꞌcesh mo, dhali  mmomii to ka p̱ara p̱o/ mo meꞌd jin dhala gwoŋ\u1E35an aꞌdi bway mo walla eya ris kal gi ꞌkwaninyꞌcesh mo e bampa/ mo walla e ꞌpeŋkuman bampa/ mo aꞌdi jin ta ji gi wathi/ mo, walla aꞌdi diꞌd ki ꞌpen piti mo, mii ma \u1E35ar/e mo, diki ji is piti aꞌdi ꞌde/ mo walla e ꞌbameꞌdi kun tiya kun ta gi moshirr kun jikina ji mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ mini ꞌko ꞌba\u1E35any e moŋꞌkoki/e mo, mmokwanya kwany mo dhali wathi/ midi c̱aꞌbki ꞌdantar mo.",
    "Wathin \u1E6Fal ꞌdeŋ kamu/ minu ꞌkoki mii ki miiny c̱iŋkina/ mo walla ka jinthus mo, miiny c̱iŋkina/ mo dhali mii jin yolkunu c̱iŋkina/ minu non ꞌtwa/ mo eya aris jamas gi miim buni ki she/ ki she/ mo.",
    "Wathin \u1E6Fal ꞌdeŋ kamu/ minu ꞌkoki ꞌkosh mo walla miinu ꞌkoki jee mo, wathi/ minu ꞌkoki mii ka jinthus mo walla minu ꞌkoki sirija ap̱o/ gi shoꞌk mo walla minu ꞌkoki dor mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ minu dhu ki monta\u1E35 ki ꞌtwaŋ\u1E35al kuku/ mo meꞌd wathi/ jin dikiꞌd e buŋꞌkus gi gwoŋ\u1E35an mo.",
    "Aris uni ꞌbaar mo inya\u1E35kan imon\u1E6Fal ꞌde/ mbwambor gi gwoŋ\u1E35an mo dhali uni yu\u1E35unu mo ki dargi mii ma gwarꞌde/ mo e mo jin miinu cesh uni ka p̱o/  imon\u1E6Fal ꞌde/ gi gwoŋ\u1E35an mo. Aris uni ꞌbaar mo yu\u1E35unu imon\u1E6Fal ꞌde/ mo e mo jin ceshuwa cesh ka p̱o/ mo ꞌpeni mii kun miinu mii ma gwarꞌde/ mo mmoꞌceꞌd gwoŋ\u1E35an yansan jin \u1E6Forkunu mo dhali ap̱o/  mii kun yu\u1E35unu mo e mii kun ꞌkoshuwa mee mo hili e mii ma gwarꞌde/ mo.",
    "Aris uni ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ mo tani, tan gi tom buni mo kun wanuwa wan ꞌba/ mo eya awa\u1E35 gi kal gi ꞌkwaninyꞌcesh mo gom mii jin ꞌceꞌdu gwoŋ\u1E35an mo gom mii ma isiŋ gana/ mo jin gamkina aꞌdi mo e gwoŋ\u1E35an jin yeꞌthkunu aꞌdi shoꞌk mo walla gi gwoŋ\u1E35an mo.",
    "Wathin \u1E6Fal ꞌdeŋ kamu/ minu ꞌkoki buꞌth mo mmota habus mo, walla aꞌdi minu diki ur mo bway bampaŋ kamu/ mo.",
    "Aris uni ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ yu\u1E35unu mo e mii ma p̱ara p̱o/ mo dhali ꞌkwani kun ci\u1E35ki gwo mo gom mo jin ꞌkonu ki ꞌpen buni mo, dhali e bwaman ma Awa\u1E35 mo, e mo jin \u1E6Foru mii ma \u1E35ar/em piti mo dhali mo miiya \u1E6Fuꞌc mo dhali imanꞌkosha mee kun miiki mii ap̱o/i aꞌdi mo.",
    "Aris uni ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ miikina \u1E6Fuꞌc gom mondor ki mii kun ꞌthenu is mo aꞌdi taꞌd gi gwo mmo/o mo aꞌdi jin dargi mii mꞌba/ ntagi miinthus piti thimkiꞌd mo isi ki gwoŋ\u1E35an ma wambuhany ꞌkwani gi mompal mo e aꞌdi jin tana aꞌdi iꞌbaar mo dhali aris gwo jin ona aꞌdi is mo gom mo jin je\u1E6Fa aꞌdi shoꞌka ꞌcesh mo. Wathin \u1E6Fal ꞌdeŋ kamu/ minu diki kar miinthusa kamu/ jin midi ꞌkosh aꞌdi is ka nyor mo gom tonthus mo, e bwaŋꞌkwariny gi kal gi ꞌkwaninyꞌcesh mo walla gwoŋ\u1E35an gi kal gi ꞌkwaninyꞌcesh mo, ka tee c̱aan mo ki aꞌdi miiki tonthus mo. Walla aꞌdi karkunu ton di\u1E6Fiꞌd e ꞌbam piti jin burjurkunu aꞌdi ki mondor mo mmobol aꞌdin ꞌde/ e mo jin miiki to mo ka tee jin dorkunu aꞌdi mo gom tonthus jin miikina aꞌdi mo.",
    "Wathin \u1E6Fal ꞌde/ kamu/ minu ꞌkoki mii ki miiny c̱iŋkina/ mo ki mii jin minu thul tom piti meꞌda p̱o/ mo ki tom piti jin tana aꞌdi mo, Awa\u1E35 piti mo, e kuŋ guꞌb piti mo walla ton tiya gunn kun cila aꞌdi mo, walla mmoꞌkosh monta\u1E35 piti mo, dhali yer gway mo. Aris ꞌkwani ꞌbaar mo uni tan gi gwoŋ\u1E35an mo mmocesh tom buni kun tana uni ka p̱o/ mo walla jin ꞌkoshkunu mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ uni dhala gwon\u1E35an bway mo mmo/ii ki ꞌkus mo dhali mmo/ii bampa/ gi moŋꞌkoꞌd gwar gi gwayu/ gi bampa/ iꞌbaar mo.",
    // "Aris ꞌkwani ꞌbaar ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ uni mini dhal bampaŋ kamu/ ꞌpen mo meꞌd bwam buni mo dhali nya\u1E35ki bampam buni mo dhali ki aꞌdi midi do\u1E35 ka nyaŋꞌkoꞌd bway bampam piti mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ uni mini ŋap̱ bway mo dhali ꞌkuny bwa mo mmodi mo e bampan tiya kunꞌkona ꞌkwani kun urkunu mo ꞌpeni bampam buni mo ꞌpeni mon\u1E6Foꞌc bwa mo.",
    "Aꞌdi ta gwoŋ gana/ aꞌdan jin minu ꞌkoki yu\u1E35 um mo e mii jin \u1E6Fojuwa \u1E6Foꞌc ꞌkus ꞌpeni gwo ma isiŋ gana/ mo jin cuki mis mo ꞌpeni ꞌkwani kun ꞌkoki ta imanmii gwo aꞌcesh mo kun ꞌkoki ta imanmii tonthus mo walla ꞌpeni mii jin uru gwo mo gom mii mo dhali gwoŋ\u1E35an gi ꞌkwaninyꞌcesh kun nya\u1E35ki to mii mo.",
    // "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ dhala gwoŋ\u1E35an gi bampam piti aꞌdi bway mo mmota com bampa/ mo.",
    // "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ dhala gwoŋ\u1E35an gi bampam piti aꞌdi bway mo mmota com bampa/ mo. .Wathin \u1E6Fal ꞌdeŋ kamu/ minu ꞌkoki nonꞌtwa/ mo ꞌpeni miim buyem bampam piti mo walla minu ꞌkoki non ꞌtwa/ mo mmo/a\u1E35 miim buyem bampam piti e mo.",
    "ꞌKwaniŋ gwa\u1E6Fẖ dhali aris up̱ kun cakin ki yil mo, uni minu ꞌkoki cesh mo mo gom awa\u1E35 buni mo walla gom miim buyem bampam buni mo walla gom mo luŋ buni mo. Uni dhala gwoŋ\u1E35an bway mo mmomash mo ki uni mini gam uci mo. Uni yu\u1E35unu mo imon\u1E6Fal ꞌde/ mo isi ki mii ma \u1E35ar/e mo gom mii mash mo, ki embul gi mii mash mo dhali ki mom piti jin karkunu ꞌkup̱ mo. Miimash minu thim ki gwoŋ ꞌkwanin su/ mo dhali gam gwo meꞌd ki ꞌbore/ mo jin thosonkina uni is mo mmo\u1E6Falꞌde/ mo. Awa\u1E35 aꞌdi taꞌda ꞌkaŋꞌkup̱ mo dhali moŋ\u1E35aꞌb jin de\u1E35u imon\u1E6Fal ꞌde/ mo e kuŋꞌkup̱ piti mo dhali aꞌdi yu\u1E35unu mo ki aꞌdi mina ꞌkwani cesh ka p̱o/ mo dhali ki bampam piti mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ uni tan gi embul mo mmota ki to gom is piti mo ki ꞌbore/ mo, meꞌd isi ciki/ mo mmonya\u1E35 to mii inya\u1E35ki ꞌkwanin tiya mo.Wathin \u1E6Fal ꞌdeŋ kamu/ minu ꞌkoki non ꞌtwa/ ꞌpeni tom piti jin tana aꞌdi jin ishiꞌd ka enthus mo.",
    "Aris ꞌkwani ꞌbaar mo mini ꞌko ki ꞌkom ꞌpempaŋ gana/ ꞌba\u1E35any e bwaŋ kulum buni mo, eya dum buni mo dhali e moŋluŋ buni mo, aꞌdi ta mo jin ꞌkonu ki ꞌkus mo mmo/a\u1E35 mo jin luŋuwa luŋ e mo walla moŋgam gwo is mo, dhali di ki ꞌkus mo, walla aꞌdi midi di aꞌdi ꞌde/ mo, walla di mo e bwaman ma Awa\u1E35a tiya mo dhali di e bwamani ꞌkwani mo walla di aꞌdi  ꞌde/ mo, dhali \u1E6For moŋluŋ piti mo walla \u1E6For moŋgam gwo is piti mo, dhali aꞌdi midi miiya \u1E6Fuꞌc mo, mmoluŋa luŋ mo dhali mmohila hil ka ꞌthime mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ mo uni tan gi embul mo mmo/o gwo jin diꞌd e bwam buni mo dhali mmo\u1E6For mii eya tente/ mo, aꞌdi ta mo jin ꞌkonu ki ꞌkus jin midi buꞌth mo mo gom gwoŋ kulum mo ki dargi mo jin ceshu mo mo dhali simm aꞌdi e mo, mmobuꞌth mo dhali da/ar gwo jin \u1E6Foru mo dhali gwo kun c̱inu mo e to jin \u1E6Forkunuwa \u1E6For nycine/ mo dhali dargi mo jin a\u1E35u gwayu/ e mo.",
    "Aris uni ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ dhalu bway mo mmoꞌko ki ꞌkus mo e moŋ\u1E35uꞌth is mo gi montul is mo dhali e mo jin tula ꞌkwani ꞌkup̱ mo. Wathin \u1E6Fal ꞌdeŋ kamu/ minu ꞌkoki non ꞌtwa/ mo ꞌpeni montul is jin tulu ka ŋulꞌkup mo.",
    "Aris uni ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ mo dhala gwoŋ\u1E35an bway mo mmonya\u1E35a \u1E6Fuꞌc mii eya hakuma gi bampam piti mo, ka ji shoꞌk mo walla gom wathi/ jin kwanykunu ꞌba\u1E35any mo e bwambori uni mo. Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ mo dhala gwoŋ\u1E35an bway mo mmonya\u1E35 \u1E6Fuꞌc mii mo inya\u1E35ki ꞌkwani gi bampam piti mo.Dhali ꞌkwani mini mii mo meꞌd bwa gi ꞌkwani kun ta gi moshirr kun miikina \u1E6Fuꞌc ma hakuma mo, aꞌdi ta mii jin minu mii ki  ari momo dhali aris ꞌkwani gi monyꞌcesh mini kwany to jin mina uni ta\u1E35 toŋ \u1E35ar/e mo dhali uni mini ta\u1E35 to imon\u1E6Fal ꞌde/ mo dhali mini buꞌth to kun tagu ka \u1E35wal is mo walla to jin tagu ka p̱ara p̱o/  mo e mo jin ta\u1E35unu uni mo",
    // "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ uni tan gi moshirr mo mmosi/is mo dhali mmomalasa malas mo, inya\u1E35ka usha \u1E6Fuꞌca gwaꞌdga/ jin miikina aꞌdi mo dhali ka tee jin sinu is mo jin c̱ikunu to mo."
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ mini ta gi embul mo mmoꞌkoki/e mo gom is piti ki ꞌbore/ mo dhali mmokar buŋgwar is piti ki dhelel dhelel mo dhali Awa\u1E35 piti mo, inya\u1E35ki ton\u1E6Fe/ mo dhali burrinye/ jin hiꞌthu i is mo dhali guꞌb mo dhali thosona guruush goma dhawa/ mo dhali miiya \u1E6Fuꞌc ka ŋulꞌkup̱ mo, dhali c̱aꞌbki ꞌdantar e to kun p̱̱uꞌdkin mo e uni kun darga \u1E6Fuꞌc mo, uni kun ꞌbaꞌthan mo dhali ꞌkwani kun a\u1E6Fẖa is mo dhali aꞌbom jin wun ma ka\u1E6Fẖim piti  mo dhali kun cakin ki yil mo walla aꞌdi jin gamki  monyc̱aꞌb piti mo e mii kun tu\u1E35 ꞌban mo kun jiki aꞌdi mo. Ataꞌda mo dhali ushi uc̱i mo uni yu\u1E35unu mo mmodhip̱ ki ꞌbore/ mo dhali wo\u1E6Fẖa wo\u1E6Fẖ mo. Aris ushi uc̱i iꞌbaar mo kun dhoꞌthkunu mo e bwaman gi miimash mo walla ka pije/ gi miimash mo, uni mina bwa ꞌkuny inya\u1E35ki ꞌkwani kun ceshkunu ka p̱o/ mo.",
    "Aris uni ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ mo, isi meꞌd jin tana uni imannya\u1E35a \u1E6Fuꞌc mii mo, uni tan gi moshirr mo mmoꞌko ꞌba\u1E35any ki ꞌdantar mo dhali uni yu\u1E35unu mo e mo jin minu ka uni e mo, e mii gi bampam buni mo dhali mii gi ꞌpeŋkuman bampan tiya mo dhali inya\u1E35ki isi mii gi ꞌkwani kun miikina \u1E6Fuꞌc kun wo\u1E6Fẖkina wo\u1E6Fẖ mo dhali goma aris tom buni kun ish \u1E35umma/ mo, to kun miinu meꞌd ka woho/ mo, mo kun nya\u1E35ku to mii mo dhali gom mii kun miinu mo kun cilkina aꞌdi mo dhali mii jin nyaŋkina buŋgwar is gi wathimpa enꞌthi/ mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ uni dhala gwoŋ\u1E35an bway mo mmomiiya \u1E6Fuꞌc ꞌba\u1E35any mo, dhali jin minu kwany uni mo mmomiiya \u1E6Fuꞌc mo, dhali isi ki mo miimii ma isiŋ gana/ mo dhali mmogama ꞌthe eya \u1E6Fuꞌc jin miikina uni mo, dhali cesh uni gwansan ka p̱o/ uni kun ꞌkokin mo ki darga \u1E6Fuꞌc mo.Aris uni ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/, kun dargi mii ma gwarꞌde/ mo, uni ꞌkon ki ꞌkus mo mmoc̱i to imon\u1E6Fal ꞌde/ mo goma \u1E6Fuꞌc jin miikunu ka p̱ara p̱o/ mo.Aris uni ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ kun miikina \u1E6Fuꞌc mo uni ꞌkon ki ꞌkus mo mmomii mii ma isiŋ gana/ mo dhali gam to jin minu c̱i ki ꞌbore/ gom is buni mo ki ꞌdantar mo dhali goma Awa\u1E35 buni kun ꞌkokin kun ta\u1E35a ꞌkwaninyꞌcesh goma \u1E6Fuꞌc mo, dhali mar tom buni is mo, wa\u1E35ki/ aꞌdi mishu mii mo ki ꞌkwanin tiya kun ceshki mo ka p̱o/ kun ꞌkokin ka ŋulꞌkup̱ mo.Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ uni tan gi embul mo mmo/u\u1E35 to mo dhali ki aꞌdi minu c̱iꞌth ka warka/ mo gom to jin mina aꞌdi yol mo gom bwam piti jin o aꞌdi ki \u1E35al to iyol mo",
    // "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ uni tan gi moshirr mo mmosi/is mo dhali mmomalasa malas mo, inya\u1E35ka usha \u1E6Fuꞌca gwaꞌdga/ jin miikina aꞌdi mo dhali ka tee jin sinu is mo jin c̱ikunu to mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ mini ta gi embul mo mmoꞌkoki/e mo gom is piti ki ꞌbore/ mo dhali mmokar buŋgwar is piti ki dhelel dhelel mo dhali Awa\u1E35 piti mo, inya\u1E35ki ton\u1E6Fe/ mo dhali burrinye/ jin hiꞌthu i is mo dhali guꞌb mo dhali thosona guruush goma dhawa/ mo dhali miiya \u1E6Fuꞌc ka ŋulꞌkup̱ mo, dhali c̱aꞌbki ꞌdantar e to kun p̱̱uꞌdkin mo e uni kun darga \u1E6Fuꞌc mo, uni kun ꞌbaꞌthan mo dhali ꞌkwani kun a\u1E6Fẖa is mo dhali aꞌbom jin wun ma ka\u1E6Fẖim piti  mo dhali kun cakin ki yil mo walla aꞌdi jin gamki  monyc̱aꞌb piti mo e mii kun tu\u1E35 ꞌban mo kun jiki aꞌdi mo.Ataꞌda mo dhali ushi uc̱i mo uni yu\u1E35unu mo mmodhip̱ ki ꞌbore/ mo dhali wo\u1E6Fẖa wo\u1E6Fẖ mo. Aris ushi uc̱i iꞌbaar mo kun dhoꞌthkunu mo e bwaman gi miimash mo walla ka pije/ gi miimash mo, uni mina bwa ꞌkuny inya\u1E35ki ꞌkwani kun ceshkunu ka p̱o/ mo.",
    "Aris uni ꞌbaar mo ka  ꞌde\u1E6Fe/ ꞌde\u1E6Fe/  uni dhala gwoŋ\u1E35an bway mo mmomiiya awarka/ mo. Mo ma warka/ miinu mii ki meꞌd mo, isi ciki/ ki mon\u1E6Fel ꞌpen gi Mo ma warka/ jin minu mii mo. Mmo/u\u1E35 to mo dhali mo ma warka/ minu nyaŋ ki ꞌbore/ mo dhali Mo ma warka/ jin miinu e guꞌba caaga/ imon\u1E6Fal ꞌde/ mo e moŋ\u1E35aꞌb jin minu mii miim ꞌboroꞌd mo.Mo a warka/ minu mii \u1E6For gi ꞌkwaninyꞌcesh mo mmothim mo dhali ꞌbiꞌth ꞌkwani is mo mmodhu is ki gwaꞌd mo mmota\u1E35 ꞌkwani kun miikina \u1E6Fuꞌc mo mmoc̱i ꞌkwani bway mo e gwoŋ \u1E35ar/e mo dhali mmoc̱i mo jin ꞌkonu ki ꞌkus mo. Aꞌdi midi hal ꞌkwani mo jin mishu gwo ꞌban mo, mmo\u1E35uꞌc bwa ki ꞌkariꞌth mo dhali mmota mugu gi kal gi ꞌkwani gi monyꞌcesh mo, walla aŋulꞌkup̱ mo walla ꞌkwani kun luŋkina luŋ mo, dhali mii ki nyanye/ mo e ꞌkwani gi monyꞌcesh mo uni kun miiki moŋ\u1E35uꞌth is mo.Ibaba dhali itaꞌda uni tan gi embul mo mmokwany Mo ma warka/ jinꞌboroꞌd mo jin mina uni dhu uc̱im buni nycine/ mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ uni ꞌkokin ki ꞌkus mo mmomii miim buni mo e bwaman ma Awa\u1E35 mo, dhali loꞌb mo mmoꞌkuny bwa mo dhali mii mondheleleꞌd bway \u1E6Fwa/a mo dhali mii miim ꞌboron buni mo.Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ mini ti\u1E35 miim buni e jin midi wu mo dhali aris ton tiya kun ena uni kun dhelelin mo, awarka/ mo walla to kun u\u1E35u mo e aꞌdi jin taꞌda amanꞌkwar to mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ uni yu\u1E35unu mo dhali aris ꞌkwaninyꞌcesh kun thoson ki to mo e mii ma isiŋ gana/ mo dhali ꞌko ki ꞌkus mo e mo jin \u1E6Forkunu gwo mo jin \u1E6Foru gwo eya tente/ mo.",
    "Aris ꞌkwani iꞌbaar mo ka ꞌde\u1E6Fe/ ꞌde\u1E6Fe/ uni tan ga \u1E6Fuꞌc e ꞌkwani mo e mo jin mina aꞌdi di aꞌdi ꞌde/ ki ꞌkus mo dhali jin mina aꞌdi misha a\u1E6Fuꞌc piti mii mo mmomar aꞌdi is mo.E mii ma isiŋ ganam piti mo dhali di ki ꞌkus mo, aris uni ꞌbaar mo ka ꞌde\u1E6Fe/ ka ꞌde\u1E6Fe/ minu ꞌkoki mii ki miiny c̱iŋkina/  mo jin minu jiya ji jasi ꞌte/ mo meꞌd jin \u1E6Forkunu gwo ki gwoŋ\u1E35an gom wathin \u1E6Fal ꞌdeŋ kamu/ mo gom mii kun ꞌkonu ki ꞌdantar mo ki mii jin minu pi gwo mo dhali dhu is ki gwaꞌd mo gom mii ma isiŋ gana/ mo dhali ꞌko ki ꞌkus inya\u1E35ki kun tiya mo dhali montul is jin do\u1E6Fu gwo gom miim ꞌboroꞌd mo, mmothoson ꞌkwani mo dhali mmo\u1E35al ꞌkup̱ŋwa/ pa mo mmomii ka p̱ara p̱o/ mo.Mii ma isiŋ gana/ yansan mo minu ꞌkoki mii mo gom jasi aꞌdi mo, dhali gom ꞌkup̱ gwo gi ꞌkwani gi monyꞌcesh mo.",
    "Toŋkamu/ yisa diꞌda jin minu ꞌkoki \u1E6For mo mmoꞌkoki \u1E6For ꞌpemen eya tente/ goma ris bampan tiya mo, ꞌkwani kun ꞌkon ka non she/ mo walla wathin ꞌdeŋ kamu/ jin ona bwa ki miiya \u1E6Fuꞌca tiya mo walla aꞌdi jin ona bwa ki u\u1E35 ton tiya mo mmoꞌceꞌda ꞌceꞌd shoꞌk mo e ton tiya jin ona bwa aꞌdi mo dhali c̱aꞌb ꞌba\u1E35any e mondim piti mo."
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
