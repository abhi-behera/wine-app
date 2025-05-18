import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'connectivity_event.dart';
import 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _connectivitySubscription;

  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectivityChanged>((event, emit) {
      if (event.isConnected) {
        emit(ConnectivityOnline());
      } else {
        emit(ConnectivityOffline());
      }
    });

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      result,
    ) {
      add(ConnectivityChanged(result[0] != ConnectivityResult.none));
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
