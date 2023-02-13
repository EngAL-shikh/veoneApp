
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mhami/components/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        children: [
          CategoryItem(
            iconData: 'assets/coffee-svgrepo-com.svg',
            title: 'شاي',
            isSelected: true,
          ),
          CategoryItem(

            iconData: 'assets/coffee-cup-coffee-svgrepo-com.svg',
            title: 'مشروبات',
            isSelected: false,
          ),
          CategoryItem(
            iconData: 'assets/food.svg',
            title: 'وجبات',
            isSelected: false,
          )
        ],
      ),
    );
  }
}
