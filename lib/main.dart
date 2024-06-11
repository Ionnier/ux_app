import 'package:flutter/material.dart';
import 'package:ux_app/intro/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class CustomColors {
  static const rust = Color(0xFFAF3800);
  static const orangePantone = Color(0xFFFE621D);
  static const turqoise = Color(0xFF00FFE7);
  static const fluorCyan = Color(0xFF00FFE7);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: CustomColors.rust,
          primaryContainer: CustomColors.orangePantone,
          secondary: CustomColors.turqoise,
          secondaryContainer: CustomColors.fluorCyan,
        ),
        useMaterial3: true,
      ),
      home: const SafeArea(child: IntroScreen()),
    );
  }
}

extension Hey on Widget {
  Widget wrapInPadding({EdgeInsets padding = const EdgeInsets.all(16.0)}) =>
      Padding(padding: padding, child: this);
}

void rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }

  (context as Element).visitChildren(rebuild);
}
