import 'package:flutter/material.dart';

class ReelsIcon extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;

  const ReelsIcon({super.key, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color iconColor = isActive ? const Color(0xFFFFD700) : Colors.white60; // ذهبي نجمي إذا كانت نشطة

    return GestureDetector(
      onTap: () {
        onTap();
        // 🧠 الخدمة الذكية المدمجة: تشغيل خوارزمية تيك توك وجلب الفيديوهات القصيرة المفضلة للمستخدم
        debugPrint("تم فتح نجمة Reels - جاري تحميل الفيديوهات وتنشيط الخوارزمية الذكية...");
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: isActive ? [
                BoxShadow(
                  color: const Color(0xFFFFD700).withOpacity(0.4),
                  blurRadius: 12,
                  spreadRadius: 2,
                )
              ] : [],
            ),
            child: Icon(
              Icons.stars_rounded, 
              color: iconColor, 
              size: 28,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Reels",
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

