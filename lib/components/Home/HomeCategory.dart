import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeCategory extends StatefulWidget {
  final List<CategoryItem> categoryItems;
  const HomeCategory({super.key, required this.categoryItems});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryItems.length,
        itemBuilder: (context, index) {
          final CategoryItem item = widget.categoryItems[index];
          return Container(
            alignment: Alignment.center,
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 232, 234),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(item.picture, width: 40),
                Text(
                  item.name,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
          );
        },
      ),
    );
  }
}
