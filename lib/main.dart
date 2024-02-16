import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gittask/app/repositories/models/user.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app/repositories/models/task.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();

  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(TaskAdapter());

  await Hive.openBox<User>('users');

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
