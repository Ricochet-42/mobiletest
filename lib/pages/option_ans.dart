import 'dart:async';
import 'package:flutter/material.dart';
import 'package:proyect1/main.dart';
import 'package:proyect1/widgets/ej_respiratorio.dart';

class AnsiedadFlow extends StatefulWidget {
  const AnsiedadFlow({super.key});

  @override
  State<AnsiedadFlow> createState() => _AnsiedadFlowState();
}

class _AnsiedadFlowState extends State<AnsiedadFlow> {
  int fase = 0;
  int segundos = 5; // usa 30–60 en producción

  @override
  void initState() {
    super.initState();
    iniciarPausa();
  }

  // 🛑 PAUSA + FRICCIÓN
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 252, 250, 1),

      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(80),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 30),
      //     child: AppBar(
      //       elevation: 4,
      //       backgroundColor: const Color.fromRGBO(196, 211, 188, 1),
      //       shape: const RoundedRectangleBorder(
      //         borderRadius: BorderRadius.vertical(
      //           bottom: Radius.circular(25),
      //         ),
      //       ),
      //       centerTitle: true,
      //       title: const Text(
      //         "SATORI",
      //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //   ),
      // ),

      body: Center(
  child: SizedBox(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _buildFase(),
      ),
    ),
  ),
),
    );
  }

  Widget _buildFase() {
    switch (fase) {

      // 🛑 FASE 1: PAUSA
      case 0:
        return Column(
          key: const ValueKey(0),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Respira conmigo antes de continuar",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "$segundos",
              style: const TextStyle(fontSize: 50),
            ),
          ],
        );

      // 🌬️ FASE 2: RESPIRACIÓN
      case 1:
        return Column(
          key: const ValueKey(1),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sigue el ritmo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            const SizedBox(
              height: 250,
              child: EjRespiratorio(), // 🔥 tu animación aquí
            ),

            const SizedBox(height: 20),

            const Text(
              "Inhala 4 • Sostén 4 • Exhala 6",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () => setState(() => fase = 2),
              child: const Text("Continuar"),
            )
          ],
        );

      // 🎯 FASE 3: ANCLAJE 5-4-3-2-1
      case 2:
        return Column(
          key: const ValueKey(2),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Vuelve al presente",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const Text(
              "5 cosas que ves\n"
              "4 cosas que sientes\n"
              "3 sonidos que escuchas\n"
              "2 olores que percibes\n"
              "1 cosa que saboreas",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () => setState(() => fase = 3),
              child: const Text("Listo"),
            )
          ],
        );

      // 🚪 FASE 4: SALIDA CONTROLADA
      case 3:
        return Column(
          key: const ValueKey(3),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "¿Te sientes un poco más tranquilo?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const Text(
              "Tómate un momento más si lo necesitas.",
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
    backgroundColor: const Color.fromRGBO(196, 211, 188, 1), //
    foregroundColor: Colors.black, // color del texto (opcional)
  ),
  child: const Text("Continuar"),
),
          ],
        );

      default:
        return const SizedBox();
    }
  }
}