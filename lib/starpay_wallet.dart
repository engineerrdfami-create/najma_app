import 'package:flutter/material.dart';
import 'package:najma_app/database_service.dart';
import 'package:najma_app/security_service.dart';


class StarPayWallet extends StatefulWidget {
  const StarPayWallet({super.key});

  @override
  State<StarPayWallet> createState() => _StarPayWalletState();
}

class _StarPayWalletState extends State<StarPayWallet> {
  bool _isAuthenticated = false; // حالة التحقق من البصمة (مغلق افتراضياً)

  @override
  void initState() {
    super.initState();
    _checkSecurity(); // تفعيل القفل التلقائي وطلب البصمة فور فتح الشاشة
  }

  // 🧠 دالة أمان إجبارية تطلب البصمة عند فتح المحفظة
  Future<void> _checkSecurity() async {
    bool isAvailable = await SecurityService.checkBiometricsAvailable();
    if (isAvailable) {
      bool success = await SecurityService.authenticateUser(context);
      setState(() {
        _isAuthenticated = success; // فتح المحفظة فقط إذا تطابقت البصمة
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 🔒 إذا لم يضع المستخدم بصمته، تظهر شاشة القفل التلقائي لحماية الأموال
    if (!_isAuthenticated) {
      return const Scaffold(
        backgroundColor: Color(0xFF0D0D0D),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, color: Color(0xFF8A2BE2), size: 60),
              SizedBox(height: 15),
              Text(
                "StarPay محفظة مقفلة",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("يرجى وضع بصمتك لفك القفل وعرض الرصيد", style: TextStyle(color: Colors.white60, fontSize: 13)),
            ],
          ),
        ),
      );
    }

    // 🔓 الشاشة الحية للمحفظة بعد النجاح في التحقق من البصمة
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "StarPay المحفظة",
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.verified_user_rounded, color: Colors.greenAccent, size: 24), // مؤشر الأمان الأخضر
                ],
              ),
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8A2BE2), Color(0xFFFFD700)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(22),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("رصيدك السحابي الحالي (مؤمن)", style: TextStyle(color: Colors.white70, fontSize: 14)),
                        Icon(Icons.stars_rounded, color: Color(0xFF0D0D0D), size: 30),
                      ],
                    ),
                    Text(
                      "\$1,250.00",
                      style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("STAR-9876-XXXX", style: TextStyle(color: Colors.white70, fontSize: 14)),
                        Text("نجمة الآمنة", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              const Text("خدمات سريعة سحابية", style: TextStyle(color: Colors.white60, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBtn(Icons.arrow_upward_rounded, "إرسال", const Color(0xFFFFD700), () {
                    DatabaseService.syncWalletBalance("user_101", 50.0, "تحويل هدايا بث مباشر");
                  }),
                  _buildBtn(Icons.arrow_downward_rounded, "استقبال", const Color(0xFF8A2BE2), () {
                    DatabaseService.syncWalletBalance("user_101", 100.0, "شحن المحفظة");
                  }),
                  _buildBtn(Icons.currency_bitcoin_rounded, "كريبتو", Colors.orange, () {
                    DatabaseService.syncWalletBalance("user_101", 0.0, "فحص محفظة العملات الرقمية");
                  }),
                  _buildBtn(Icons.history_rounded, "السجل", Colors.cyan, () {
                    debugPrint("جاري جلب سجل العمليات المالي من السيرفر السحابي...");
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBtn(IconData icon, String label, Color accentColor, VoidCallback action) {
    return GestureDetector(
      onTap: action,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
            ),
            child: Icon(icon, color: accentColor, size: 26),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}

