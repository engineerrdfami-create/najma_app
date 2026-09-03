import 'package:flutter/material.dart';
// 🚀 استيراد كافة ملفات الخدمات والواجهات السحابية والأمان والشات لتطبيق نجمة المتكامل
     // 🔗 ربط شاشة المراسلة الفورية الحقيقية المتقدمة الجديدة

class MainNavigation extends StatefulWidget {
import 'package:najma_app/hub_icon.dart';
import 'package:najma_app/reels_icon.dart';
import 'package:najma_app/create_icon.dart';
import 'package:najma_app/market_icon.dart';
import 'package:najma_app/profile_icon.dart';
import 'package:najma_app/starpay_wallet.dart';
import 'package:najma_app/database_service.dart';
import 'package:najma_app/star_market.dart';
import 'package:najma_app/star_live.dart';
import 'package:najma_app/najma_reels.dart';
import 'package:najma_app/star_chat.dart';
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // تحديد مؤشر الشاشة النشطة حالياً في الواجهة الرسومية (الافتراضية هي الشاشة الأولى 0)
  int _currentIndex = 0; 

  // 📱 مصفوفة الواجهات الحقيقية والتفاعلية المنفصلة لمنصة نجمة بالكامل
  // تم ترتيب الشاشات لتطابق الأيقونات التفاعلية في الشريط السفلي بدقة عالية
  final List<Widget> _screens = [
    const StarChat(),       // ✨ 1️⃣ دمج واجهة الشات الحية المتقدمة بمؤشر الاتصال (Online) وزر StarPay
    const NajmaReels(),     // ✨ 2️⃣ دمج واجهة الفيديوهات القصيرة اللانهائية بتأثير التمرير العمودي الذكي
    const StarLive(),       // ✨ 3️⃣ دمج واجهة البث المباشر وكاميرا التفاعل وهدايا صناع المحتوى
    const StarMarket(),     // ✨ 4️⃣ متجر نجمة الإلكتروني الذكي المربوط بالمحفظة للشراء السريع للمؤثرين
    const StarPayWallet(),  // ✨ 5️⃣ المحفظة الرقمية السحابية المحمية بالبصمة والأمان والمزامنة الفورية
  ];

  @override
  void initState() {
    super.initState();
    // 🧠 ميزة ذكية: جلب خلاصة البيانات الفورية وتحديث الفيديوهات سحابياً بالذكاء الاصطناعي عند فتح المنصة
    DatabaseService.fetchViralReels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D), // الأسود العميق الفخم (Cyberpunk Black) لمنصة نجمة
      body: IndexedStack(
        index: _currentIndex,
        children: _screens, // تبديل الشاشات الذكية مع حفظ حالة (State) كل واجهة بالكامل أثناء التنقل
      ),
      
      // 📱 شريط التنقل السفلي الخرافي والحديث بتأثيره الزجاجي النيوني الشفاف (Glassmorphism)
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04), // تأثير تصميم زجاجي نيون فخم جداً
          border: Border(top: BorderSide(color: Colors.white.withOpacity(0.08), width: 1)),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // توزيع الأيقونات الخمسة بالتساوي
            children: [
              // 🏠 أيقونة مجتمع نجمة والشات
              HubIcon(isActive: _currentIndex == 0, onTap: () => setState(() => _currentIndex = 0)),
              // 🎬 أيقونة الفيديوهات القصيرة Reels
              ReelsIcon(isActive: _currentIndex == 1, onTap: () => setState(() => _currentIndex = 1)),
              // ➕ أيقونة الإنشاء وكاميرا البث المباشر
              CreateIcon(onTap: () => setState(() => _currentIndex = 2)),
              // 🛍️ أيقونة متجر نجمة الإلكتروني
              MarketIcon(isActive: _currentIndex == 3, onTap: () => setState(() => _currentIndex = 3)),
              // 👤 أيقونة الملف الشخصي وإدارة الأرباح والمحفظة
              ProfileIcon(isActive: _currentIndex == 4, onTap: () => setState(() => _currentIndex = 4)),
            ],
          ),
        ),
      ),
    );
  }
}
