
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/theme/theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              size: 24,
            ),
            suffixIcon: Padding(
              padding:  EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: ThemeService().themelight().primaryColorDark,
                child: SvgPicture.asset(
                  'assets/filter.svg',
                  height: 24,
                  color: Colors.white,
                ),
              ),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            enabledBorder:const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: const Color(0xFFF5F5F5)),
      ),
    );
  }
}
