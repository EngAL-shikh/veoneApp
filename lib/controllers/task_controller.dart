

import 'package:get/get.dart';
import 'package:mhami/db/db_helper.dart';
import 'package:mhami/model/taskModel.dart';

class TaskController extends GetxController{

  @override
void onReady(){
  super.onReady();
}

var taskList=<Task>[].obs;

Future<int> addTask({Task? task})async{
    return  await DBhelper.insert(task) ;

}

// fetch all tasks

Future getTask() async{

  List<Map<String,dynamic>> tasks= await DBhelper.query();
  taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());

  print("-------------------------------color"+tasks.length.toString());

}


void deleteTask(Task task){
 var value= DBhelper.delete(task);

 getTask();
 print('deleted done in column number $value');
}

// task completed

void isCompleted(int id)async{
 await DBhelper.update(id);
 getTask();

}




}