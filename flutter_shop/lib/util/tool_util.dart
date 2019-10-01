import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToolUtils {
  static void initScreenUtil(BuildContext context) =>
      ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
}
