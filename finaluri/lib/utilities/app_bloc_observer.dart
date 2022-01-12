
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class AppBlockObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print(change);
    }

    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    if (kDebugMode) {
      print(bloc);
    }

    super.onClose(bloc);
  }


}
