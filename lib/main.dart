// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mhami/db/db_helper.dart';
import 'package:mhami/screen/homepage.dart';
import 'package:mhami/screen/splash.dart';
import 'package:mhami/services/notify.dart';

import 'core/theme/theme.dart';


void main()async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  //await tz.initializeTimeZone();
 // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  WidgetsFlutterBinding.ensureInitialized();
  await  DBhelper.initDb();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mhami',
      theme:ThemeService().themelight(),
      darkTheme:ThemeService().themedark(),
      themeMode: ThemeService().getThemeMode(),
      textDirection: TextDirection.rtl,
      home:  Splash(),
    );
  }
}

