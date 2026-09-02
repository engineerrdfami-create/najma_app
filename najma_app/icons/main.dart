import 'package:flutter/material.dart';
// استيراد الواجهات السحابية وشاشات الدخول التي برمجناها
import 'supabase_config.dart';
import 'login_screen.dart';

void main() async {
  // التأكد من تهيئة أدوات النظام قبل تشغيل الواجهات
  WidgetsFlutterBinding.ensureInitialized();
  
  // 🧠 تشغيل والاتصال بقاعدة البيانات المجانية فوراً عند فتح التطبيق
  await SupabaseConfig.initializeDatabase();
  
  // انطلاق المحرك الرئيسي لتطبيق نجمة
  runApp(const NajmaApp());
}

class NajmaApp extends StatelessWidget {
  const NajmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Najma App',
      debugShowCheckedModeBanner: false, // إخفاء شريط التجريب المزعج
      
      // ضبط النظام الداخلي للتطبيق ليناسب الوضع الداكن الفخم (Cyberpunk)
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF8A2BE2), // اللون البنفسجي الأساسي
        scaffoldBackgroundColor: const Color(0xFF0D0D0D), // الأسود العميق
      ),
      
      // 📱 الشاشة الأولى التي تفتح للمستخدم هي شاشة الدخول السينمائية
      home: const LoginScreen(),
    );
  }
}

