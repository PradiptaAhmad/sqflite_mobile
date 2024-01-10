import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite/models/user_model.dart';
import 'package:flutter_sqflite/pages/homepage_view.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AddDataController extends GetxController {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Database? database;

  void addUser() async {
    String table = "user";
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);

    UserModel userModel = UserModel(
      nama: namaController.text,
      email: emailController.text,
    );

    await database!.insert(table, userModel.toJson());
    Get.offAll(HomePageView());
  }
}
