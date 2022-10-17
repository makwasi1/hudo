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
    "Aris ꞌkwaninyꞌceshi ꞌbaar mo dhoꞌthkunu ꞌba\u006Bany mo dhali mmomiiya \u0074uꞌc imon\u0074al ꞌde/ mo dhali mii ma \u006Bar/e mo. Uni mini ta gi gwo mo dhali mii mo dhali uni mini mii ka karambuye/ ꞌkup̱ ki cin tiya mo e shi/in mo dhali mii kun tanu ikam mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ yu\u006Bunu mo e mii ma isiŋ gana/ mo dhali gwo jin \u0074orkunu mo gom moŋꞌko jin ꞌkonu ki ꞌkus mo, ki dar gi mo jin ꞌkonu ka \u006Bwa/um bwa ki she/ ki she/ mo, hili ka Awa\u006B mo, jamas, wathiŋ gwa\u0074ẖ dhali aꞌbom mo, ꞌtwa/ mo, mmoluŋa luŋ mo, imanmii gwo aꞌcesh mo walla gwon tiya mo wathi/ jin cila bampa/ mo walla amannya\u006B to mii mo, dhali mal mo, dhali mondhoꞌth mo. Hili, a\u006Bwa/um bwa minu ꞌkoki mii mo e ꞌkwani kun mii gwo aꞌcesh mo, dhali  mmomii to ka p̱ara p̱o/ mo meꞌd jin dhala gwoŋ\u006Ban aꞌdi bway mo walla eya ris kal gi ꞌkwaninyꞌcesh mo e bampa/ mo walla e ꞌpeŋkuman bampa/ mo aꞌdi jin ta ji gi wathi/ mo, walla aꞌdi diꞌd ki ꞌpen piti mo, mii ma \u006Bar/e mo, diki ji is piti aꞌdi ꞌde/ mo walla e ꞌbameꞌdi kun tiya kun ta gi moshirr kun jikina ji mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ mini ꞌko ꞌba\u006Bany e moŋꞌkoki/e mo, mmokwanya kwany mo dhali wathi/ midi c̱aꞌbki ꞌdantar mo.",
    "Wathin \u0074al ꞌdeŋ kamu/ minu ꞌkoki mii ki miiny c̱iŋkina/ mo walla ka jinthus mo, miiny c̱iŋkina/ mo dhali mii jin yolkunu c̱iŋkina/ minu non ꞌtwa/ mo eya aris jamas gi miim buni ki she/ ki she/ mo.",
    "Wathin \u0074al ꞌdeŋ kamu/ minu ꞌkoki ꞌkosh mo walla miinu ꞌkoki jee mo, wathi/ minu ꞌkoki mii ka jinthus mo walla minu ꞌkoki sirija ap̱o/ gi shoꞌk mo walla minu ꞌkoki dor mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ minu dhu ki monta\u006B ki ꞌtwaŋ\u006Bal kuku/ mo meꞌd wathi/ jin dikiꞌd e buŋꞌkus gi gwoŋ\u006Ban mo.",
    "Aris uni ꞌbaar mo inya\u006Bkan imon\u0074al ꞌde/ mbwambor gi gwoŋ\u006Ban mo dhali uni yu\u006Bunu mo ki dargi mii ma gwarꞌde/ mo e mo jin miinu cesh uni ka p̱o/  imon\u0074al ꞌde/ gi gwoŋ\u006Ban mo. Aris uni ꞌbaar mo yu\u006Bunu imon\u0074al ꞌde/ mo e mo jin ceshuwa cesh ka p̱o/ mo ꞌpeni mii kun miinu mii ma gwarꞌde/ mo mmoꞌceꞌd gwoŋ\u006Ban yansan jin \u0074orkunu mo dhali ap̱o/  mii kun yu\u006Bunu mo e mii kun ꞌkoshuwa mee mo hili e mii ma gwarꞌde/ mo.",
    "Aris uni ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ mo tani, tan gi tom buni mo kun wanuwa wan ꞌba/ mo eya awa\u006B gi kal gi ꞌkwaninyꞌcesh mo gom mii jin ꞌceꞌdu gwoŋ\u006Ban mo gom mii ma isiŋ gana/ mo jin gamkina aꞌdi mo e gwoŋ\u006Ban jin yeꞌthkunu aꞌdi shoꞌk mo walla gi gwoŋ\u006Ban mo.",
    "Wathin \u0074al ꞌdeŋ kamu/ minu ꞌkoki buꞌth mo mmota habus mo, walla aꞌdi minu diki ur mo bway bampaŋ kamu/ mo.",
    "Aris uni ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ yu\u006Bunu mo e mii ma p̱ara p̱o/ mo dhali ꞌkwani kun ci\u006Bki gwo mo gom mo jin ꞌkonu ki ꞌpen buni mo, dhali e bwaman ma Awa\u006B mo, e mo jin \u0074oru mii ma \u006Bar/em piti mo dhali mo miiya \u0074uꞌc mo dhali imanꞌkosha mee kun miiki mii ap̱o/i aꞌdi mo.",
    "Aris uni ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ miikina \u0074uꞌc gom mondor ki mii kun ꞌthenu is mo aꞌdi taꞌd gi gwo mmo/o mo aꞌdi jin dargi mii mꞌba/ ntagi miinthus piti thimkiꞌd mo isi ki gwoŋ\u006Ban ma wambuhany ꞌkwani gi mompal mo e aꞌdi jin tana aꞌdi iꞌbaar mo dhali aris gwo jin ona aꞌdi is mo gom mo jin je\u0074a aꞌdi shoꞌka ꞌcesh mo. Wathin \u0074al ꞌdeŋ kamu/ minu diki kar miinthusa kamu/ jin midi ꞌkosh aꞌdi is ka nyor mo gom tonthus mo, e bwaŋꞌkwariny gi kal gi ꞌkwaninyꞌcesh mo walla gwoŋ\u006Ban gi kal gi ꞌkwaninyꞌcesh mo, ka tee c̱aan mo ki aꞌdi miiki tonthus mo. Walla aꞌdi karkunu ton di\u0074iꞌd e ꞌbam piti jin burjurkunu aꞌdi ki mondor mo mmobol aꞌdin ꞌde/ e mo jin miiki to mo ka tee jin dorkunu aꞌdi mo gom tonthus jin miikina aꞌdi mo.",
    "Wathin \u0074al ꞌde/ kamu/ minu ꞌkoki mii ki miiny c̱iŋkina/ mo ki mii jin minu thul tom piti meꞌda p̱o/ mo ki tom piti jin tana aꞌdi mo, Awa\u006B piti mo, e kuŋ guꞌb piti mo walla ton tiya gunn kun cila aꞌdi mo, walla mmoꞌkosh monta\u006B piti mo, dhali yer gway mo. Aris ꞌkwani ꞌbaar mo uni tan gi gwoŋ\u006Ban mo mmocesh tom buni kun tana uni ka p̱o/ mo walla jin ꞌkoshkunu mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ uni dhala gwon\u006Ban bway mo mmo/ii ki ꞌkus mo dhali mmo/ii bampa/ gi moŋꞌkoꞌd gwar gi gwayu/ gi bampa/ iꞌbaar mo.",
    // "Aris ꞌkwani ꞌbaar ka ꞌde\u0074e/ ꞌde\u0074e/ uni mini dhal bampaŋ kamu/ ꞌpen mo meꞌd bwam buni mo dhali nya\u006Bki bampam buni mo dhali ki aꞌdi midi do\u006B ka nyaŋꞌkoꞌd bway bampam piti mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ uni mini ŋap̱ bway mo dhali ꞌkuny bwa mo mmodi mo e bampan tiya kunꞌkona ꞌkwani kun urkunu mo ꞌpeni bampam buni mo ꞌpeni mon\u0074oꞌc bwa mo.",
    "Aꞌdi ta gwoŋ gana/ aꞌdan jin minu ꞌkoki yu\u006B um mo e mii jin \u0074ojuwa \u0074oꞌc ꞌkus ꞌpeni gwo ma isiŋ gana/ mo jin cuki mis mo ꞌpeni ꞌkwani kun ꞌkoki ta imanmii gwo aꞌcesh mo kun ꞌkoki ta imanmii tonthus mo walla ꞌpeni mii jin uru gwo mo gom mii mo dhali gwoŋ\u006Ban gi ꞌkwaninyꞌcesh kun nya\u006Bki to mii mo.",
    // "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ dhala gwoŋ\u006Ban gi bampam piti aꞌdi bway mo mmota com bampa/ mo.",
    // "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ dhala gwoŋ\u006Ban gi bampam piti aꞌdi bway mo mmota com bampa/ mo. .Wathin \u0074al ꞌdeŋ kamu/ minu ꞌkoki nonꞌtwa/ mo ꞌpeni miim buyem bampam piti mo walla minu ꞌkoki non ꞌtwa/ mo mmo/a\u006B miim buyem bampam piti e mo.",
    "ꞌKwaniŋ gwa\u0074ẖ dhali aris up̱ kun cakin ki yil mo, uni minu ꞌkoki cesh mo mo gom awa\u006B buni mo walla gom miim buyem bampam buni mo walla gom mo luŋ buni mo. Uni dhala gwoŋ\u006Ban bway mo mmomash mo ki uni mini gam uci mo. Uni yu\u006Bunu mo imon\u0074al ꞌde/ mo isi ki mii ma \u006Bar/e mo gom mii mash mo, ki embul gi mii mash mo dhali ki mom piti jin karkunu ꞌkup̱ mo. Miimash minu thim ki gwoŋ ꞌkwanin su/ mo dhali gam gwo meꞌd ki ꞌbore/ mo jin thosonkina uni is mo mmo\u0074alꞌde/ mo. Awa\u006B aꞌdi taꞌda ꞌkaŋꞌkup̱ mo dhali moŋ\u006Baꞌb jin de\u006Bu imon\u0074al ꞌde/ mo e kuŋꞌkup̱ piti mo dhali aꞌdi yu\u006Bunu mo ki aꞌdi mina ꞌkwani cesh ka p̱o/ mo dhali ki bampam piti mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ uni tan gi embul mo mmota ki to gom is piti mo ki ꞌbore/ mo, meꞌd isi ciki/ mo mmonya\u006B to mii inya\u006Bki ꞌkwanin tiya mo.Wathin \u0074al ꞌdeŋ kamu/ minu ꞌkoki non ꞌtwa/ ꞌpeni tom piti jin tana aꞌdi jin ishiꞌd ka enthus mo.",
    "Aris ꞌkwani ꞌbaar mo mini ꞌko ki ꞌkom ꞌpempaŋ gana/ ꞌba\u006Bany e bwaŋ kulum buni mo, eya dum buni mo dhali e moŋluŋ buni mo, aꞌdi ta mo jin ꞌkonu ki ꞌkus mo mmo/a\u006B mo jin luŋuwa luŋ e mo walla moŋgam gwo is mo, dhali di ki ꞌkus mo, walla aꞌdi midi di aꞌdi ꞌde/ mo, walla di mo e bwaman ma Awa\u006Ba tiya mo dhali di e bwamani ꞌkwani mo walla di aꞌdi  ꞌde/ mo, dhali \u0074or moŋluŋ piti mo walla \u0074or moŋgam gwo is piti mo, dhali aꞌdi midi miiya \u0074uꞌc mo, mmoluŋa luŋ mo dhali mmohila hil ka ꞌthime mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ mo uni tan gi embul mo mmo/o gwo jin diꞌd e bwam buni mo dhali mmo\u0074or mii eya tente/ mo, aꞌdi ta mo jin ꞌkonu ki ꞌkus jin midi buꞌth mo mo gom gwoŋ kulum mo ki dargi mo jin ceshu mo mo dhali simm aꞌdi e mo, mmobuꞌth mo dhali da/ar gwo jin \u0074oru mo dhali gwo kun c̱inu mo e to jin \u0074orkunuwa \u0074or nycine/ mo dhali dargi mo jin a\u006Bu gwayu/ e mo.",
    "Aris uni ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ dhalu bway mo mmoꞌko ki ꞌkus mo e moŋ\u006Buꞌth is mo gi montul is mo dhali e mo jin tula ꞌkwani ꞌkup̱ mo. Wathin \u0074al ꞌdeŋ kamu/ minu ꞌkoki non ꞌtwa/ mo ꞌpeni montul is jin tulu ka ŋulꞌkup mo.",
    "Aris uni ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ mo dhala gwoŋ\u006Ban bway mo mmonya\u006Ba \u0074uꞌc mii eya hakuma gi bampam piti mo, ka ji shoꞌk mo walla gom wathi/ jin kwanykunu ꞌba\u006Bany mo e bwambori uni mo. Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ mo dhala gwoŋ\u006Ban bway mo mmonya\u006B \u0074uꞌc mii mo inya\u006Bki ꞌkwani gi bampam piti mo.Dhali ꞌkwani mini mii mo meꞌd bwa gi ꞌkwani kun ta gi moshirr kun miikina \u0074uꞌc ma hakuma mo, aꞌdi ta mii jin minu mii ki  ari momo dhali aris ꞌkwani gi monyꞌcesh mini kwany to jin mina uni ta\u006B toŋ \u006Bar/e mo dhali uni mini ta\u006B to imon\u0074al ꞌde/ mo dhali mini buꞌth to kun tagu ka \u006Bwal is mo walla to jin tagu ka p̱ara p̱o/  mo e mo jin ta\u006Bunu uni mo",
    // "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ uni tan gi moshirr mo mmosi/is mo dhali mmomalasa malas mo, inya\u006Bka usha \u0074uꞌca gwaꞌdga/ jin miikina aꞌdi mo dhali ka tee jin sinu is mo jin c̱ikunu to mo."
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ mini ta gi embul mo mmoꞌkoki/e mo gom is piti ki ꞌbore/ mo dhali mmokar buŋgwar is piti ki dhelel dhelel mo dhali Awa\u006B piti mo, inya\u006Bki ton\u0074e/ mo dhali burrinye/ jin hiꞌthu i is mo dhali guꞌb mo dhali thosona guruush goma dhawa/ mo dhali miiya \u0074uꞌc ka ŋulꞌkup̱ mo, dhali c̱aꞌbki ꞌdantar e to kun p̱̱uꞌdkin mo e uni kun darga \u0074uꞌc mo, uni kun ꞌbaꞌthan mo dhali ꞌkwani kun a\u0074ẖa is mo dhali aꞌbom jin wun ma ka\u0074ẖim piti  mo dhali kun cakin ki yil mo walla aꞌdi jin gamki  monyc̱aꞌb piti mo e mii kun tu\u006B ꞌban mo kun jiki aꞌdi mo. Ataꞌda mo dhali ushi uc̱i mo uni yu\u006Bunu mo mmodhip̱ ki ꞌbore/ mo dhali wo\u0074ẖa wo\u0074ẖ mo. Aris ushi uc̱i iꞌbaar mo kun dhoꞌthkunu mo e bwaman gi miimash mo walla ka pije/ gi miimash mo, uni mina bwa ꞌkuny inya\u006Bki ꞌkwani kun ceshkunu ka p̱o/ mo.",
    "Aris uni ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ mo, isi meꞌd jin tana uni imannya\u006Ba \u0074uꞌc mii mo, uni tan gi moshirr mo mmoꞌko ꞌba\u006Bany ki ꞌdantar mo dhali uni yu\u006Bunu mo e mo jin minu ka uni e mo, e mii gi bampam buni mo dhali mii gi ꞌpeŋkuman bampan tiya mo dhali inya\u006Bki isi mii gi ꞌkwani kun miikina \u0074uꞌc kun wo\u0074ẖkina wo\u0074ẖ mo dhali goma aris tom buni kun ish \u006Bumma/ mo, to kun miinu meꞌd ka woho/ mo, mo kun nya\u006Bku to mii mo dhali gom mii kun miinu mo kun cilkina aꞌdi mo dhali mii jin nyaŋkina buŋgwar is gi wathimpa enꞌthi/ mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ uni dhala gwoŋ\u006Ban bway mo mmomiiya \u0074uꞌc ꞌba\u006Bany mo, dhali jin minu kwany uni mo mmomiiya \u0074uꞌc mo, dhali isi ki mo miimii ma isiŋ gana/ mo dhali mmogama ꞌthe eya \u0074uꞌc jin miikina uni mo, dhali cesh uni gwansan ka p̱o/ uni kun ꞌkokin mo ki darga \u0074uꞌc mo.Aris uni ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/, kun dargi mii ma gwarꞌde/ mo, uni ꞌkon ki ꞌkus mo mmoc̱i to imon\u0074al ꞌde/ mo goma \u0074uꞌc jin miikunu ka p̱ara p̱o/ mo.Aris uni ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ kun miikina \u0074uꞌc mo uni ꞌkon ki ꞌkus mo mmomii mii ma isiŋ gana/ mo dhali gam to jin minu c̱i ki ꞌbore/ gom is buni mo ki ꞌdantar mo dhali goma Awa\u006B buni kun ꞌkokin kun ta\u006Ba ꞌkwaninyꞌcesh goma \u0074uꞌc mo, dhali mar tom buni is mo, wa\u006Bki/ aꞌdi mishu mii mo ki ꞌkwanin tiya kun ceshki mo ka p̱o/ kun ꞌkokin ka ŋulꞌkup̱ mo.Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ uni tan gi embul mo mmo/u\u006B to mo dhali ki aꞌdi minu c̱iꞌth ka warka/ mo gom to jin mina aꞌdi yol mo gom bwam piti jin o aꞌdi ki \u006Bal to iyol mo",
    // "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ uni tan gi moshirr mo mmosi/is mo dhali mmomalasa malas mo, inya\u006Bka usha \u0074uꞌca gwaꞌdga/ jin miikina aꞌdi mo dhali ka tee jin sinu is mo jin c̱ikunu to mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ mini ta gi embul mo mmoꞌkoki/e mo gom is piti ki ꞌbore/ mo dhali mmokar buŋgwar is piti ki dhelel dhelel mo dhali Awa\u006B piti mo, inya\u006Bki ton\u0074e/ mo dhali burrinye/ jin hiꞌthu i is mo dhali guꞌb mo dhali thosona guruush goma dhawa/ mo dhali miiya \u0074uꞌc ka ŋulꞌkup̱ mo, dhali c̱aꞌbki ꞌdantar e to kun p̱̱uꞌdkin mo e uni kun darga \u0074uꞌc mo, uni kun ꞌbaꞌthan mo dhali ꞌkwani kun a\u0074ẖa is mo dhali aꞌbom jin wun ma ka\u0074ẖim piti  mo dhali kun cakin ki yil mo walla aꞌdi jin gamki  monyc̱aꞌb piti mo e mii kun tu\u006B ꞌban mo kun jiki aꞌdi mo.Ataꞌda mo dhali ushi uc̱i mo uni yu\u006Bunu mo mmodhip̱ ki ꞌbore/ mo dhali wo\u0074ẖa wo\u0074ẖ mo. Aris ushi uc̱i iꞌbaar mo kun dhoꞌthkunu mo e bwaman gi miimash mo walla ka pije/ gi miimash mo, uni mina bwa ꞌkuny inya\u006Bki ꞌkwani kun ceshkunu ka p̱o/ mo.",
    "Aris uni ꞌbaar mo ka  ꞌde\u0074e/ ꞌde\u0074e/  uni dhala gwoŋ\u006Ban bway mo mmomiiya awarka/ mo. Mo ma warka/ miinu mii ki meꞌd mo, isi ciki/ ki mon\u0074el ꞌpen gi Mo ma warka/ jin minu mii mo. Mmo/u\u006B to mo dhali mo ma warka/ minu nyaŋ ki ꞌbore/ mo dhali Mo ma warka/ jin miinu e guꞌba caaga/ imon\u0074al ꞌde/ mo e moŋ\u006Baꞌb jin minu mii miim ꞌboroꞌd mo.Mo a warka/ minu mii \u0074or gi ꞌkwaninyꞌcesh mo mmothim mo dhali ꞌbiꞌth ꞌkwani is mo mmodhu is ki gwaꞌd mo mmota\u006B ꞌkwani kun miikina \u0074uꞌc mo mmoc̱i ꞌkwani bway mo e gwoŋ \u006Bar/e mo dhali mmoc̱i mo jin ꞌkonu ki ꞌkus mo. Aꞌdi midi hal ꞌkwani mo jin mishu gwo ꞌban mo, mmo\u006Buꞌc bwa ki ꞌkariꞌth mo dhali mmota mugu gi kal gi ꞌkwani gi monyꞌcesh mo, walla aŋulꞌkup̱ mo walla ꞌkwani kun luŋkina luŋ mo, dhali mii ki nyanye/ mo e ꞌkwani gi monyꞌcesh mo uni kun miiki moŋ\u006Buꞌth is mo.Ibaba dhali itaꞌda uni tan gi embul mo mmokwany Mo ma warka/ jinꞌboroꞌd mo jin mina uni dhu uc̱im buni nycine/ mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ uni ꞌkokin ki ꞌkus mo mmomii miim buni mo e bwaman ma Awa\u006B mo, dhali loꞌb mo mmoꞌkuny bwa mo dhali mii mondheleleꞌd bway \u0074wa/a mo dhali mii miim ꞌboron buni mo.Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ mini ti\u006B miim buni e jin midi wu mo dhali aris ton tiya kun ena uni kun dhelelin mo, awarka/ mo walla to kun u\u006Bu mo e aꞌdi jin taꞌda amanꞌkwar to mo.",
    "Aris ꞌkwani ꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ uni yu\u006Bunu mo dhali aris ꞌkwaninyꞌcesh kun thoson ki to mo e mii ma isiŋ gana/ mo dhali ꞌko ki ꞌkus mo e mo jin \u0074orkunu gwo mo jin \u0074oru gwo eya tente/ mo.",
    "Aris ꞌkwani iꞌbaar mo ka ꞌde\u0074e/ ꞌde\u0074e/ uni tan ga \u0074uꞌc e ꞌkwani mo e mo jin mina aꞌdi di aꞌdi ꞌde/ ki ꞌkus mo dhali jin mina aꞌdi misha a\u0074uꞌc piti mii mo mmomar aꞌdi is mo.E mii ma isiŋ ganam piti mo dhali di ki ꞌkus mo, aris uni ꞌbaar mo ka ꞌde\u0074e/ ka ꞌde\u0074e/ minu ꞌkoki mii ki miiny c̱iŋkina/  mo jin minu jiya ji jasi ꞌte/ mo meꞌd jin \u0074orkunu gwo ki gwoŋ\u006Ban gom wathin \u0074al ꞌdeŋ kamu/ mo gom mii kun ꞌkonu ki ꞌdantar mo ki mii jin minu pi gwo mo dhali dhu is ki gwaꞌd mo gom mii ma isiŋ gana/ mo dhali ꞌko ki ꞌkus inya\u006Bki kun tiya mo dhali montul is jin do\u0074u gwo gom miim ꞌboroꞌd mo, mmothoson ꞌkwani mo dhali mmo\u006Bal ꞌkup̱ŋwa/ pa mo mmomii ka p̱ara p̱o/ mo.Mii ma isiŋ gana/ yansan mo minu ꞌkoki mii mo gom jasi aꞌdi mo, dhali gom ꞌkup̱ gwo gi ꞌkwani gi monyꞌcesh mo.",
    "Toŋkamu/ yisa diꞌda jin minu ꞌkoki \u0074or mo mmoꞌkoki \u0074or ꞌpemen eya tente/ goma ris bampan tiya mo, ꞌkwani kun ꞌkon ka non she/ mo walla wathin ꞌdeŋ kamu/ jin ona bwa ki miiya \u0074uꞌca tiya mo walla aꞌdi jin ona bwa ki u\u006B ton tiya mo mmoꞌceꞌda ꞌceꞌd shoꞌk mo e ton tiya jin ona bwa aꞌdi mo dhali c̱aꞌb ꞌba\u006Bany e mondim piti mo."
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
