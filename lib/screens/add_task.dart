import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_color.dart';
import 'package:task_manager/widgets/button_widget.dart';
import 'package:task_manager/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController();
    TextEditingController taskController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const  EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/addtask1.jpg"
            ))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 60,),
                IconButton(
                  onPressed: () {
                    Get.back();
                  }, 
                  icon: const Icon(                    
                    Icons.arrow_back,
                    color: AppColors.secondaryColor,
                      )
                  )
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                  controller: nameController, 
                  textHint: "Add Task", 
                ),

                const SizedBox(height: 20,),

                TextFieldWidget(
                controller: taskController, 
                textHint: "Task Details", 
                borderRadius: 15,
                maxLines: 3,
                ),

                const SizedBox(height: 30,),

                ButtonWidget(
                  backgroundColor: AppColors.mainColor, 
                  text: "Add", 
                  textColor: Colors.white
                  )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/20,
            )
          ],
        ),
      ),
    );
  }
}