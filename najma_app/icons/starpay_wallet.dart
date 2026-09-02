import 'package:flutter/material.dart';

class StarPayWallet extends StatelessWidget {
  const StarPayWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "StarPay المحفظة",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
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
                        Text("رصيدك الحالي", style: TextStyle(color: Colors.white70, fontSize: 14)),
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
                        Text("نجمة", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              const Text("خدمات سريعة", style: TextStyle(color: Colors.white60, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBtn(Icons.arrow_upward_rounded, "إرسال", const Color(0xFFFFD700)),
                  _buildBtn(Icons.arrow_downward_rounded, "استقبال", const Color(0xFF8A2BE2)),
                  _buildBtn(Icons.currency_bitcoin_rounded, "كريبتو", Colors.orange),
                  _buildBtn(Icons.history_rounded, "السجل", Colors.cyan),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBtn(IconData icon, String label, Color accentColor) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: accentColor, size: 26),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
