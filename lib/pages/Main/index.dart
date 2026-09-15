import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Card/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/My/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> tabList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png",
      "active_icon": "lib/assets/ic_public_home_active.png",
      "text": "首页",
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png",
      "active_icon": "lib/assets/ic_public_pro_active.png",
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png",
      "active_icon": "lib/assets/ic_public_cart_active.png",
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png",
      "active_icon": "lib/assets/ic_public_my_active.png",
      "text": "我的",
    },
  ];

  int currentIndex = 0;

  List<BottomNavigationBarItem> getTabItems() {
    return List.generate(tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: tabList[index]["text"],
      );
    });
  }

  List<Widget> getTabWidgets() {
    return [HomeView(), CategoryView(), CardView(), MyView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: currentIndex, children: getTabWidgets()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: (int index) {
          currentIndex = index;
          setState(() {});
        },
        currentIndex: currentIndex,
        items: getTabItems(),
      ),
    );
  }
}
