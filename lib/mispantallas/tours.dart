import 'package:flutter/material.dart';
import 'cuenta.dart';
import 'bienvenida.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Tours(),
  ));
}

class Tours extends StatelessWidget {
  const Tours({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.white;
    const Color accentColor = Colors.greenAccent;
    const Color textColor = Colors.black;
    final Color darkGreen = Colors.green[900]!;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.sort, color: accentColor),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Bienvenida()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: const Text(
          'TOURS',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: accentColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(border: Border.all(color: textColor, width: 2)),
                  child: const Text('LIFETOURS', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'SEARCHING RESULTS FOR: __',
                        hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildSmallButton('START OVER', accentColor, textColor, () {}),
                const SizedBox(width: 10),
                _buildSmallButton('SAVE PROFILE', accentColor, textColor, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cuenta()),
                  );
                }),
              ],
            ),
            const SizedBox(height: 25),
            // --- ITEMS DE LA LISTA CON IMÁGENES ---
            _buildTourItem('https://images.unsplash.com/photo-1501785888041-af3ef285b470?q=80&w=1470', 'Aventura en la Selva', 'Descubre la fauna silvestre y paisajes naturales inolvidables.', 'DESDE \$85', darkGreen),
            _buildTourItem('https://images.unsplash.com/photo-1558030006-450675393462?q=80&w=1374', 'Ruta Gastronómica', 'Un recorrido por los mejores sabores locales y mercados tradicionales.', 'DESDE \$50', darkGreen),
            _buildTourItem('https://images.unsplash.com/photo-1555400038-63f5ba517a47?q=80&w=1470', 'Escapada Histórica', 'Visita monumentos antiguos con guías certificados.', 'DESDE \$110', darkGreen),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallButton(String text, Color bg, Color textCol, VoidCallback onPressed) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            color: bg,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(text, style: TextStyle(color: textCol, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget _buildTourItem(String imgUrl, String title, String desc, String price, Color subColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.black, width: 1.5),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
                // En caso de error, muestra un icono
                onError: (exception, stackTrace) {},
              ),
            ),
            child: imgUrl.isEmpty
                ? const Center(child: Icon(Icons.image_outlined, color: Colors.black26, size: 40))
                : null,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 5),
                Text(desc, style: const TextStyle(fontSize: 13, height: 1.3, color: Colors.black87)),
                const SizedBox(height: 10),
                Text(price, style: TextStyle(color: subColor, fontWeight: FontWeight.bold, fontSize: 14)),
                const Divider(color: Colors.black, thickness: 1, height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
