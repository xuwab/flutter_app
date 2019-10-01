import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/network/data_repo.dart';
import 'package:flutter_shop/views/ImageSwiperWidget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: fetchHomePageListData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = json.decode(snapshot.data.toString());
          List<Map> dataMap = (data['data']['slides'] as List).cast();
          List<Map> categoryList = (data['data']['category'] as List).cast();
          if (categoryList.length > 10) {
            categoryList.removeRange(10, categoryList.length);
          }
          return Column(
            children: <Widget>[
              ImageSwiperWidget(dataMap),
              CategoryListWidget(categoryList)
            ],
          );
        } else {
          return Center(
            child: Text('Loading'),
          );
        }
      },
    ));
  }
}

class CategoryListWidget extends StatelessWidget {
  List categoryList;

  CategoryListWidget(this.categoryList);

  Widget _getItemWidget(item) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(75),
          ),
          SizedBox(
            height: 6,
          ),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(230),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: categoryList.map((item) => _getItemWidget(item)).toList(),
      ),
    );
  }
}
