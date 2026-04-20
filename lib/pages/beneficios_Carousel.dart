import 'package:flutter/material.dart';
// Asegúrate de que la ruta de importación sea la correcta para tu proyecto
import 'package:proyect1/widgets/botonestandar.dart'; 

class BeneficiosCarousel extends StatefulWidget {
  const BeneficiosCarousel({super.key});

  @override
  State<BeneficiosCarousel> createState() => _BeneficiosCarouselState();
}

class _BeneficiosCarouselState extends State<BeneficiosCarousel> {
  final PageController _controller = PageController();
  int _paginaActual = 0;

  final List<Map<String, String>> contenidos = [
    {
      "titulo": "Relajación",
      "descripcion": "Reduce la tensión acumulada y permite que tu cuerpo recupere su equilibrio natural.",
      "imagen": "assets/logo4.png"
    },
    {
      "titulo": "Meditación",
      "descripcion": "Cultiva la atención plena para calmar el ruido mental y encontrar claridad.",
      "imagen": "assets/logo5.png"
    },
    {
      "titulo": "Desestrés",
      "descripcion": "Libera la presión del día a día y mejora tu bienestar emocional y físico.",
      "imagen": "assets/logo4.png"
    },
    {
      "titulo": "Enfoque",
      "descripcion": "Una mente tranquila es una mente eficiente. Mejora tu concentración diaria.",
      "imagen": "assets/logo5.png"
    },
    {
      "titulo": "Paz Interior",
      "descripcion": "Crea un espacio de calma donde puedas ser tú mismo, sin distracciones externas.",
      "imagen": "assets/logo4.png"
    },
    {
      "titulo": "SATORI",
      "descripcion": "Tu celular ya tiene suficiente batería, ahora es momento de cuidar la tuya.",
      "imagen": "assets/logo5.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool esUltimaPagina = _paginaActual == contenidos.length - 1;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 252, 250, 1),
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 TÍTULO PRINCIPAL DE LA PANTALLA
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 10),
              child: Text(
                "BENEFICIOS",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300, // Un toque más elegante/ligero
                  letterSpacing: 4,            // Espaciado entre letras para estilo Zen
                  color: Color.fromRGBO(117, 119, 114, 1),
                ),
              ),
            ),
            
            // Línea sutil decorativa (opcional, combina con tus dividers)
            Container(
              height: 1.5,
              width: 50,
              color: const Color.fromRGBO(196, 211, 188, 1),
            ),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => _paginaActual = index),
                itemCount: contenidos.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          contenidos[i]["imagen"]!,
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          contenidos[i]["titulo"]!,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(41, 41, 41, 1),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          contenidos[i]["descripcion"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Indicadores de página (Puntitos)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contenidos.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _paginaActual == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _paginaActual == index 
                        ? const Color.fromRGBO(196, 211, 188, 1) 
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // SECCIÓN DEL BOTÓN (Usando tu Botonestandar)
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: esUltimaPagina
                  ? Botonestandar(
                      texto: "CERRAR",
                      alPresionar: () => Navigator.pop(context),
                    )
                  : Botonestandar(
                      texto: "SIGUIENTE",
                      alPresionar: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}