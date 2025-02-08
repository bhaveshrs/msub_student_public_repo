import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msub/config/resource/app_theme.dart';
import 'package:msub/config/router/routes.dart';
import 'package:msub/features/signin/bloc/register_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp.router(
        //   debugShowCheckedModeBanner: false,
        //   title: "Teachers app",
        //   theme: AppThemes.lightTheme,
        //   routerConfig: _router.router,
        // );

        MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        // BlocProvider(
        //   create: (context) => CalenderBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => ClassesDetailBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => NotificationBloc(),
        // ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Teachers app",
        theme: AppThemes.lightTheme,
        routerConfig: _router.router,
      ),
    );
  }
}
