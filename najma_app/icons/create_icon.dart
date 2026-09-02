import 'package:flutter/material.dart';

class CreateIcon extends StatelessWidget {
  final VoidCallback onTap;

  const CreateIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        // 🧠 الخدمات الذكية المدمجة: فتح كاميرا نجمة المدعومة بالفلاتر وإطلاق البث المباشر المشترك (Star Live)
        debugPrint("تم فتح قائمة الإنشاء - تنشيط كاميرا الذكاء الاصطناعي وخدمات البث المباشر...");
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          // دمج الألوان البنفسجية والذهبية المستقبلية في زر واحد متدرج
          gradient: const LinearGradient(
            colors: [Color(0xFF8A2BE2), Color(0xFFFFD700)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF8A2BE2).withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 2,
            )
          ],
        ),
        child: const Icon(
          Icons.add_rounded,
          color: Color(0xFF0D0D0D), // لون أسود عميق للأيقونة الداخلية ليتناسق مع التوهج
          size: 32,
        ),
      ),
    );
  }
}

