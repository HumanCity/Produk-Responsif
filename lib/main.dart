import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:slicing_design/color_scheme.dart';
import 'package:slicing_design/screen/mobile_screen.dart';
import 'package:slicing_design/screen/web_screen.dart';
import 'package:slicing_design/view_model/theme_view_model.dart';
import 'package:slicing_design/widget/responsive_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MyHomePage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemesViewModel(),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: context.watch<ThemesViewModel>().themeMode,
          theme: context.watch<ThemesViewModel>().themeData,
          darkTheme: context.watch<ThemesViewModel>().darkThemeData,
          routerConfig: _router,
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveWidget(mobile: MobileScreen(), web: WebScreen()),
    );
  }
}
