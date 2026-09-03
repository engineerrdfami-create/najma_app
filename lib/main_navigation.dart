import 'package:flutter/material.dart';
// 🚀 استيراد كافة ملفات الخدمات والواجهات السحابية والأمان والشات لتطبيق نجمة المتكامل
import 'hub_icon.dart';
import 'reels_icon.dart';
import 'create_icon.dart';
import 'market_icon.dart';
import 'profile_icon.dart';
import 'starpay_wallet.dart';
import 'database_service.dart';
import 'star_market.dart';
import 'star_live.dart';     
import 'najma_reels.dart';   
import 'star_chat.dart';     // 🔗 ربط شاشة المراسلة الفورية الحقيقية المتقدمة الجديدة

class MainNavigation extends StatefulWidget {
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
