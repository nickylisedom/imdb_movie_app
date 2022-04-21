import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'network/Api_Service.dart';
import 'ui/MainScreen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context)=>ApiService.create(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // primarySwatch: Colors.blue,
          ),
          home: const MainScreen()
      ),
    );
  }
}