import 'package:flutter/material.dart';

class Botonestandar extends StatelessWidget {
  
  final String texto;
  final VoidCallback alPresionar;

  const Botonestandar({
    super.key, 
    required this.texto, 
    required this.alPresionar
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: alPresionar,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(196, 211, 188, 1),
        foregroundColor: Colors.black,
        // Padding constante para que todos tengan la misma altura/espaciado
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: StadiumBorder(), // Forma de píldora automática
      ),
      child: Text(texto),
    );
  }
}