// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, duplicate_ignore, avoid_unnecessa_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, prefer_is_empty

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
import 'package:url_launcher/url_launcher.dart';
import '../components/categories.dart';
import '../components/category_card.dart';
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
  final Uri urlsnap = Uri.parse('https://www.snapchat.com/add/ve1111.1');
  final Uri urlinst = Uri.parse('https://www.instagram.com/ve1111.1/');

  late TextEditingController searchCon;
  var notifyHelper;
  int taskComplate=0;
  int tab=0;
  final box = GetStorage();
  bool all =false;
  bool tea =false;
  bool crk =false;
  bool thrh =false;
  bool shb =false;
  bool moh =false;


  List<ProductCard> productlist = [
    ProductCard(
      title: 'شاهي على الحطب ',
      subTitle: 'في كوب زجاج ',
      imageUrl: 'assets/images/blog-1.jpg',
      price: '5 ',
    ),
    ProductCard(
      title: 'شاهي على الحطب ',
      subTitle: 'في كوب ورق  ',
      imageUrl: 'assets/images/blog-1.jpg',
      price: '4 ',
    ),
    ProductCard(
      title: 'كرك  ',
      subTitle: 'في كوب ورق  ',
      imageUrl: 'assets/images/milk.jpg',
      price: '4 ',
    ),
    ProductCard(
      title: 'كرك  ',
      subTitle: 'في كوب زجاج ',
      imageUrl: 'assets/images/milk.jpg',
      price: '5 ',
    ),

    ProductCard(
      title: 'شاي بحليب  ',
      subTitle: 'في كوب زجاج ',
      imageUrl: 'assets/images/teamilk.jpg',
      price: '5 ',
    ),
    ProductCard(
      title: 'شاي بحليب  ',
      subTitle: 'في كوب ورق  ',
      imageUrl: 'assets/images/teamilk.jpg',
      price: '4 ',
    ),
    ProductCard(
      title: 'مهيتو فراولة  ',
      subTitle: 'مهيتو بنكهة الفراولة  ',
      imageUrl: 'assets/images/fro.jpeg',
      price: '10 ',
    ),

    ProductCard(
      title: 'مهيتو توت ازرق  ',
      subTitle: 'مهيتو بنكهة التوت الازرق  ',
      imageUrl: 'assets/images/tott.jpeg',
      price: '10 ',
    ),
    ProductCard(
      title: 'مهيتو مشكل  ',
      subTitle: 'مهيتو مشكل بجميع الفواكه  ',
      imageUrl: 'assets/images/mo.jpg',
      price: '10 ',
    ),



    ProductCard(
      title: 'ذرة',
      subTitle: 'ذرة مشوية   ',
      imageUrl: 'assets/images/thrh.jpeg',
      price: '6 ',
    ),

    ProductCard(
      title: 'سمبوسة ع الفحم 7  ',
      subTitle: '7 حبات سمبوسة ع الفحم ب 10 ريال  ',
      imageUrl: 'assets/images/smb.jpeg',
      price: '10 ',
    ),

    ProductCard(
      title: 'سمبوسة ع الفحم 10  ',
      subTitle: '10 حبات سمبوسة ع الفحم ب 15 ريال  ',
      imageUrl: 'assets/images/smb.jpeg',
      price: '15 ',
    ),

    ProductCard(
      title: 'شباتي ',
      subTitle: 'شباتي جبن مع بطاطس عمان ',
      imageUrl: 'assets/images/sh3.jpg',
      price: '5 ',
    ),

    ProductCard(
      title: 'شباتي نوتيلا ',
      subTitle: 'شباتي مع نوتيلا  ',
      imageUrl: 'assets/images/sh1.jpg',
      price: '5 ',
    ),

    ProductCard(
      title: 'شباتي  ',
      subTitle: 'شباتي مع جبن ساده  ',
      imageUrl: 'assets/images/sh2.jpg',
      price: '5 ',
    ),
  ];

  List<SpecialOfferCard> Spichalproductlist = [
    SpecialOfferCard(
      title: 'شباتي',
      subTitle: 'خذ 5 شباتي واحصل على كوب قهوة عربي مجاناً',
      imageUrl: 'assets/images/blog-1.jpg',
      price: '3 ',
    ),
    SpecialOfferCard(
      title: 'ذرة',
      subTitle: 'اشتر 4 ذرة واحصل على شاهي مجانا',
      imageUrl: 'assets/images/blog-2.jpg',
      price: '3 ',
    ),

  ];

  // This list holds the data for the list view
  List<ProductCard> _productlist = [];
  @override
  void initState() {

    searchCon = TextEditingController();
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.maxFinite,
          height: 80,
          decoration: BoxDecoration(
            color: Constants.White,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Row(children: [
            Spacer(),
            InkWell(
              onTap: (){
                tab=0;
                setState(() {

                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home_filled,color: tab==0?Colors.blue:Colors.grey,),
                  Text('الرئيسية',style: TextStyle(color: tab==0?Colors.blue:Colors.grey,),)
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: (){
                tab=1;
                setState(() {

                });
              },

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_task,color: tab==1?Colors.blue:Colors.grey,),
                  Text('حساباتنا',style: TextStyle(color: tab==1?Colors.blue:Colors.grey,),)
                ],
              ),
            ),
            Spacer(),


          ],),
        ),
      ),

      body:tab==0?ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/28,),
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
          child: TextFormField(


            controller: searchCon,
            onChanged: (valu){
              _runFilter(valu);
            //  searchCon.text=valu;
            },

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
          SizedBox(
            height: 60,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              children: [
                CategoryItem(

                  onTap: (){
                    _runFilter('');
                     all=true;
                     moh=false;
                     thrh=false;
                     shb=false;
                     crk=false;
                     tea=false;
                    setState(() {


                    });
                  },
                  iconData: 'assets/coffee-svgrepo-com.svg',
                  title: 'الكل',
                 isSelected: all,
                ),
                CategoryItem(

                 onTap: (){
                   all=false;
                   moh=false;
                   thrh=false;
                   shb=false;
                   crk=false;
                   tea=true;
                   _runFilter('شاهي');
                   setState(() {

                   });
                 },
                    iconData: 'assets/coffee-svgrepo-com.svg',
                    title: 'شاي',
                    isSelected: tea,
                  ),
                CategoryItem(
                  onTap: (){
                    all=false;
                    moh=false;
                    thrh=false;
                    shb=false;
                    crk=true;
                    tea=false;
                    _runFilter('كرك');

                    setState(() {

                    });
                  },
                  iconData: 'assets/coffee-svgrepo-com.svg',
                  title: 'كرك',
                  isSelected: crk,
                ),
                CategoryItem(
                  onTap: (){
                    all=false;
                    moh=false;
                    thrh=true;
                    shb=false;
                    crk=false;
                    tea=false;

                    _runFilter('ذرة');
                    setState(() {

                    });
                  },
                  iconData: 'assets/coffee-cup-coffee-svgrepo-com.svg',
                  title: 'ذرة',
                  isSelected: thrh,
                ),
                CategoryItem(
                  onTap: (){
                    all=false;
                    moh=false;
                    thrh=false;
                    shb=true;
                    crk=false;
                    tea=false;
                    _runFilter('شباتي');
                    setState(() {

                    });
                  },
                  iconData: 'assets/food.svg',
                  title: 'شباتي',
                  isSelected: shb,
                ),
                CategoryItem(
                  onTap: (){
                    all=false;
                    moh=true;
                    thrh=false;
                    shb=false;
                    crk=false;
                    tea=false;
                    _runFilter('مهيتو');
                    setState(() {

                    });
                  },
                  iconData: 'assets/food.svg',
                  title: 'مهيتو',
                  isSelected: moh,
                )
              ],
            ),
          ),
          SizedBox(height: 16,),
          Container(

            height:!kIsWeb? MediaQuery.of(context).size.height*0.45:
           MediaQuery.of(context).size.height*0.6,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),


              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 5.5,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2),
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

          // const Padding(
          //   padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          //   child: Text(
          //     'العروض المميزة',
          //     style: TextStyle(
          //         color: Colors.black,
          //         fontWeight: FontWeight.w900,
          //         fontSize: 18),
          //   ),
          // ),
          // Container(
          //   height: MediaQuery.of(context).size.height*0.2,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //
          //
          //     child: Padding(
          //       padding: const EdgeInsets.all(0.0),
          //       child: ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           itemCount: Spichalproductlist.length,
          //           itemBuilder: (BuildContext context, int index) {
          //             return Padding(
          //               padding: const EdgeInsets.all(10.0),
          //               child: Container(
          //
          //                   child: Spichalproductlist[index]),
          //             );
          //           }),
          //     ),
          //   ),
          // ),

        ],
      ):ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/28,),
          const Header(),

          InkWell(
            onTap: () async{
              final bool nativeAppLaunchSucceeded = await launchUrl(
                urlsnap,
                mode: LaunchMode.externalNonBrowserApplication,
              );
              if (!nativeAppLaunchSucceeded) {
                await launchUrl(
                  urlsnap,
                  mode: LaunchMode.inAppWebView,
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.2,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8)
                ),

                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                           height: 100,
                          width: 100,
                          child: Image.asset('assets/images/snap.png')),
                      Text(
                        'سناب شات',style: TextStyle(
                        color: Colors.black,fontSize: 30
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async{
              final bool nativeAppLaunchSucceeded = await launchUrl(
                urlinst,
                mode: LaunchMode.externalNonBrowserApplication,
              );
              if (!nativeAppLaunchSucceeded) {
                await launchUrl(
                  urlinst,
                  mode: LaunchMode.inAppWebView,
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.2,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(8)
                ),

                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                          height: 100,
                          width: 100,
                          child: Image.asset('assets/images/inst.png')),
                      Text(
                        'انستقرام',style: TextStyle(
                          color: Colors.black,fontSize: 30
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )


        ],
      ),
    );
  }




}

