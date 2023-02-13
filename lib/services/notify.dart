
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../model/taskModel.dart';
import '../screen/notifi_screen.dart';

class NotificationService {
  static final NotificationService _notificationService =
  NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  NotificationService._internal();



  Future<void> initNotification() async {

    // Android initialization
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    _configureLocalTimezone();
    // ios initialization
    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);
    // the initialization settings are initialized after they are setted
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,onSelectNotification:selectNotification

     );



  }

  Future<void> showNotification(int h,int m, Task task) async {
    print(h.toString()+':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'+m.toString());
    await flutterLocalNotificationsPlugin.zonedSchedule(
      task.id!.toInt(),
      task.title,
     task.note,

      _converTime(h-3,m,int.parse(task.date.toString().split('/')[1])),

      // tz.TZDateTime.now(tz.getLocation('America/Detroit')).add(const Duration(seconds: 5)),
      const NotificationDetails(
          android: AndroidNotificationDetails('your channel id',
              'your channel name')


      ),


      // Type of time interpretation
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents:task.repeat =='يومي'? DateTimeComponents.time:DateTimeComponents.dateAndTime,
        payload: "${task.title}|+${task.note}|+${task.endTime}|+${task.color}"
      // To show notification even when the app is closed
    );
  }

  Future<void> deletedNotification(int taskId)async{
    // cancel the notification with id value of zero
    await flutterLocalNotificationsPlugin.cancel(taskId.toInt());
    print("----------------------------------------------------------------conseld task $taskId");
  }





  tz.TZDateTime _converTime(int h , int m,int d){

    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate= tz.TZDateTime(tz.local,now.year,now.month,d,h,m);
    if (scheduleDate.isBefore(now)){
     // print(scheduleDate.toString()+"66========================="+now.toString());
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    print(scheduleDate.toString()+"========================="+now.toString());
    return scheduleDate;
  }


  Future <void> _configureLocalTimezone()async{
    tz.initializeTimeZones();
    final String timezone=await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timezone));
  }


  Future selectNotification(String? payload)async{

    if(payload !=null){

    }else{

    }
    Get.to(()=> NotifyScreen(details:payload!));
  }


//  Future selectNotification(String payload) async {
//    if (payload != null) {
//      print('notification payload: $payload');
//    } else {
//      print("No plaload");
//    }
//
//    if(payload=="Theme Changed"){
//    }else{
//
//
//    }
//    Get.to(()=>NotifyScreen(details: payload));
//  }
//
//

}












