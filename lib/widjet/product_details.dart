
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/const_colors.dart';
import '../core/theme/theme.dart';

class ProducDetailsScreen extends StatelessWidget {
  String title,subtitle,imageUrl;
   ProducDetailsScreen({Key? key,required this.title ,required this.subtitle ,required this.imageUrl}) : super(key: key);

  //final parguments = Get.arguments;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(children: [
        Image.asset(
            imageUrl,
            height: MediaQuery.of(context).size.height * 0.8,
            width: double.infinity,
            fit: BoxFit.cover),
        DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.8,
            builder: (context, controller) {
              return Container(
                decoration: BoxDecoration(
                    color: Constants.whiteColor,
                    borderRadius: BorderRadius.circular(25)),
                child: ListView(
                  controller: controller,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("الخيارات المتوفره",
                          style: TextStyle(
                              color: Constants.darkColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 22)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 30,
                      ),
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          Text('صغير',
                              style: TextStyle(
                                  color: Constants.darkColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          SizedBox(
                            height: 40,
                            child: VerticalDivider(
                              color: Colors.black45,
                            ),
                          ),
                          Text('متوسط',
                              style: TextStyle(
                                  color: Constants.darkColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          SizedBox(
                            height: 40,
                            child: VerticalDivider(
                              color: Colors.black45,
                            ),
                          ),
                          Text('كبير',
                              style: TextStyle(
                                  color: Constants.darkColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ],
                      ),
                    ),

                    //const SizeListSection(),
                    const Padding(
                      padding: EdgeInsets.all(
                        20
                      ),
                      child: Text("التفاصيل",
                          style: TextStyle(
                              color: Constants.darkColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 22)),
                    ),
                     Padding(
                      padding: EdgeInsets.only(
                          left: 30.0, top: 10, bottom: 10, right: 30),
                      child: Text(subtitle,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Constants.darkColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16)),
                    ),
                   // const AddToCartCard(),
                  ],
                ),
              );
            }),

        const Positioned(
            top: 40,
            right: 15,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            )),
         Positioned(
            top: 40,
            left: 15,
            child: InkWell(
             onTap: (){
               Get.back();
             },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ))
      ]),
    );
  }
}
