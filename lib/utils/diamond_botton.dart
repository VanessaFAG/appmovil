import 'package:flutter/material.dart';

/// Botón con forma de diamante
class DiamondButton extends StatelessWidget {
  final IconData? icon;
  final String? imageUrl;
  final VoidCallback? onPressed;
  final double size;
  final Color color;
  final Color iconColor;

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
    return ClipPath(
      clipper: ClipDiamond(),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            width: size,
            height: size,
            child: Center(
              child: 
              imageUrl != null
              ? Image.network(imageUrl!,
              fit: BoxFit.cover,
              width: size,
              height: size,
              errorBuilder: (_, __, ____) => Icon(Icons.person, color: iconColor, size: size * 0.5,),)
              : Icon(icon, color: iconColor, size: size * 0.4),
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
    final double w = size.width;
    final double h = size.height;

    return Path()
      ..moveTo(0, h * 0.5)
      ..lineTo(w * 0.5, 0)
      ..lineTo(w, h * 0.5)
      ..lineTo(w * 0.5, h)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
