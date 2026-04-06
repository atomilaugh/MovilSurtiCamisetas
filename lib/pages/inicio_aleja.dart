import 'package:flutter/material.dart';
import 'saldo_pendiente.dart';

class InicioAlejaWidget extends StatelessWidget {
  const InicioAlejaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed, // que siempre se vean los labels
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[700],
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventario',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Clientes'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reportes',
          ),
        ],
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
