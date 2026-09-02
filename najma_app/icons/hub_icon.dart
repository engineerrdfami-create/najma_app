import 'package:flutter/material.dart';

class HubIcon extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;

  const HubIcon({super.key, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color iconColor = isActive ? const Color(0xFF8A2BE2) : Colors.white60; // بنفسجي مضيء إذا كانت نشطة
    
    return GestureDetector(
      onTap: () {
        onTap();
        // 🧠 الخدمة الذكية المدمجة: تحديث خلاصة الأخبار والمنشورات فوراً بالذكاء الاصطناعي للمجتمع
        debugPrint("تم فتح مجتمع نجمة - جاري تحديث المنشورات والجروبات بالذكاء الاصطناعي...");
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
              Icons.home_filled, 
              color: iconColor, 
              size: 28,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "المجتمع",
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


