// ignore_for_file: file_names, prefer_typing_uninitialized_variables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mhami/core/const_colors.dart';
import 'package:mhami/core/theme/theme.dart';


class InputButoon extends StatelessWidget {
  final title;
  final hint;
  final TextEditingController? controller;
  final width;
  final hight;
  final widget  ;

  const InputButoon({super.key, required this.title, required this.hint,  this.controller, this.width, this.hight, this.widget});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0,left: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(title,style: TextStyle(fontSize: 15,color:ThemeService().isSavedDarkMode()?Constants.White:Constants.grey,),),
          ),
          const SizedBox(height: 4,),
          Container(
            height: hight,
            width: width,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
                  color: ThemeService().isSavedDarkMode()?Constants.grey.withOpacity(0.2):Constants.dark.withOpacity(0.2),
            ),
           child:  Row(
             children: [
               Expanded(
                 flex:2,
                 child: TextFormField(
                     readOnly: widget==null?false:true,
                   controller: controller,

                   decoration:  InputDecoration(
                     border: InputBorder.none,
                     labelText: '',
                     hintText: "    $hint",
                     hintStyle: TextStyle(fontSize: 13,color: ThemeService().isSavedDarkMode()?Constants.White:Constants.grey)
                   ),
                 ),
               ),
               Expanded(
                 flex:1,
                 child: widget==null?Container(height: 40,width: 40,):Container(height: 40,width: 80,
                   child: widget,),
               ),
             ],
           ),
          ),
        ],
      ),
    );
  }
}
