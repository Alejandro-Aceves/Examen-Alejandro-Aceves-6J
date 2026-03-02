import 'package:flutter/material.dart';
import 'bienvenida.dart';
import 'tours.dart'; // Importa la pantalla de tours

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Cuenta(),
  ));
}

class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.white;
    const Color accentColor = Colors.greenAccent;
    const Color textColor = Colors.black;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        // --- ICONO CON NAVEGACIÓN A TOURS ---
        leading: IconButton(
          icon: const Icon(Icons.tune_rounded, color: accentColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Tours()),
            );
          },
        ),
        title: const Text(
          'CUENTA',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: accentColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.menu, size: 35, color: textColor),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: textColor, width: 2),
                    ),
                    child: const Text(
                      'LIFETOURS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1.5,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: textColor, width: 1.5),
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=500', 
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'ALEJANDRO ACEVES 6J',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              _buildActionButton('EDITAR PERFIL', accentColor, textColor, () {}),
              const SizedBox(height: 15),
              _buildActionButton('MIS RESERVAS', accentColor, textColor, () {}),
              const SizedBox(height: 15),
              _buildActionButton('ELIMINAR PERFIL', accentColor, textColor, () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Bienvenida()),
                  (Route<dynamic> route) => false,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, Color bgColor, Color txtColor, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor,
          side: BorderSide(color: txtColor, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: txtColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
