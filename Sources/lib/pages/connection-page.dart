import 'package:flutter/material.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();

}

class _ConnectionPageState extends State<ConnectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connection feature'),
      ),
      body: const Center(
        child: Text('Connection feature'),
      ),
    );
  }
}