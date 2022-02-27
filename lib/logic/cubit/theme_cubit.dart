import 'package:bloc/bloc.dart';
import 'package:blocs/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/themes/app_themes.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light)){
    updateAppTheme();
  }

  void updateAppTheme(){
    SchedulerBinding.instance?.window.platformBrightness;

    final Brightness? currentBrightness = AppTheme.currentSystemBrightness;
    currentBrightness == Brightness.light
        ? _setTheme(ThemeMode.light)
        : _setTheme(ThemeMode.dark);
  }

  void _setTheme(ThemeMode themeMode) {
    AppTheme.setStatusBarAndNavigationBarColors(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }


}
