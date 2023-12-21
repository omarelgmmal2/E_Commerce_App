import 'dart:io';
import 'package:e_commerce_app/view/home_page/view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'shared/logic/helper_methods.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBS5e_ZP1L5dz29xoeK_GX6Cwaks826iOs",
        appId: "1:1084853035261:android:b53d4c055eba9a5d225e94",
        messagingSenderId: "1084853035261",
        projectId: "my-e-commercial-app-9e226",
    )
  ) : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E_Commerce",
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xffB77874),
            fixedSize: const Size.fromHeight(50),
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
