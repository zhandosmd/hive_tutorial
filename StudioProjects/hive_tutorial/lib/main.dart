import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_tutorial/example/example_widget.dart';

import 'example/example_widget_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // must have if our main is async, otherwise errors
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExampleWidget(),
    );
  }
}

