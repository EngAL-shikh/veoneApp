import 'package:flutter/material.dart';
import 'package:mhami/core/const_colors.dart';


class Button extends StatelessWidget {
  @override

  final text;
  final widght;
  final hight;
  final onTap;
  final color;

  const Button({super.key, required this.text,  this.widght,  this.hight, this.onTap, this.color});
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: widght,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color
        ),
        child: Center(
          child: Text(
            text,style: TextStyle(fontSize: 20,color: Constants.White),
          ),
        ),
      ),
    );
  }
}
