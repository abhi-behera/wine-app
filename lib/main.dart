import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wineapp/catagory/collection_bloc.dart';
import 'package:wineapp/catagory/collection_event.dart';
import 'package:wineapp/screens/collection.dart';
import 'package:wineapp/connectivity/connectivity_bloc.dart';
import 'package:wineapp/screens/details.dart';
import 'package:wineapp/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wineapp/screens/scanner.dart';
import 'package:wineapp/screens/signIn.dart';
import 'package:wineapp/screens/splash_screen.dart';
import 'package:wineapp/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CollectionBloc>(
          create: (context) => CollectionBloc()..add(FetchBottles()),
        ),
        BlocProvider<ConnectivityBloc>(create: (context) => ConnectivityBloc()),
        // Add more BLoCs here as needed
      ],
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
