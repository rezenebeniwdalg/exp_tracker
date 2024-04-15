import 'package:exp_tracker/controller/homecontroller.dart';
import 'package:exp_tracker/view/home/homescr.dart';
import 'package:flutter/material.dart';

Future<void> main()async{
WidgetsFlutterBinding.ensureInitialized();
  await Homescrcontroller.initdb();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homescr(),
    );
  }
}