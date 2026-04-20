import 'package:flutter/material.dart';
import 'package:proyect1/widgets/botonEstandar.dart';

class Terminos extends StatelessWidget {
  const Terminos({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: const Color(0xFFF5F7F5), // Manteniendo tu estética
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.description_outlined, size: 50, color: Colors.grey),
              const SizedBox(height: 15),
              const Text(
                "Términos y Condiciones",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              
              // Área de texto con Scroll
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: const SingleChildScrollView(
                    child: Text(
                      "Bienvenido a la App de Satori.\n\n"
                      "1. Uso de la Aplicación: Esta herramienta es para apoyo emocional y bienestar personal. No sustituye tratamiento médico o psicológico profesional.\n\n"
                      "2. Privacidad: Sus datos son procesados localmente para su seguridad. No recolectamos información personal sin su consentimiento.\n\n"
                      "3. Responsabilidad: El usuario acepta que el uso de las técnicas de respiración y ejercicios es bajo su propia discreción.\n\n"
                      "4. Propiedad: Todo el contenido visual y educativo es propiedad de sus respectivos autores.\n\n"
                      "Al presionar el botón de abajo, usted confirma que ha leído y acepta estos términos para continuar con la experiencia.",
                      style: TextStyle(fontSize: 15, height: 1.5, color: Colors.black87),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 30),

              // Instancia de tu botón personalizado
              Botonestandar(
                texto: "Aceptar y Continuar",
                alPresionar: () {
                  // Aquí la lógica para salir o avanzar
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}