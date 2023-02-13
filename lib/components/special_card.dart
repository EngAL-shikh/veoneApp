

import 'package:flutter/material.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key, required this.imageUrl, required this.title, required this.subTitle, required this.price,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String subTitle;
  final String price;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;    return Container(
      height: 125,
      width: size.width*1,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(3, 5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:const EdgeInsets.all(4),
            width: 125,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imageUrl)
                )),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.pinkAccent.withOpacity(.7),
                  ),
                  child:  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    subTitle,

                    maxLines: 4,

                    style: TextStyle(
                        fontSize: 16,
                    height: 1.5),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
