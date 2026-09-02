import 'package:flutter/material.dart';
// استيراد الملفات المستقلة التي قمنا ببرمجتها مسبقاً
import 'hub_icon.dart';
import 'reels_icon.dart';
import 'create_icon.dart';
import 'market_icon.dart';
import 'profile_icon.dart';
import 'starpay_wallet.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0; // تحديد الشاشة النشطة حالياً

  // قائمة الواجهات التي ينتقل بينها المستخدم
  final List<Widget> _screens = [
    const Center(child: Text("واجهة مجتمع نجمة (The Hub)", style: TextStyle(color: Colors.white, fontSize: 18))),
    const Center(child: Text("واجهة الفيديوهات القصيرة (Reels)", style: TextStyle(color: Colors.white, fontSize: 18))),
    const Center(child: Text("شاشة كاميرا الإنشاء والبث", style: TextStyle(color: Colors.white, fontSize: 18))),
    const Center(child: Text("واجهة متجر نجمة الذكي", style: TextStyle(color: Colors.white, fontSize: 18))),
    const StarPayWallet(), // دمج محفظة StarPay التي قمنا بكتابة كودها الفخم
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D), // الأسود العميق لمنصة نجمة
      body: IndexedStack(
        index: _currentIndex,
        children: _screens, // تبديل الشاشات بحفظ حالة كل شاشة
      ),
      
      // 📱 شريط التنقل السفلي الخرافي الحديث (التأثير الزجاجي الشفاف)
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04), // زجاجي شفاف جداً
          border: Border(top: BorderSide(color: Colors.white.withOpacity(0.08), width: 1)),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HubIcon(isActive: _currentIndex == 0, onTap: () => setState(() => _currentIndex = 0)),
              ReelsIcon(isActive: _currentIndex == 1, onTap: () => setState(() => _currentIndex = 1)),
              CreateIcon(onTap: () => setState(() => _currentIndex = 2)),
              MarketIcon(isActive: _currentIndex == 3, onTap: () => setState(() => _currentIndex = 3)),
              ProfileIcon(isActive: _currentIndex == 4, onTap: () => setState(() => _currentIndex = 4)),
            ],
          ),
        ),
      ),
    );
  }
}

