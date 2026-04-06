import 'package:flutter/material.dart';
import 'package:surticamisetas1/pages/producto.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Pantalla(), debugShowCheckedModeBanner: false);
  }
}

class Pantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductDetailPage());
  }
}
