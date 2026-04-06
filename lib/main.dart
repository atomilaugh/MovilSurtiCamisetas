import 'package:flutter/material.dart';
import 'package:surticamisetas1/pages/producto.dart';
import 'package:surticamisetas1/pages/inicio_aleja.dart';
import 'package:surticamisetas1/pages/saldo_pendiente.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pantalla(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/inicio': (context) => const InicioAlejaWidget(),
        '/producto': (context) => const ProductDetailPage(),
        '/saldo': (context) => const SaldoPendiente(),
      },
    );
  }
}

class Pantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductDetailPage());
  }
}
