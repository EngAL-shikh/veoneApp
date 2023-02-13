import 'package:flutter/material.dart';
import 'package:mhami/core/utils/config_size.dart';

class HorzintalSpace extends StatelessWidget {
  const HorzintalSpace({Key? key, this.value}) : super(key: key);

  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultSize!*value!,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({Key? key, this.value}) : super(key: key);

  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize!*value!,
    );
  }
}
