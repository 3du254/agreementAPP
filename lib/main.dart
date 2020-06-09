import 'package:cars45_app/model/buyer_list_model.dart';
import 'package:cars45_app/model/buyer_model.dart';
import 'package:cars45_app/model/login_model.dart';
import 'package:cars45_app/screens/home/home.dart';
import 'package:cars45_app/screens/wrapper.dart';
import 'package:cars45_app/services/main_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'screens/home/agreement/agreement.dart';
/* void setup() {
  
} */

void main() {
  GetIt.I.registerLazySingleton(() => MainService());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginModel()),
        ChangeNotifierProvider(create: (_) => BuyerListModel()),
        ChangeNotifierProvider(create: (_) => BuyerModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Wrapper(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomeScreen(),
        '/agreement': (BuildContext context) => Agreement(),
      },
    );
  }
}
