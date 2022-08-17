import 'package:clubhouse/presentation/pages/main_page.dart';
import 'package:clubhouse/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ClubHouseApp());
}

class ClubHouseApp extends StatelessWidget {
  const ClubHouseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClubHouse',
      theme: buildTheme(),
      home:  MainPage(),
    );
  }
}

