import 'package:flutter/material.dart';
import 'database_service.dart'; // 🔗 ربط البث المباشر بالخدمات السحابية لمعالجة هدايا المتابعين

class StarLive extends StatelessWidget {
  const StarLive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // خلفية سوداء تحاكي تشغيل الكاميرا
      body: Stack(
        children: [
          // 📷 واجهة محاكاة كاميرا البث المباشر (تأثير نيون خفيف في الخلفية)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [Color(0xFF1A0A3A), Colors.black],
                radius: 1.2,
              ),
            ),
            child: const Center(
              child: Icon(Icons.videocam_rounded, color: Colors.white12, size: 100),
            ),
          ),

          // 🔴 الطبقة العلوية: شريط المعلومات الفوري (LIVE) وعدد المشاهدين
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // شعار البث المباشر المضيء
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "LIVE",
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // عداد المشاهدين الزجاجي
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.visibility_rounded, color: Colors.white, size: 14),
                                SizedBox(width: 4),
                                Text("4.8K", style: TextStyle(color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // زر إغلاق البث المباشر
                      IconButton(
                        icon: const Icon(Icons.close_rounded, color: Colors.white, size: 28),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  // 💬 الطبقة السفلية: صندوق التعليقات وأزرار التفاعل والهدايا
                  Column(
                    children: [
                      // محاكاة تعليقات الجمهور المتنقلة
                      Container(
                        height: 150,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("@ahmed: بالتوفيق يا أسطر! 🔥", style: TextStyle(color: Colors.white, fontSize: 13)),
                            SizedBox(height: 6),
                            Text("@najma_fan: أفضل منصة وتطبيق مستقل 🌟", style: TextStyle(color: Color(0xFFFFD700), fontSize: 13)),
                            SizedBox(height: 6),
                            Text("@sara: المحفظة والتحويل فوري خيالي! 💳", style: TextStyle(color: Colors.white70, fontSize: 13)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // حقل الكتابة وأزرار الدعم المالي السريع
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: "أرسل تعليقاً مضيئاً...",
                                  hintStyle: TextStyle(color: Colors.white38, fontSize: 13),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          
                          // 🎁 زر إرسال هدية نقدية نيون (تخصم من StarPay)
                          _buildLiveGiftBtn(Icons.card_giftcard_rounded, const Color(0xFFFFD700), () {
                            DatabaseService.syncWalletBalance("user_101", 10.0, "إرسال هدية ذهبية في البث المباشر");
                          }),
                          const SizedBox(width: 8),
                          
                          // 🎤 زر تشغيل الميكروفون أو البث المشترك
                          _buildLiveGiftBtn(Icons.mic_rounded, const Color(0xFF8A2BE2), () {
                            debugPrint("نظام نجمة: جاري تفعيل الميكروفون المشترك للبث...");
                          }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ويدجت بناء أزرار التفاعل والهدايا المشعة في البث
  Widget _buildLiveGiftBtn(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
          border: Border.all(color: color.withOpacity(0.3), width: 1),
        ),
        child: Icon(icon, color: color, size: 22),
      ),
    );
  }
}

