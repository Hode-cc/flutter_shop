import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeSuggestion extends StatefulWidget {
  final SpecialRecommend specialRecommend;
  const HomeSuggestion({super.key, required this.specialRecommend});

  @override
  State<HomeSuggestion> createState() => _HomeSuggestionState();
}

class _HomeSuggestionState extends State<HomeSuggestion> {
  List<GoodsItem> goodItems() {
    if (widget.specialRecommend.subTypes.isEmpty) {
      return [];
    }
    return widget.specialRecommend.subTypes.first.goodsItems?.items
            ?.take(3)
            .toList() ??
        [];
  }

  Widget buildHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 86, 24, 20),
          ),
        ),
        SizedBox(width: 10),
        Text("精选省攻略", style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget buildLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_inner.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> getChildrenList() {
    List<GoodsItem> list = goodItems();
    return List.generate(list.length, (int index) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) {
                return Image.asset("lib/assets/home_cmd_sm.png");
              },
              list[index].picture,
              width: 80,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "￥${list[index].price}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        alignment: Alignment.center,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("lib/assets/home_cmd_sm.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            buildHeader(),
            SizedBox(height: 10),
            Row(
              children: [
                buildLeft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: getChildrenList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
