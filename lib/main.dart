import 'dart:developer';

import 'package:blocs/logic/cubit/counter_cubit.dart';
import 'package:blocs/logic/cubit/theme_cubit.dart';
import 'package:blocs/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'core/constant/string.dart';
import 'core/themes/app_themes.dart';
import 'package:path_provider/path_provider.dart';
import 'logic/debug/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(
          () =>  runApp(const App()),
          storage: storage
  );

}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
            create: (_) => ThemeCubit()
        ),
        BlocProvider<CounterCubit>(
            create: (context) => CounterCubit()
        ),
      ],
      child: const CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> with WidgetsBindingObserver{

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }
  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateAppTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
