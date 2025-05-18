import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wineapp/catagory/catagory_bloc.dart';
import 'package:wineapp/catagory/catagory_event.dart';
import 'package:wineapp/collection.dart';
import 'package:wineapp/details.dart';
import 'package:wineapp/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wineapp/scanner.dart';
import 'package:wineapp/signIn.dart';
import 'package:wineapp/splash_screen.dart';
import 'package:wineapp/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottleBloc()..add(FetchBottles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bottle Collection',
        theme: ThemeData(primarySwatch: Colors.teal),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => HomePage(),
          '/welcomeScreen': (context) => WelcomeScreen(),
          '/signIn': (context) => SignInScreen(),
          '/scanner': (context) => ScannerPage(),
          '/catagory': (context) => CollectionPage(),
        },
      ),
    );
  }
}
