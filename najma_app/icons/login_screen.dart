import 'package:flutter/material.dart';
import 'main_navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D), // الأسود العميق لمنصة نجمة
      body: Stack(
        children: [
          // ✨ تأثير الإضاءة البنفسجية في الخلفية
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF8A2BE2).withOpacity(0.15),
                blurRadius: 100,
              ),
            ),
          ),
          
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: CenterMainAxisAlignment,
                  children: [
                    // 🌟 شعار النجمة ثلاثي الأبعاد المضيء
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.03),
                        border: Border.all(color: const Color(0xFFFFD700).withOpacity(0.3), width: 15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFFD700).withOpacity(0.2),
                            blurRadius: 30,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: const Icon(Icons.stars_rounded, color: Color(0xFFFFD700), size: 60),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "نَـجْـمَـة",
                      style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "منصة وتطبيق المستقبل العالمي",
                      style: TextStyle(color: Colors.white60, fontSize: 14),
                    ),
                    const SizedBox(height: 50),

                    // 📧 حقل إدخال اسم المستخدم (زجاجي شفاف)
                    _buildGlassTextField(Icons.person_outline, "اسم المستخدم أو البريد"),
                    const SizedBox(height: 20),

                    // 🔒 حقل إدخال كلمة المرور (زجاجي شفاف)
                    _buildGlassTextField(Icons.lock_outline, "كلمة المرور", isPassword: true),
                    const SizedBox(height: 40),

                    // 🚀 زر الدخول إلى المستقبل المضيء
                    GestureDetector(
                      onTap: () {
                        // الانتقال الفوري لشاشة الدمج الرئيسية بعد الترحيب
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MainNavigation()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF8A2BE2), Color(0xFFFFD700)],
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF8A2BE2).withOpacity(0.4),
                              blurRadius: 15,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "دخول إلى المستقبل",
                            style: TextStyle(color: Color(0xFF0D0D0D), fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ويدجت لبناء حقول الإدخال الزجاجية
  static Widget _buildGlassTextField(IconData icon, String hint, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(icon, color: const Color(0xFF8A2BE2), size: 22),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38, fontSize: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

