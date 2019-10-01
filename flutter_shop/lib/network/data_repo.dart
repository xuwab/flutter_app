import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_shop/network/api.dart';

Future fetchHomePageListData() async {
  print("fetchHomePageListData");

  try{
    Response response;

    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/json");

    var body = {'lon': '115.02932', 'lat': '35.76189'};

    response = await dio.get(AppUrlMap['homePageUrl'],queryParameters: body);

    print('dsds------');
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    print('------');

    return print(e);
  }
}
