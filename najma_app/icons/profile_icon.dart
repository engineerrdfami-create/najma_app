import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;

  const ProfileIcon({super.key, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color iconColor = isActive ? const Color(0xFF8A2BE2) : Colors.white60; // بنفسجي مضيء إذا كانت نشطة

    return GestureDetector(
      onTap: () {
        onTap();
        // 🧠 الخدمات الذكية المدمجة: فتح حساب المستخدم، جلب بيانات المتابعين، وعرض أرباح محفظة StarPay
        debugPrint("تم فتح الملف الشخصي - جاري جلب أرباح StarPay وبيانات المتابعين والمؤثرين...");
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: isActive ? [
                BoxShadow(
                  color: const Color(0xFF8A2BE2).withOpacity(0.4),
                  blurRadius: 12,
                  spreadRadius: 2,
                )
              ] : [],
            ),
            child: Icon(
              Icons.person_rounded, // مجسم حساب المستخدم الاحترافي
              color: iconColor, 
              size: 28,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "حسابي",
            style: TextStyle(
              color: iconColor,
              fontSize: 11,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}

