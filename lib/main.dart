import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:task_manager/controllers/data_controller.dart';
import 'package:task_manager/screens/home_screen.dart';

import 'screens/view_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  loadData() async {
    await Get.find<DataController>().getData();
  }
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController()); 
    loadData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TasK Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
 