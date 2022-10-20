import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:hudo/utils/file_export.dart';
customDescriptionTextText({
  BuildContext context, String text
  , double  percentageOfHeight : .019, Color textColor : greyColor, fontFamily: 'LibreBasker'
  , FontWeight fontWeight : FontWeight.normal  , textAlign :
  TextAlign.center, decoration : null ,fontStyle  : FontStyle.normal  , int  maxLines  : 1 }) {
  return Text(

    translator.translate(text),
    textAlign:textAlign ,
    maxLines:maxLines,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        height: 1.8,
        fontStyle: fontStyle ,
        decoration:decoration  ,
        fontFamily: fontFamily,
        fontWeight: fontWeight ,
        color: textColor ,
        fontSize: isLandscape(context)
            ? 2 * height(context) *percentageOfHeight
            : height(context) *percentageOfHeight ),
  );
}
