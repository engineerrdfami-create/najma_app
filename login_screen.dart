import 'package:flutter/material.dart';
import 'main_navigation.dart';
import 'database_service.dart';
import 'najma_logo.dart'; // 🔗 استيراد ملف الشعار الهندسي المذهب الجديد 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A), // ⚫ الأسود الملكي العميق للخلفية
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🌟 استدعاء الشعار الهندسي المذهب والنابض ضوئياً الذي برمجناه
                const NajmaLogo(size: 140),
                const SizedBox(height: 25),
                
                // العنوان الرئيسي الفاخر
                const Text(
                  "نَـجْـمَـة",
                  style: TextStyle(
                    color: Color(0xFFFFD700), // 🟡 الذهب اللامع
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "منصتك المادية والسحابية الموثوقة",
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
                const SizedBox(height: 40),

                // 👤 حقل اسم المستخدم المذهب
                _buildGoldTextField(_usernameController, "اسم المستخدم", Icons.person_outline),
                const SizedBox(height: 15),

                // 📧 حقل البريد الإلكتروني
                _buildGoldTextField(_emailController, "البريد الإلكتروني", Icons.email_outlined),
                const SizedBox(height: 15),

                // 🔒 حقل كلمة المرور
                _buildGoldTextField(_passwordController, "كلمة المرور", Icons.lock_outline, isPassword: true),
                const SizedBox(height: 35),

                // 🟡 زر تسجيل الدخول المشع بالتدرج الذهبي الناعم
                GestureDetector(
                  onTap: () async {
                    String user = _usernameController.text.trim();
                    String email = _emailController.text.trim();
                    String pass = _passwordController.text.trim();

                    if (user.isNotEmpty && email.isNotEmpty && pass.isNotEmpty) {
                      bool isSuccess = await DatabaseService.registerUser(user, email, pass);
                      if (isSuccess && context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MainNavigation()),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("يرجى تعبئة كافة الحقول الذهبية الآمنة")),
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFD700), Color(0xB3C59A3F)], // تدرج ذهبي ملكي ناعم
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFFD700).withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "دخول آمن للمنصة",
                        style: TextStyle(
                          color: Color(0xFF0A0A0A), // كتابة بالأسود فوق الذهب لسهولة القراءة
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ويدجت ذكية لبناء حقول الإدخال المصقولة بالذهب
  Widget _buildGoldTextField(TextEditingController controller, String hint, IconData icon, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFD700).withOpacity(0.15)), // حواف ذهبية ناعمة
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(icon, color: const Color(0xFFFFD700)),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38, fontSize: 13),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

