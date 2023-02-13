// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/const_colors.dart';
import '../core/theme/theme.dart';



class NotifyScreen extends StatelessWidget {
  final String?  details;


  const NotifyScreen({super.key, required this.details});
  @override
  Widget build(BuildContext context) {


      return Scaffold(


      body: Column(
        children: [
          SizedBox(height: 100,),
          //app bar
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Text('تفاصيل المهمة',style: TextStyle(color:ThemeService().isSavedDarkMode()?Constants.White:Constants.grey,fontSize: 25),),
                Spacer(),
                InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.close,color:ThemeService().isSavedDarkMode()?Constants.White:Constants.grey))
              ],
            ),

          ),
          SizedBox(height: 40,),
          Container(
            padding:
            EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 12),
            child: Container(
              padding: EdgeInsets.all(16),
              //  width: SizeConfig.screenWidth * 0.78,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: _getBGClr(int.parse(details!.split("|")[3])!=null?int.parse(details!.split("|")[3]):0),
              ),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details!.split('|')[0]??"",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: "task!.isCompleted" == 1 ?TextDecoration.lineThrough:null,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey[200],
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            details!.split("|")[2]??"",
                            style: TextStyle(fontSize: 13, color: Colors.grey[100]),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        details![1]??"",
                        style:TextStyle(fontSize: 15, color: Colors.grey[100]),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 60,
                  width: 0.5,
                  color: Colors.grey[200]!.withOpacity(0.7),
                ),

              ]),
            ),
          ),
        ],
      )
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return Constants.primaryColor;
      case 1:
        return Constants.GREEN;
      case 2:
        return Constants.OrangeIcon;
      case 3:
        return Constants.PurpleAccent;
      case 4:
        return Constants.PurpleShadow;
      case 5:
        return Constants.YellowIcon;
      default:
        return Constants.PurpleAccent;
    }
  }
}
