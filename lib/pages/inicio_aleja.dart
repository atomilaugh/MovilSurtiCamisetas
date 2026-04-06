import 'package:flutter/material.dart';
import 'saldo_pendiente.dart';

class InicioAlejaWidget extends StatefulWidget {
  const InicioAlejaWidget({super.key});

  @override
  State<InicioAlejaWidget> createState() => _InicioAlejaWidgetState();
}

class _InicioAlejaWidgetState extends State<InicioAlejaWidget> {
  int selectedIndex = 0;

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
        switch (index) {
          case 0:
            // Ya estamos en inicio, no navegar
            break;
          case 1:
            Navigator.pushNamed(context, '/producto');
            break;
          case 3:
            Navigator.pushNamed(context, '/saldo');
            break;
          case 4:
            // Reportes, quizás no navegar o a algo
            break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: isSelected ? Colors.black : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterNavItem() {
    final bool isSelected = selectedIndex == 2;
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = 2),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          Icons.widgets,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(Icons.home, "Inicio", 0),
              _buildNavItem(Icons.shopping_bag, "Pedidos", 1),
              _buildCenterNavItem(),
              _buildNavItem(Icons.people, "Clientes", 3),
              _buildNavItem(Icons.bar_chart, "Reportes", 4),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sección: Atención requerida
              const Text("Atención requerida", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SaldoPendiente(),
                    ),
                  );
                },
                child: _tarjeta(
                  color: Colors.grey[300],
                  icon: Icons.attach_money,
                  titulo: "Saldo pendiente",
                  subtitulo: "\$ 3.625.000 por cobrar",
                ),
              ),

              const SizedBox(height: 10),

              _tarjeta(
                color: Colors.red[100],
                icon: Icons.inventory_2,
                titulo: "Stock bajo",
                subtitulo: "1 productos necesitan reposición",
              ),

              const SizedBox(height: 10),

              _tarjeta(
                color: Colors.orange[100],
                icon: Icons.local_shipping,
                titulo: "Domicilios pendientes",
                subtitulo: "1 entregas por asignar",
              ),

              const SizedBox(height: 20),

              // Sección: Actividad reciente
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Actividad reciente",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: const [
                      Text(
                        "Ver todos >",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Lista de actividades
              _actividad(
                "Colegio San José",
                "Pedido #PED001",
                "19/3/2026",
                "\$ 6.250.000",
                "en confección",
              ),
              _actividad(
                "Distribuidora El Rey",
                "Pedido #PED002",
                "24/3/2026",
                "\$ 2.800.000",
                "listo",
              ),
              _actividad(
                "Juan Pérez",
                "Pedido #PED003",
                "27/3/2026",
                "\$ 375.000",
                "recibido",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Tarjetas informativas
  Widget _tarjeta({
    required Color? color,
    required IconData icon,
    required String titulo,
    required String subtitulo,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 30),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(subtitulo),
            ],
          ),
        ],
      ),
    );
  }

  // Actividad reciente con Pedido #, fecha y estado
  Widget _actividad(
    String nombre,
    String pedido,
    String fecha,
    String precio,
    String estado,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Fila 1: Nombre izquierda / Estado derecha
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: estado == "listo"
                      ? Colors.green[100]
                      : estado == "recibido"
                      ? Colors.blue[100]
                      : Colors.orange[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  estado,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          // 🔹 Fila 2: Pedido y fecha
          Text("$pedido · $fecha", style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 8),

          // 🔹 Fila 3: Precio izquierda / Ver detalle derecha
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              // izquierda
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(precio, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Text(
                "Ver detalle",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
