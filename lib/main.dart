import 'package:flutter/material.dart';
import 'package:myapp/mispantallas/bienvenida.dart';
import 'package:myapp/mispantallas/tours.dart';
import 'package:myapp/mispantallas/cuenta.dart';

void main() {
  runApp(const MiAppAceves());
}

class MiAppAceves extends StatelessWidget {
  const MiAppAceves({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Aceves Alejandro',
      // Ruta inicial
      initialRoute: '/bienvenida',
      // Definición de las rutas
      routes: {
        '/bienvenida': (context) => const Bienvenida(),
        '/tours': (context) => const Tours(),
        '/cuenta': (context) => const Cuenta(),
      },
    );
  }
}