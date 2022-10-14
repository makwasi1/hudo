import 'package:hudo/utils/file_export.dart';
import 'package:carousel_pro/carousel_pro.dart';

topSlider({BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: width(context),
        height: isLandscape(context)
            ? 1.8 * height(context) * .4
            : height(context) * .4,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
//                shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: width(context),
                height: isLandscape(context)
                    ? 1.5 * height(context) * .3
                    : height(context) * .3,
                child: Carousel(
                  dotIncreasedColor: mainColor,
                  borderRadius: false,
                  dotSize: 3.0,
                  showIndicator: true,
                  dotSpacing: 13,
                  onImageTap: (index) {
                    print('this is $index');
                  },
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.transparent,
                  boxFit: BoxFit.cover,
                  images: [
                    AssetImage(AppImages.im10),
                    AssetImage(AppImages.im4),
                    // AssetImage(AppImages.im5),
                    AssetImage(AppImages.im7),
                    AssetImage(AppImages.im9),
                    AssetImage(AppImages.im11),
                    AssetImage(AppImages.im14),
                    AssetImage(AppImages.image1),
                    AssetImage(AppImages.image2),
                    AssetImage(AppImages.image3),
                    AssetImage(AppImages.image4),
                    AssetImage(AppImages.image5),
                    AssetImage(AppImages.image6),


                  ],
                ),
              );
            }),
      )
    ],
  );
}
