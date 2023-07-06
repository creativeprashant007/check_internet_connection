import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        ColorScheme,
        Colors,
        MaterialApp,
        Scaffold,
        StatelessWidget,
        Text,
        ThemeData,
        Widget,
        runApp;
import 'package:internet_connection/network_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NetworkOverlay(
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Connection Testing'),
      ),
      body: const Center(
        child: Text('App Content'),
      ),
    );
  }
}
