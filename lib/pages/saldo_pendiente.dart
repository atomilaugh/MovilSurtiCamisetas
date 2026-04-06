import 'package:flutter/material.dart';

class SaldoPendiente extends StatelessWidget {
  const SaldoPendiente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saldo pendiente")),
      body: const Center(
        child: Text("Saldo pendiente", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
