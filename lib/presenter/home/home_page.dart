import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../infrastructure/network/dio_http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final network = Modular.get<HttpService>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}