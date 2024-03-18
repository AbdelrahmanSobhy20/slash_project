import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slashtraining/features/home/presentation/screens/home_screen.dart';
import 'package:slashtraining/features/product_details/presentation/manager/sql_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (BuildContext context) {
        return SQLProvider();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomeScreen()
          ),
    );
  }
}
