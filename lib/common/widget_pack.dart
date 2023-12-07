import 'package:flutter/material.dart';
import 'package:get/get.dart';

class wp {
  static IconButton appbarBackbtn = IconButton(
    icon: const Icon(
      Icons.arrow_back,
      color: Colors.white,
      size: 40,
    ),
    onPressed: () {
      Get.back();
    },
  );
}