import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wineapp/catagory/catagory_event.dart';
import 'package:wineapp/catagory/catagory_state.dart';
import 'package:wineapp/model/Bottle.dart';
import 'package:flutter/services.dart' show rootBundle;

class BottleBloc extends Bloc<BottleEvent, BottleState> {
  BottleBloc() : super(BottleInitial()) {
    on<FetchBottles>((event, emit) async {
      emit(BottleLoading());
      try {
        final data = await rootBundle.loadString(
          'json_data/catagory_data.json',
        );
        final Map<String, dynamic> jsonList = jsonDecode(data);
        final List<Bottle> bottles = List<Bottle>.from(
          jsonList['catagory'].map((x) => Bottle.fromJson(x)),
        );
        emit(BottleLoaded(bottles));
      } catch (e) {
        emit(BottleError('Failed to load data'));
      }
    });
  }
}
