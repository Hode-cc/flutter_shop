import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HomeCategory.dart';
import 'package:hm_shop/components/Home/HomeHot.dart';
import 'package:hm_shop/components/Home/HomeMoreList.dart';
import 'package:hm_shop/components/Home/HomeSlider.dart';
import 'package:hm_shop/components/Home/HomeSuggestion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> getScrollWidgets() {
    return [
      SliverToBoxAdapter(child: HomeSlider()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HomeCategory()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HomeSuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HomeHot()),
              SizedBox(width: 10),
              Expanded(child: HomeHot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HomeMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: getScrollWidgets());
  }
}
