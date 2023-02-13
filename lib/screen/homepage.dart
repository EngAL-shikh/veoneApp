// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, duplicate_ignore, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, prefer_is_empty

import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mhami/core/const_colors.dart';
import 'package:mhami/model/taskModel.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:mhami/screen/addtask.dart';
import 'package:mhami/widjet/Button.dart';
import 'package:mhami/widjet/taskTile.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../components/categories.dart';
import '../components/home_header.dart';
import '../components/product_card.dart';
import '../components/search_bar.dart';
import '../components/special_card.dart';
import '../controllers/task_controller.dart';
import '../core/theme/theme.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../services/notify.dart';
class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TaskController _taskController = Get.put(TaskController());
  DateTime _selectedDate=DateTime.now();

  var notifyHelper;
  int taskComplate=0;

  final box = GetStorage();

  List<ProductCard> productlist = [
    ProductCard(
      title: 'شاهي في ون ',
      subTitle: 'شاهي في ون شاهي على الفحم ',
      imageUrl: 'assets/images/blog-1.jpg',
      price: '3 RY',
    ),
    ProductCard(
      title: 'قهوة عربيه',
      subTitle: 'لعشاق القهوة قهوة عربيه في ون ',
      imageUrl: 'assets/images/blog-2.jpg',
      price: '3 RY',
    ),
    ProductCard(
      title: 'مشروب في ون',
      subTitle: 'مشروب في ون بارد ومنعش ',
      imageUrl: 'assets/images/blog-3.jpg',
      price: '3 RY',
    ),
    ProductCard(
      title: 'شباتي',
      subTitle: 'الذ شباتي ممكن تذوقه بحياتك ',
      imageUrl: 'assets/images/shbati.jpeg',
      price: '3 RY',
    ),
    ProductCard(
      title: 'ذرة',
      subTitle: 'ذرة ع الفحم وعلى طلبك انت  ',
      imageUrl: 'assets/images/thrh.jpeg',
      price: '3 RY',
    ),
  ];

  List<SpecialOfferCard> Spichalproductlist = [
    SpecialOfferCard(
      title: 'شباتي',
      subTitle: 'خذ 5 شباتي واحصل على كوب قهوة عربي مجاناً',
      imageUrl: 'assets/images/blog-1.jpg',
      price: '3 RY',
    ),
    SpecialOfferCard(
      title: 'ذرة',
      subTitle: 'اشتر 4 ذرة واحصل على شاهي مجانا',
      imageUrl: 'assets/images/blog-2.jpg',
      price: '3 RY',
    ),

  ];

  // This list holds the data for the list view
  List<ProductCard> _productlist = [];
  @override
  void initState() {
    _productlist = productlist;
    // TODO: implement initState
    super.initState();
    notifyHelper=NotificationService();
    tz.initializeTimeZones();
//    if(box.read('taskComplatenum')!=null){
//      taskComplate=box.read('taskComplatenum');
//    }

//    notifyHelper.initializeNotification();
//    notifyHelper.requestIOSpermissions();
  }
  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<ProductCard> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = productlist;
    } else {
      results = productlist
          .where((product) =>
          product.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _productlist = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("ar_SA", null).then((_) {
      var now = DateTime.now();
      var formatter = DateFormat.yMMMd('ar_SA');
      print(formatter.locale);
      String formatted = formatter.format(now);
      print(formatted);
    });
    _taskController.getTask();


    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: ThemeService().themelight().primaryColor,
      //   selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      //   unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: SvgPicture.asset(
      //           'assets/home-svgrepo-com.svg',
      //           color: ThemeService().themelight().primaryColor,
      //           height: 25,
      //         ),
      //         label: 'الرئيسية'),
      //     BottomNavigationBarItem(
      //
      //         icon: SvgPicture.asset(
      //           'assets/favourite-svgrepo-com.svg',
      //
      //           height: 25,
      //         ),
      //         label: 'المفضلة',),
      //     BottomNavigationBarItem(
      //         icon: SvgPicture.asset(
      //           'assets/bag-outline-svgrepo-com.svg',
      //           height: 25,
      //         ),
      //         label: 'السلة'),
      //     BottomNavigationBarItem(
      //         icon: SvgPicture.asset(
      //           'assets/profile-svgrepo-com.svg',
      //           height: 25,
      //         ),
      //         label: 'Profile'),
      //   ],
      // ),

      body: ListView(
        children: [
          const Header(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Text(
              'مرحباً بك بتطبيق في ون',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          SizedBox(height: 10,),
         Padding(
          padding: EdgeInsets.only(right: 20.0, left: 20),
          child: TextField(
            onChanged: _runFilter,
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
        ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Text(
              'الاقسام',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const Categories(),
          SizedBox(height: 16,),
          Container(

            height:!kIsWeb? MediaQuery.of(context).size.height*0.4:
            MediaQuery.of(context).size.height*0.6,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),


              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ListView.builder(
                    scrollDirection:Axis.horizontal,
                    itemCount: _productlist.length,

                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(

                            child: _productlist[index]),
                      );
                    }),
              ),
            ),
          ),
          SizedBox(height: 16,),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Text(
              'العروض المميزة',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),


              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Spichalproductlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(

                            child: Spichalproductlist[index]),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }




}

