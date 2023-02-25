
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/theme/theme.dart';
import '../widjet/product_details.dart';

class ProductCard extends StatelessWidget {
  ProductCard({Key? key, required this.imageUrl, required this.title, required this.subTitle, required this.price}) : super(key: key);

  final String imageUrl;
  final String title;
  final String subTitle;
  final String price;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProducDetailsScreen(
                title: title,
                subtitle: subTitle,
                imageUrl: imageUrl)
        )
        );
       // Get.to(ProducDetailsScreen(),arguments:{'title':title,'subtitle':subTitle,'image':imageUrl,'price':price});
      },
      child: Container(
        height: MediaQuery.of(context).size.height*0.15,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.3,
              blurRadius: 3,
              offset: const Offset(3, 5),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        width: MediaQuery.of(context).size.width / 2 - 24,
        padding: EdgeInsets.all(4),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  height: MediaQuery.of(context).size.width / 2 - 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image:  DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            imageUrl
                          )                      )),
                ),
                SizedBox(height: 10,),
                 Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 4),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    subTitle,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                 Spacer(),
                 Container(
                   height: 50,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8),
                     color: Colors.blue
                   ),
                   child: Center(
                     child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        price+'ريال  ',
                        style: TextStyle(fontSize: 15,color: Colors.white ),
                      ),
                ),
                   ),
                 ),
              ],
            ),

            Positioned(
                top: 14,
                right: 14,
                child: Container(
                  padding:
                       EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.pinkAccent.withOpacity(.8),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.star, color: Colors.white),
                      Text(
                        '4,5',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
