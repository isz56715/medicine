import 'package:c_frontend/CPmain/CPmain/CPmain_binding.dart';
import 'package:c_frontend/CPmain/CPmain/CPmain_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CP001/CP001_binding.dart';
import 'CP001/CP001_view.dart';
import 'CP002/CP002_binding.dart';
import 'CP002/CP002_view.dart';
import 'CP003/CP003_binding.dart';
import 'CP003/CP003_view.dart';
import 'CP004/CP004_binding.dart';
import 'CP004/CP004_view.dart';
import 'CP005/CP005_binding.dart';
import 'CP005/CP005_view.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/CPmain',
      getPages: [
        GetPage(name: '/CPmain', page: () => const CPmainView(), binding: CPmainBinding()),
        GetPage(name: '/CP001', page: () => const CP001View(), binding: CP001Binding()),
        GetPage(name: '/CP002', page: () => const CP002View(), binding: CP002Binding()),
        GetPage(name: '/CP003', page: () => const CP003View(), binding: CP003Binding()),
        GetPage(name: '/CP004', page: () => const CP004View(), binding: CP004Binding()),
        GetPage(name: '/CP005', page: () => const CP005View(), binding: CP005Binding()),
      ],
    );
  }
}
