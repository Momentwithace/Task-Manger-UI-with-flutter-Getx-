import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_color.dart';

class TextFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final String textHint;
  final double? borderRadius;
  final int? maxLines;
    const TextFieldWidget({super.key,
      required this.controller, 
      required this.textHint, 
      this.borderRadius = 30,
      this.maxLines = 1, 
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
          maxLines: maxLines,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.textHolder,
            hintText: textHint,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1
              )
            ),
            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1
            )
          )
          ),
        );
  }
}