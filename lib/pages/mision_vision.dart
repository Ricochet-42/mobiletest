import 'package:flutter/material.dart';
import 'package:proyect1/widgets/botonEstandar.dart'; // Verifica que la ruta sea esta

class PantallaMisionVision extends StatelessWidget {
  const PantallaMisionVision({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F5),
      body: SafeArea(
        child: Column(
          children: [
            // Encabezado
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Column(
                children: [
                  Icon(Icons.auto_awesome, size: 50, color: Color.fromRGBO(196, 211, 188, 1)),
                  SizedBox(height: 10),
                  Text(
                    "Nuestra Identidad",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Contenido con Scroll
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                children: [
                  _itemIdentidad(
                    titulo: "Misión",
                    contenido: "Nuestra misión es democratizar el acceso al bienestar emocional a través de la tecnología. Buscamos ofrecer un refugio digital donde cada persona encuentre herramientas prácticas, guiadas y científicamente respaldadas para gestionar el estrés y la ansiedad en su vida cotidiana.",
                    icono: Icons.flag_rounded,
                  ),
                  _itemIdentidad(
                    titulo: "Visión",
                    contenido: "Proyectamos convertirnos en la plataforma de acompañamiento emocional más humana y confiable del mundo hispanohablante. Queremos ser el primer paso que las personas dan hacia su autocuidado, rompiendo los estigmas sobre la salud mental con simplicidad y calidez.",
                    icono: Icons.visibility_rounded,
                  ),
                  _itemIdentidad(
                    titulo: "Nuestros Valores",
                    contenido: "• Empatía Radical: Entendemos tu proceso sin juicios.\n"
                               "• Accesibilidad: Bienestar para todos, sin barreras.\n"
                               "• Innovación Humana: Tecnología al servicio de la emoción.\n"
                               "• Integridad: Tu privacidad y paz son nuestra prioridad absoluta.",
                    icono: Icons.favorite_rounded,
                  ),
                ],
              ),
            ),

            // Botón centrado al final
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Botonestandar(
                texto: "Cerrar",
                alPresionar: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemIdentidad({required String titulo, required String contenido, required IconData icono}) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [ // Cambiado a children para centrar verticalmente si fuera necesario
            Icon(icono, color: const Color.fromRGBO(196, 211, 188, 1), size: 28),
            const SizedBox(height: 12),
            Text(
              titulo,
              textAlign: TextAlign.center, // Centra el título
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              contenido,
              textAlign: TextAlign.center, // Centra el cuerpo del texto
              style: TextStyle(
                fontSize: 15, 
                color: Colors.grey.shade800, 
                height: 1.6, // Mayor espacio entre líneas para lectura fácil
              ),
            ),
          ],
        ),
      ),
    );
  }
}
