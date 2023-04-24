import 'package:flutter/material.dart';
import 'package:task_manager/screens/add_task.dart';
import 'package:task_manager/screens/view_task.dart';
import 'package:task_manager/utils/app_color.dart';
import 'package:task_manager/widgets/button_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/welcome.jpg"
              )
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              RichText(
              text: const TextSpan(
                text: "Hello",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold
                ),
                children:[
               TextSpan(
                text: "\nLet's get your day started",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 15,
                )),
                ]
              )
            ),
            SizedBox(height: MediaQuery.of(context).size.height/2.5),
            InkWell(
              onTap: () {
                Get.to(
                  () => const AddTask(),
                  transition: Transition.zoom,
                  duration: const Duration(microseconds: 500)
                );
              },
              child: ButtonWidget(
                backgroundColor: AppColors.mainColor, 
                text: "Add Task", 
                textColor: Colors.white
                ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                 Get.to(
                  () => const AllTask(), 
                  transition: Transition.fade,
                  duration: const Duration(seconds: 1)
                  );
              },
              child: ButtonWidget(
                backgroundColor: Colors.white, 
                text: "View Task", 
                textColor: AppColors.samllTextColor
                ),
            )
          ],
        )
      ),
    );
  }
}