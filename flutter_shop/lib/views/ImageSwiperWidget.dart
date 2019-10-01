import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ImageSwiperWidget extends StatelessWidget {
  List imageMapList;


  ImageSwiperWidget(this.imageMapList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (context, index){
          return Image.network(imageMapList[index]['image'],fit: BoxFit.fill,);
        },

        itemCount: imageMapList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
