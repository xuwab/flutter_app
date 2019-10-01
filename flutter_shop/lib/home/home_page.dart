import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/home/car/car_page.dart';
import 'package:flutter_shop/home/main/main_page.dart';
import 'package:flutter_shop/home/profile/profile_page.dart';
import 'package:flutter_shop/home/search/search_page.dart';
import 'package:flutter_shop/util/tool_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> _bottomBarItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        title: Text(
          'Home',
        )),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
        ),
        title: Text(
          'Search',
          style: TextStyle(
          ),
        )),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_cart,
      ),
      title: Text('Car',
          style: TextStyle(
          )),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
      ),
      title: Text('Profile',
          style: TextStyle(
          )),
    ),
  ];

  final List<Widget> _pageList = [
    MainPage(),
    SearchPage(),
    CarPage(),
    ProfilePage()
  ];

  int _currentIndex = 0;

  var _currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPage = _pageList[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    ToolUtils.initScreenUtil(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Shop'),
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomBarItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _currentPage = _pageList[_currentIndex];
          });
        },
      ),
    );
  }
}
