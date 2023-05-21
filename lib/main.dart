import 'package:flutter/material.dart';
import 'package:fp_tpm_animelist/MainPage.dart';

//Hive
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fp_tpm_animelist/model/loginModel.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //to use hive

  await Hive.initFlutter(); //init flutter

  Hive.registerAdapter(loginDataAdapter()); //daftarin yang .g
  await Hive.openBox<loginData>('loginModel'); //membuka hive

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime List',
      home: MainPage(),
    );
  }
}
