import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/home/home_page.dart';
import 'package:flutter_shop/util/tool_util.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'Flutter Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
        home: HomePage(),
      ),
    );
  }
}
