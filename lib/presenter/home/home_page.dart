import 'package:flutter/material.dart';
import 'package:manda_aquela/domain/entities/user_firebase_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text('Olá,\n${UserFirebaseInfo.instance.name}'),
        elevation: 0,
        actions: [Container()],
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
