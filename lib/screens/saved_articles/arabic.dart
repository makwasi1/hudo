import 'package:flutter/cupertino.dart';

import 'package:hudo/utils/audio_controller.dart';
import 'package:hudo/utils/check_direction.dart';
import 'package:hudo/utils/file_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedArticlesArabic extends StatefulWidget {
  @override
  _SavedArticlesArabicState createState() => _SavedArticlesArabicState();
}

class _SavedArticlesArabicState extends State<SavedArticlesArabic> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  FocusNode fieldNode = FocusNode();
  String currentUserId = "default user id";

  final titles = [
    "المادة 1",
    "المادة 2",
    "المادة 3",
    "المادة 4",
    "المادة 5",
    "المادة 6",
    "المادة 7",
    "المادة 8",
    "المادة 9",
    "المادة 10",
    "المادة 11",
    "المادة 12",
    "المادة 13",
    "المادة 14",
    "المادة 15",
    "المادة 16",
    "المادة 17",
    "المادة 18",
    "المادة 19",
    "المادة 20",
    // "المادة 21",
    // "المادة 22",
    // "المادة 23",
    // "المادة 24",
    // "المادة 25",
    // "المادة 26",
    // "المادة 27",
    // "المادة 28",
    // "المادة 29",
    // "المادة 30"
  ];

  List Articles = [
    "يولد جميع الناس أحراراً ومتساوين في الكرامة والحقوق. وهم قد وهبوا العقل والوجدان وعليهم أن يعاملوا بعضهم بعضاً بروح الإخاء.",
    "لكلِّ إنسان حقُّ التمتُّع بجميع الحقوق والحرِّيات المذكورة في هذا الإعلان، دونما تمييز من أيِّ نوع، ولا سيما التمييز بسبب العنصر، أو اللون، أو الجنس، أو اللغة، أو الدِّين، أو الرأي سياسيًّا وغير سياسي، أو الأصل الوطني أو الاجتماعي، أو الثروة، أو المولد، أو أيِّ وضع آخر. وفضلاً عن ذلك لا يجوز التمييزُ علي أساس الوضع السياسي أو القانوني أو الدولي للبلد أو الإقليم الذي ينتمي إليه الشخص، سواء أكان مستقلاًّ أو موضوعًا تحت الوصاية أو غير متمتِّع بالحكم الذاتي أم خاضعًا لأيِّ قيد آخر على سيادته.",
    "لكلِّ فرد الحقُّ في الحياة والحرِّية وفي الأمان على شخصه.",
    "لا يجوز استرقاقُ أحد أو استعبادُه، ويُحظر الرق والاتجار بالرقيق بجميع صورهما.",
    "لا يجوز إخضاعُ أحد للتعذيب ولا للمعاملة أو العقوبة القاسية أو اللاإنسانية أو الحاطَّة بالكرامة.",
    "لكلِّ إنسان، في كلِّ مكان، الحقُّ بأن يُعترَف له بالشخصية القانونية.",
    "الناسُ جميعًا سواءٌ أمام القانون، وهم يتساوون في حقِّ التمتُّع بحماية القانون دونما تمييز، كما يتساوون في حقِّ التمتُّع بالحماية من أيِّ تمييز ينتهك هذا الإعلانَ ومن أيِّ تحريض على مثل هذا التمييز.",
    "لكلِّ شخص حقُّ اللجوء إلى المحاكم الوطنية المختصَّة لإنصافه الفعلي من أيَّة أعمال تَنتهك الحقوقَ الأساسيةَ التي يمنحها إيَّاه الدستورُ أو القانونُ.",
    "لا يجوز اعتقالُ أيِّ إنسان أو حجزُه أو نفيُه تعسُّفًا.",
    "لكلِّ إنسان، على قدم المساواة التامة مع الآخرين، الحقُّ في أن تَنظر قضيتَه محكمةٌ مستقلَّةٌ ومحايدةٌ، نظرًا مُنصفًا وعلنيًّا، للفصل في حقوقه والتزاماته وفى أيَّة تهمة جزائية تُوجَّه إليه.",
    "لا يُدان أيُّ شخص بجريمة بسبب أيِّ عمل أو امتناع عن عمل لم يكن في حينه يشكِّل جُرمًا بمقتضى القانون الوطني أو الدولي، كما لا تُوقَع عليه أيَّةُ عقوبة أشدَّ من تلك التي كانت ساريةً في الوقت الذي ارتُكب فيه الفعل الجُرمي.  1 كلُّ شخص متَّهم بجريمة يُعتبَر بريئًا إلى أن يثبت ارتكابُه لها قانونًا في محاكمة علنية تكون قد وُفِّرت له فيها جميعُ الضمانات اللازمة للدفاع عن نفسه. ",
    "لا يجوز تعريضُ أحد لتدخُّل تعسُّفي في حياته الخاصة أو في شؤون أسرته أو مسكنه أو مراسلاته، ولا لحملات تمسُّ شرفه وسمعته. ولكلِّ شخص حقٌّ في أن يحميه القانونُ من مثل ذلك التدخُّل أو تلك الحملات.",
    "لكلِّ فرد حقٌّ في حرِّية التنقُّل وفي اختيار محلِّ إقامته داخل حدود الدولة.لكلِّ فرد حقٌّ في مغادرة أيِّ بلد، بما في ذلك بلده، وفي العودة إلى بلده.",
    "لكلِّ فرد حقُّ التماس ملجأ في بلدان أخرى والتمتُّع به خلاصًا من الاضطهاد.لا يمكن التذرُّعُ بهذا الحقِّ إذا كانت هناك ملاحقةٌ ناشئةٌ بالفعل عن جريمة غير سياسية أو عن أعمال تناقض مقاصدَ الأمم المتحدة ومبادئها.",
    "لكل فرد حق التمتع بجنسية ما.لا يجوز، تعسُّفًا، حرمانُ أيِّ شخص من جنسيته ولا من حقِّه في تغيير جنسيته.",
    " للرجل والمرأة، متى أدركا سنَّ البلوغ، حقُّ التزوُّج وتأسيس أسرة، دون أيِّ قيد بسبب العِرق أو الجنسية أو الدِّين. وهما متساويان في الحقوق لدى التزوُّج وخلال قيام الزواج ولدى انحلاله.لا يُعقَد الزواجُ إلاَّ برضا الطرفين المزمع زواجهما رضاءً كاملً لا إكراهَ فيه.الأسرةُ هي الخليةُ الطبيعيةُ والأساسيةُ في المجتمع، ولها حقُّ التمتُّع بحماية المجتمع والدولة.",
    " لكلِّ فرد حقٌّ في التملُّك، بمفرده أو بالاشتراك مع غيره.اليجوز تجريدُ أحدٍ من مُلكه تعسُّفًا.",
    "لكلِّ شخص حقٌّ في حرِّية الفكر والوجدان والدِّين، ويشمل هذا الحقُّ حرِّيته في تغيير دينه أو معتقده، وحرِّيته في إظهار دينه أو معتقده بالتعبُّد وإقامة الشعائر والممارسة والتعليم، بمفرده أو مع جماعة، وأمام الملأ أو على حدة.",
    "لكلِّ شخص حقُّ التمتُّع بحرِّية الرأي والتعبير، ويشمل هذا الحقُّ حرِّيته في اعتناق الآراء دون مضايقة، وفي التماس الأنباء والأفكار وتلقِّيها ونقلها إلى الآخرين، بأيَّة وسيلة ودونما اعتبار للحدود.",
    "لكلِّ شخص حقٌّ في حرِّية الاشتراك في الاجتماعات والجمعيات السلمية.لا يجوز إرغامُ أحدٍ على الانتماء إلى جمعية ما.",
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

  unSaveArticle() async {
    // await DioHelper.init();
    // DioHelper.postData(url: 'artical_unsave/${"lamyaa6"}/1')
    //     .then((value) async {
    //   print("unsave Article  atatus code  ${value.statusCode}");
    //   print(" unsave Article response is : ${value.data}");
    // }).catchError((error) {
    //   print(error);
    // });
  }

  bool isPlayerOpened = false;
  int indexNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Articles'),
      ),
      body: ListView.builder(
          itemCount: Articles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
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
                            Articles[index],
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            softWrap: true,
                            textDirection: TextDirection.rtl,
                            // textAlign: TextAlign.right,
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
      lang: 'arabic',
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
