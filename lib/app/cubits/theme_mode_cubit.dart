import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit() : super(ThemeMode.dark);

  void toggleThemeMode() {
    emit(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }
}
