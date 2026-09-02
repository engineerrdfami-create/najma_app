import 'package:flutter/material.dart';

class MarketIcon extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;

  const MarketIcon({super.key, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color iconColor = isActive ? const Color(0xFFFFD700) : Colors.white60; // ذهبي نجمي إذا كانت نشطة

    return GestureDetector(
      onTap: () {
        onTap();
        // 🧠 الخدمات الذكية المدمجة: فتح متجر نجمة وجلب منتجات المؤثرين وربط السداد بمحفظة StarPay
        debugPrint("تم فتح متجر نجمة - جاري تحميل المنتجات الذكية وربط بوابة السداد الإلكتروني...");
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
              Icons.shopping_bag_rounded, // أيقونة حقيبة التسوق الذكية
              color: iconColor, 
              size: 28,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "المتجر",
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

