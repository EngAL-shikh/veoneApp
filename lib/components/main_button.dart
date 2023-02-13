

import 'package:flutter/material.dart';
import 'package:mhami/screen/homepage.dart';

import '../core/theme/theme.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  MyHomePage()));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: ThemeService().themelight().primaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: const Text('انتقل للرئيسية',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18)),
      ),
    );
  }
}
