import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_color.dart';
import 'package:task_manager/widgets/button_widget.dart';
import 'package:task_manager/widgets/task_widget.dart';
import 'package:get/get.dart';

class AllTask extends StatelessWidget {
  const AllTask({super.key});

  @override
  Widget build(BuildContext context) {
    List myData = [
      "Try Smarter",
      "Try Your Best"
    ];

    final leftEdition = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3235) .withOpacity(0.5),
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );

     final rightEdition = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent.withOpacity(0.5),
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white ,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft ,
            padding:const EdgeInsets.only(left: 20, top: 60),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height/3.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/header.jpg" 
                )
                )
            ),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
               ),
            ),
          ),
          Container(
            padding:const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                const Icon(Icons.home,
                color: AppColors.secondaryColor,),
                const SizedBox(width: 10,),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black
                  ),
                  child:const Icon(Icons.add,
                  color: Colors.white,
                  size: 20,),
                ),
                Expanded(child: Container()),
                const Icon(Icons.calendar_month_sharp,
                color: AppColors.secondaryColor,),
                const SizedBox(width: 10,),
                const Text("2", 
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.secondaryColor
                ),)
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index){
                return Dismissible(
                  background: leftEdition,
                  secondaryBackground: rightEdition,
                  onDismissed: (DismissDirection direction) {
                    print("After Dismiss");
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    if(direction == DismissDirection.startToEnd){
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.transparent,
                        context: context, 
                        builder: (_){
                          return Container(
                            height: 500,
                            decoration:  BoxDecoration(
                              color: const Color(0xfF2e3253).withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonWidget(
                                  backgroundColor: AppColors.mainColor, 
                                  text: "View", 
                                  textColor: Colors.white
                                  ),
                                  const SizedBox(height: 20,),
                                  ButtonWidget(
                                  backgroundColor: AppColors.mainColor, 
                                  text: "Edit", 
                                  textColor: Colors.white
                                  )  
                                ],
                              ),
                            ),
                          );
                        }
                        );
                      return false;
                    }else {
                      return Future.delayed(const Duration(seconds: 1), 
                      () => direction == DismissDirection.endToStart
                       );
                    }
                  },
                  key: ObjectKey(index),
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: TaskWidget(
                      text: myData[index], 
                      color: Colors.blueGrey
                      ) ,
                  ),
                );
              }
              ),
          )
        ],
      ),
    );
  }
}