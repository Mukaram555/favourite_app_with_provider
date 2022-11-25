import 'package:favouriteapp/provider/favourite_item_provider.dart';
import 'package:favouriteapp/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create: (_) => FavouriteItemProvider()),
      ChangeNotifierProvider(create: (_)=>ThemeProvider()),
    ],
      child:Builder(builder: (BuildContext context){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: Provider.of<ThemeProvider>(context).themeData,
          home: const FavouriteApp(),
        );
      })
    );
  }
}
