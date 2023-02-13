// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mhami/controllers/task_controller.dart';
import 'package:mhami/core/const_colors.dart';
import 'package:mhami/widjet/Button.dart';
import 'package:mhami/widjet/inputButton.dart';

import '../core/theme/theme.dart';
import '../model/taskModel.dart';
class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {


  final TaskController _taskController = Get.put(TaskController());
  TextEditingController _titleText=TextEditingController();
  TextEditingController _notText=TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = "AM 12 :02";
  int selectedColor=0;
  int _selectRemind =5;
  List<int> remindList=[
    5,10,15,20,
  ];

  String _selectRepate ='ابداً';
  List<String> repateList=[
    'ابداً','يومي','اسبوعي','شهري',
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: ListView(
        children: [
          //app bar
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Text('اضافة مهمة',style: TextStyle(color:ThemeService().isSavedDarkMode()?Constants.White:Constants.grey,fontSize: 25),),
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

          InputButoon(hight: 60.0,title: 'عنوان المهمة', hint: 'ادخل عنوان المهمة ', controller: _titleText),
          InputButoon(hight: 60.0,title: 'الوصف', hint: 'ادخل وصف المهمة ', controller: _notText),
         InputButoon(hight: 60.0,title: 'التاريخ', hint: DateFormat.yMd().format(_selectedDate), controller: null,
           widget: IconButton(
             onPressed: (){

               getDatePikr();
             },
             icon:Icon(Icons.date_range,color: Constants.grey),

           )
           ,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InputButoon(title: 'من', hint: _startTime, controller: null,widget: IconButton(
                  onPressed: (){
                     getTimePikr(true);
                  },
                  icon: Icon(Icons.timer_outlined,color: Constants.grey,),
                ),),
              ),
              Expanded(
                flex: 1,
                child: InkWell(

                  child: InputButoon(title: 'الى', hint: _endTime, controller: null,widget: IconButton(
                    onPressed: (){
                      getTimePikr(false);
                    },
                    icon: Icon(Icons.timer_outlined,color: Constants.grey),
                  ),),
                ),
              )
            ],
          ),
          InputButoon(title: "تذكيري", hint: " بعد $_selectRemind   دقيقة ", controller: null,
              widget: DropdownButton(

                  elevation: 4,
                  icon:Icon(Icons.keyboard_arrow_down,color: Constants.grey),
                onChanged: (String? newValu){
                  setState(() {
                    _selectRemind=int.parse(newValu!);
                  });
                },
                  underline: Container(height: 0,),

               items: remindList.map<DropdownMenuItem<String>>((int value){

               return DropdownMenuItem<String>(
               value: value.toString(),
                child: Text(value.toString()),
               );

                    }
              ).toList(),

                onTap: (){


                }






              ),

    ),
          InputButoon(title: "تكرار",hint: "$_selectRepate", controller: null,
            widget: DropdownButton(


                elevation: 4,
                icon:Icon(Icons.keyboard_arrow_down,color: Constants.grey),
                onChanged: (String? newValu){
                  setState(() {
                    _selectRepate=newValu!;
                  });
                },
                underline: Container(height: 0,),

                items: repateList.map<DropdownMenuItem<String>>((String value){

                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString()),
                  );

                }
                ).toList(),

                onTap: (){


                }






            ),

          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('اللون',style: TextStyle(fontSize: 18,color:ThemeService().isSavedDarkMode()?Constants.White:Constants.grey,),),
                ),
                Wrap(
                  children:List<Widget>.generate(
                    6,
                    (int index) {
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedColor=index;
                          });

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor:index==0?
                            Constants.primaryColor:index==1?
                            Constants.GREEN:index==2?
                            Constants.OrangeIcon:index==3?
                            Constants.PurpleAccent:index==4?
                            Constants.PurpleShadow:index==5?
                            Constants.YellowIcon:Constants.PurpleAccent,
                            child: index==selectedColor?Icon(Icons.done,size: 17,):Container(),

                          ),
                        ),
                      );
                    }
                    ,
                  ),
                ),
                SizedBox(height: 20,),
//                Button(text: 'اضافة مهمة',widght: double.maxFinite,
//                  onTap: (){
//                  _valdateData();
//                },color: Constants.primaryColor,)

              ],
            ),
          ),
          SizedBox(height: 100,)
          //title



        ],
      ),
      floatingActionButton: FloatingActionButton.extended(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor:
        Get.isDarkMode ? Constants.primaryColor : Constants.primaryColor,
        onPressed: ()async {
          // Add your onPressed code here!
          await Get.to(()=> AddTask());
          _valdateData();

        },

        label: Text(
          'اضافة المهمة',
          style: TextStyle(
              color: Get.isDarkMode ? Constants.White : Constants.White),
        ),
        icon: Icon(
          Icons.add,
          color: Get.isDarkMode ? Constants.White : Constants.White,
        ),

      ),


    );

  }

  getDatePikr() async{

    DateTime? _getDateTime= await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2025)
    );

    if(_getDateTime!=null){
      setState(() {
        _selectedDate=_getDateTime;
      });

    }
  }

  getTimePikr(bool isStart) async{
  var pikedTime= await _showTimePikr();
  String _formatedTime=pikedTime.format(context);

  if(isStart == null){
    print('time is null');
  }else if(isStart==true){
    setState(() {
      _startTime =_formatedTime;
    });

  }else if(isStart==false)
    {
      setState(() {
        _endTime=_formatedTime;
      });

    }

  }

  _showTimePikr(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
        context: context,

        initialTime: TimeOfDay.now()
    );
  }

  _valdateData(){

    if(_titleText.text.isNotEmpty&&_notText.text.isNotEmpty){


      //data corect
      _addTaskToDb();




     // Get.back();
    }else{
      Get.snackbar('خطاء ', "هناك بيانات لم تقم بتعبئتها",
      snackPosition: SnackPosition.TOP,
        icon: Icon(Icons.error)
      );


    }
  }
  _addTaskToDb()async{

    int value=  await  _taskController.addTask(
        task:Task(
          title: _titleText.text,
          note: _notText.text,
          date: DateFormat.yMd().format((_selectedDate)),
          startTime: _startTime,
          endTime: _endTime,
          remind: _selectRemind,
          repeat: _selectRepate,
          color: selectedColor,
          isCompleted: 0,
        )
    );




    print ("-----------------------------------------------------the id insert $_selectRepate");

    Get.back();
  }

}

