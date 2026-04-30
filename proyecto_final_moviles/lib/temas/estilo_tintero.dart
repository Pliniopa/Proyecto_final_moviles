import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const Color tinteroDark = Color(0xFF003F46);
const Color tinteroDeep = Color(0xFF032F34);
const Color tinteroPanel = Color(0xD8195B63);
const Color tinteroAccent = Color(0xFF0A9CA8);
const Color tinteroField = Color(0xFFA8C7C9);
const Color tinteroWhite = Color(0xFFF3FAFA);

const String tinteroLogo = 'assets/img/imagen_corporativa.png';
const String tinteroAvatar = 'assets/img/imagen2.png';
const String fondoInicio = 'assets/fondos_pestanas/fondo_init.png';
const String fondoGeneral = 'assets/fondos_pestanas/fondo_gene.jpeg';
const String fondoPerfil = 'assets/fondos_pestanas/fondo_perf.png';

class TinteroBackground extends StatelessWidget {
  final String image;
  final Widget child;
  final double opacity;

  const TinteroBackground({
    super.key,
    required this.image,
    required this.child,
    this.opacity = 0.48,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(image, fit: BoxFit.cover),
        DecoratedBox(
          decoration: BoxDecoration(
            color: tinteroDark.withValues(alpha: opacity),
          ),
        ),
        child,
      ],
    );
  }
}

class TinteroLogo extends StatelessWidget {
  final double width;

  const TinteroLogo({super.key, this.width = 150});

  @override
  Widget build(BuildContext context) {
    return Image.asset(tinteroLogo, width: width, fit: BoxFit.contain);
  }
}

InputDecoration tinteroInputDecoration(String hint, {Widget? suffixIcon}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.black.withValues(alpha: 0.42)),
    filled: true,
    fillColor: tinteroField,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(color: tinteroAccent, width: 1.4),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
    ),
  );
}

class TinteroButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;

  const TinteroButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: tinteroAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

class TinteroBottomNav extends StatelessWidget {
  final int currentIndex;

  const TinteroBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 7,
      right: 7,
      bottom: 10,
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: const Color(0xEF00747B),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _BottomItem(
              selected: currentIndex == 0,
              icon: Icons.menu_book_rounded,
              onTap: () => context.goNamed('biblioteca'),
            ),
            const SizedBox(width: 30),
            _BottomItem(
              selected: currentIndex == 1,
              image: tinteroAvatar,
              onTap: () => context.goNamed('perfil'),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  final bool selected;
  final IconData? icon;
  final String? image;
  final VoidCallback onTap;

  const _BottomItem({
    required this.selected,
    this.icon,
    this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: selected ? Colors.black : const Color(0xFFD4EFF8),
        backgroundImage: image == null ? null : AssetImage(image!),
        child: image == null ? Icon(icon, color: Colors.white, size: 25) : null,
      ),
    );
  }
}

class BookCover extends StatelessWidget {
  final String image;
  final double width;
  final double height;

  const BookCover({
    super.key,
    required this.image,
    this.width = 96,
    this.height = 128,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1),
      child: Image.asset(
        image,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TinteroWave extends StatelessWidget {
  const TinteroWave({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 44),
      painter: _WavePainter(),
    );
  }
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.86)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final path = Path()
      ..moveTo(0, size.height * 0.55)
      ..cubicTo(
        size.width * 0.24,
        size.height * 0.72,
        size.width * 0.28,
        0,
        size.width * 0.5,
        size.height * 0.22,
      )
      ..cubicTo(
        size.width * 0.72,
        size.height * 0.44,
        size.width * 0.78,
        size.height * 0.82,
        size.width,
        size.height * 0.48,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
