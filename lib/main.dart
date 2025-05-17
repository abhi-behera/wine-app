import 'package:flutter/material.dart';
import 'package:wineapp/catagory/catagory_bloc.dart';
import 'package:wineapp/catagory/catagory_event.dart';
import 'package:wineapp/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(

    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //   ),
    //   home: HomePage(),
    // );

    return BlocProvider(
      create:
          (context) =>
              BottleBloc()..add(FetchBottles()), // fetch data immediately
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bottle Collection',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: HomePage(),
      ),
    );
  }
}
