import 'dart:math';
import 'package:flutter/material.dart';

/// Botón con forma de diamante
class DiamondButton extends StatelessWidget {
  final IconData? icon; // Icono que se muestra si no hay imagen
  final String? imageUrl; // URL de imagen para mostrar dentro del diamante
  final VoidCallback? onPressed; // Función que se ejecuta al presionar
  final double size; // Tamaño del botón (ancho y alto)
  final Color color; // Color de fondo del botón
  final Color iconColor; // Color del icono si se muestra

  const DiamondButton({
    super.key,
    this.icon,
    this.imageUrl,
    this.onPressed,
    this.size = 80,
    this.color = Colors.blue,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final double imageSize = size; // Tamaño de la imagen o icono interno

    return Transform.rotate(
      angle: 45 * pi / 180, // Rotación para dar forma de diamante
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)), // Esquinas ligeramente redondeadas
        clipBehavior: Clip.antiAlias, // Evita que el contenido se salga de los bordes
        elevation: 3.0, // Sombra del material
        // ignore: deprecated_member_use
        shadowColor: Colors.black.withOpacity(0.8), // Color de la sombra
        color: Colors.transparent, // Color base transparente para que se vea solo el Ink
        child: InkWell(
          onTap: onPressed, // Detecta toque en el botón
          child: Ink(
            width: size,
            height: size,
            color: color, // Color de fondo del botón
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Transform.rotate(
                  angle: -45 * pi / 180, // Rota el contenido para que se vea derecho
                  child: imageUrl != null
                      ? Image.network(
                    imageUrl!,
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                    // Si la imagen falla, muestra un icono de persona
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.person,
                      color: iconColor,
                      size: size * 0.5,
                    ),
                  )
                      : Icon(icon, color: iconColor, size: size * 0.4), // Si no hay imagen, se muestra el icono
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Reutilizable en cualquier parte
class ClipDiamond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double w = size.width; // ancho del recorte
    final double h = size.height; // alto del recorte

    final double radius = 8.0; // radio de las esquinas

    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, w, h), // rectángulo base para recortar
          Radius.circular(radius), // aplica esquinas redondeadas
        ),
      );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false; // No es necesario recalcular el recorte
}
