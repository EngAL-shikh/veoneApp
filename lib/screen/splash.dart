import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/image_slider.dart';
import '../components/main_button.dart';
import '../core/const_colors.dart';
import '../core/theme/theme.dart';
import 'homepage.dart';
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 2), () {
      Get.to(()=>MyHomePage(),transition :Transition.fadeIn,duration: Duration(seconds: 1));
    });
    final controller = PageController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/wallpaper.jpg'))),
        // child: Column(
        //   children: [
        //     const Spacer(
        //       flex: 2,
        //     ),
        //     // SizedBox(
        //     //   height: size.height / 2,
        //     //   child: PageView.builder(
        //     //     controller: controller,
        //     //     scrollDirection: Axis.horizontal,
        //     //     itemBuilder: (context, index) {
        //     //       return const SingleChildScrollView(child: ImageSlider());
        //     //     },
        //     //     itemCount: 3,
        //     //   ),
        //     // ),
        //     // Padding(
        //     //   padding: const EdgeInsets.all(8),
        //     //   child: SmoothPageIndicator(
        //     //     controller: controller,
        //     //     count: 3,
        //     //     effect: WormEffect(
        //     //       activeDotColor: Constants.primaryColor,
        //     //       dotColor: Constants.darkColor.withOpacity(0.3),
        //     //
        //     //       dotHeight: 12,
        //     //       dotWidth: 12,
        //     //       type: WormType.normal,
        //     //       // strokeWidth: 5,
        //     //     ),
        //     //   ),
        //     // ),
        //     const Spacer(),
        //     const MainButton(),
        //     const Spacer(),
        //   ],
        // ),
      ),
    );


  }
}
class WaveClipper extends CustomClipper<Path> {
  final double waveDeep;
  final double waveDeep2;


  WaveClipper({this.waveDeep = 100,this.waveDeep2 = 0});
  @override
  Path getClip(Size size) {
    final double sw = size.width;
    final double sh = size.height;

    final Offset controlPoint1 = Offset(sw * .25 , sh -waveDeep2*2);
    final Offset destinationPoint1 = Offset(sw * .5  , sh - waveDeep- waveDeep2);

    final Offset controlPoint2 = Offset(sw * .75 , sh  - waveDeep*2 );
    final Offset destinationPoint2 = Offset(sw  , sh - waveDeep);

    final Path path = Path()
      ..lineTo(0, size.height-waveDeep2)
      ..quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, destinationPoint1.dx, destinationPoint1.dy
      )
      ..quadraticBezierTo(controlPoint2.dx, controlPoint2.dy ,destinationPoint2.dx, destinationPoint2.dy
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}