import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
// ignore: unused_import
import 'expenses.dart';
import 'expense.dart';

void main() {
  runApp(MyApp());
}

var myColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 47, 0, 255));


var mydarkColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 47, 0, 255));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData().copyWith(useMaterial3: true,
      appBarTheme:const AppBarTheme().copyWith(backgroundColor: myColorScheme.onPrimaryContainer,foregroundColor: myColorScheme.primaryContainer),
      cardTheme: CardTheme().copyWith(
        color: myColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        
      ),
      elevatedButtonTheme:ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: myColorScheme.primaryContainer)
      ) ,
      textTheme: ThemeData().textTheme.copyWith(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
    )  
      )
      ),

  darkTheme: ThemeData.dark().copyWith(useMaterial3: true,
    
      appBarTheme:const AppBarTheme().copyWith(backgroundColor: mydarkColorScheme.onPrimaryContainer,foregroundColor: mydarkColorScheme.primaryContainer),
    bottomSheetTheme:BottomSheetThemeData().copyWith(
      backgroundColor: mydarkColorScheme.onPrimaryContainer
    ) ,
      cardTheme: CardTheme().copyWith(
        color: mydarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        
      ),
      elevatedButtonTheme:ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: mydarkColorScheme.primaryContainer)
      ) ,
      textTheme: ThemeData().textTheme.copyWith(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
    )  
      )
      ),



      debugShowCheckedModeBanner: false,
      title: "flutter solve problem",
      color: Colors.pink,
      home: expenses(),
      routes: {},
    );
  }
}
