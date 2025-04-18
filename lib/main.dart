import 'package:deliveryapp/dashboard.dart';
import 'package:deliveryapp/login.dart';
import 'package:deliveryapp/navigation.dart';
import 'package:deliveryapp/otpScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/otpScreen': (context) => Otpscreen(),
        '/dashboardScreen': (context) => DashboardScreen(),
        '/navigate':(context)=> MapScreen(),
      },
    );
  }
}
