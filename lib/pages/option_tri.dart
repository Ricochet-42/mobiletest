import 'dart:async';
import 'package:flutter/material.dart';
import 'package:proyect1/main.dart';

class TristezaFlow extends StatefulWidget {
  const TristezaFlow({super.key});

  @override
  State<TristezaFlow> createState() => _TristezaFlowState();
}

class _TristezaFlowState extends State<TristezaFlow> {
  int fase = 0;
  int segundos = 5; // puedes subir a 30–60 en producción
  bool inhalar = true;

  @override
  void initState() {
    super.initState();
    iniciarPausa();
  }

  // 🛑 FASE 1: PAUSA
  void iniciarPausa() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (segundos == 0) {
        timer.cancel();
        setState(() => fase = 1);
      } else {
        setState(() => segundos--);
      }
    });
  }

  // 🌬️ FASE 3: RESPIRACIÓN
  void iniciarRespiracion() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (fase != 2) {
        timer.cancel();
      } else {
        setState(() => inhalar = !inhalar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _buildFase(),
          ),
        ),
      ),
    );
  }

  Widget _buildFase() {
    switch (fase) {

      // 🛑 1. PAUSA
      case 0:
        return Column(
          key: const ValueKey(0),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Espera un momento...",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "$segundos",
              style: const TextStyle(fontSize: 50),
            ),
          ],
        );

      // 🧩 2. VALIDACIÓN
      case 1:
        return Column(
          key: const ValueKey(1),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Está bien sentirse así",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              "No tienes que estar bien todo el tiempo.\nRespira, esto es momentáneo.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MyApp()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromRGBO(196, 211, 188, 1), // 🔥 tu verde
    foregroundColor: Colors.black, // color del texto (opcional)
  ),
  child: const Text("Continuar"),
),
          ],
        );

      // 🌬️ 3. REGULACIÓN (RESPIRACIÓN)
      case 2:
        return Column(
          key: const ValueKey(2),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Respira conmigo",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            AnimatedContainer(
              duration: const Duration(seconds: 2),
              width: inhalar ? 150 : 100,
              height: inhalar ? 150 : 100,
              decoration: BoxDecoration(
                color: Colors.green[200],
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(height: 20),
            Text(inhalar ? "Inhala..." : "Exhala..."),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => setState(() => fase = 3),
              child: const Text("Continuar"),
            )
          ],
        );

      // 🎯 4. MICROACCIÓN
      case 3:
        return Column(
          key: const ValueKey(3),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Haz algo pequeño",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            const Text(
              "Solo levántate y da 5 pasos.\nNada más.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyApp()),
                );
              },
              child: const Text("Continuar"),
            )
          ],
        );

      default:
        return const SizedBox();
    }
  }
}