import 'package:flutter/material.dart';
import 'tours.dart';

void main() => runApp(const Bienvenida());

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LifeTours',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.greenAccent,
      ),
      home: const SelectionScreen(),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- NUEVO APPBAR AGREGADO ---
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Sin sombra para mantener el estilo limpio
        leading: Icon(Icons.grid_view_rounded, color: Colors.greenAccent[400]), // Icono izquierda
        title: const Text(
          'BIENVENIDA',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.greenAccent), // Icono derecha
            onPressed: () {},
          ),
        ],
      ),
      // -----------------------------
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // LOGO Section (Se mantiene igual al boceto)
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Text(
                    'LIFETOURS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 1),

              // Título Principal
              const Text(
                'LIFETOURS',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 40),

              // Botones de Opciones
              _buildOptionButton(context, 'Crear Cuenta'),
              const SizedBox(height: 15),
              _buildOptionButton(context, 'Iniciar como cliente'),
              const SizedBox(height: 15),
              _buildOptionButton(context, 'Iniciar como administrador'),

              const SizedBox(height: 30),

              // Botón Start Over
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Tours()),
                  );
                },
                child: const Text(
                  'SKIP',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, String text) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton(
        onPressed: () {
          if (text == 'Iniciar como cliente' || text == 'Iniciar como administrador') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Tours()),
            );
          }
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.greenAccent,
          side: const BorderSide(color: Colors.black, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}