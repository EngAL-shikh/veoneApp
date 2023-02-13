

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maps_launcher/maps_launcher.dart';



import '../core/theme/theme.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          Row(
            children:  [
              Icon(
                Icons.location_on_sharp,
                color: ThemeService().themelight().primaryColor,
              ),
              Text(
                'السعودية ,الاحساء ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          InkWell(
            onTap: (){

              MapsLauncher.launchCoordinates(25.300037829222966, 49.527525365150915);

            },
            child: Icon(
              Icons.my_location,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
