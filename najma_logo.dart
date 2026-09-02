import 'dart:math';
import 'package:flutter/material.dart';

class NajmaLogo extends StatefulWidget {
  final double size;
  const NajmaLogo({super.key, this.size = 120.0});

  @override
  State<NajmaLogo> createState() => _NajmaLogoState();
}

// تفعيل ميزة الحركة والنبض الضوئي للشعار المذهب
class _NajmaLogoState extends State<NajmaLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    // إعداد محرك الحركة التناغطي للنبض المستمر
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _glowAnimation.value, // تحريك الشعار بتأثير النبض
          child: CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _StarGoldPainter(),
          ),
        );
      },
    );
  }
}

// 🎨 الرسام الهندسي السحري لطلاء الذهب ورسم النجمة بدقة
class _StarGoldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double centerHorizontal = size.width / 2;
    final double centerVertical = size.height / 2;
    final Offset center = Offset(centerHorizontal, centerVertical);
    final double radius = size.width / 2;

    // 1️⃣ رسم الهالة الضوئية الدائرية المشعة المحيطة بالنجمة
    final Paint glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFFFD700).withOpacity(0.25), // تدرج ذهبي مشع
          const Color(0xB3C59A3F).withOpacity(0.05),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(center, radius, glowPaint);

    // 2️⃣ رسم الحدود الهندسية الدائرية المصقولة للذهب
    final Paint borderPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFD700), Color(0xB3C59A3F), Color(0xFFFFD700)],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    canvas.drawCircle(center, radius * 0.85, borderPaint);

    // 3️⃣ حساب ورسم أبعاد النجمة الخماسية بدقة متناهية عبر الزوايا الرياضية
    final Path starPath = Path();
    final int points = 5;
    final double outerRadius = radius * 0.55;
    final double innerRadius = outerRadius * 0.4;
    final double startAngle = -pi / 2; // نقطة الانطلاق للرأس العلوي

    for (int i = 0; i < points * 2; i++) {
      final double currentRadius = i % 2 == 0 ? outerRadius : innerRadius;
      final double angle = startAngle + i * pi / points;
      final double x = centerHorizontal + cos(angle) * currentRadius;
      final double y = centerVertical + sin(angle) * currentRadius;

      if (i == 0) {
        starPath.moveTo(x, y);
      } else {
        starPath.lineTo(x, y);
      }
    }
    starPath.close();

    // 4️⃣ طلاء النجمة بالذهب اللامع وتأثير التدرج ثلاثي الأبعاد
    final Paint starPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFD700), Color(0xFFC59A3F), Color(0xFFFFD700)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCircle(center: center, radius: outerRadius))
      ..style = PaintingStyle.fill;

    // إضافة ظلال نيونية خلف النجمة مباشرة لتعزيز العمق البصري
    canvas.drawPath(starPath, starPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

