import 'package:flutter/material.dart';
import 'database_service.dart'; // 🔗 جلب البيانات وتحديث التفاعلات سحابياً

class NajmaReels extends StatelessWidget {
  const NajmaReels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical, // التمرير الرأسي اللانهائي كالمحترفين
        itemCount: 10,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // 🎬 خلفية تحاكي تشغيل الفيديو (تأثير نيون متحرك مستقبلي)
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.deepPurple.withOpacity(0.2), Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.play_circle_outline_rounded, color: Colors.white10, size: 80),
                ),
              ),

              // 👤 تفاصيل صانع المحتوى (أسفل اليمين)
              Positioned(
                bottom: 30,
                left: 20,
                right: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "@najma_creator 🌟",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "استعرضوا قوة محفظة StarPay وسرعة السداد السحابي الفوري في منصة نجمة! 🔥🚀",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    // شريط الموسيقى الدوار
                    Row(
                      children: [
                        const Icon(Icons.music_note_rounded, color: Color(0xFFFFD700), size: 16),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "الصوت الأصلي - منصة نجمة العالمية 2026",
                            style: const TextStyle(color: Color(0xFFFFD700), fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ⚡ أزرار التفاعل الجانبية والتسوق الذكي (أسفل اليسار)
              Positioned(
                bottom: 40,
                right: 15,
                child: Column(
                  children: [
                    // زر الإعجاب المضيء
                    _buildReelsAction(Icons.favorite_rounded, "125K", Colors.redAccent, () {
                      debugPrint("Reels: تم تسجيل إعجاب وتحديث العداد سحابياً.");
                    }),
                    const SizedBox(height: 18),
                    
                    // زر التعليقات
                    _buildReelsAction(Icons.comment_rounded, "4.2K", Colors.white, () {
                      debugPrint("Reels: فتح صندوق التعليقات الذكي.");
                    }),
                    const SizedBox(height: 18),

                    // 🛍️ زر التسوق المباشر والربط بالمتجر ومحفظة StarPay
                    GestureDetector(
                      onTap: () {
                        // محاكاة الشراء التلقائي للمنتج المرتبط بالفيديو سحابياً
                        DatabaseService.syncWalletBalance("user_101", 150.0, "شراء سريع لمنتج معروض في Reels");
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD700).withOpacity(0.15),
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFFFD700), width: 1.5),
                          boxShadow: [
                            BoxShadow(color: const Color(0xFFFFD700).withOpacity(0.2), blurRadius: 10)
                          ],
                        ),
                        child: const Icon(Icons.shopping_bag_rounded, color: Color(0xFFFFD700), size: 22),
                      ),
                    ),
                    const Text("تسوق", style: TextStyle(color: Color(0xFFFFD700), fontSize: 11, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 18),

                    // زر المشاركة
                    _buildReelsAction(Icons.reply_rounded, "شارك", Colors.lightBlueAccent, () {
                      debugPrint("Reels: جاري توليد رابط الفيديو للمشاركة.");
                    }),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ويدجت بناء أزرار التفاعل الجانبية المشعة
  Widget _buildReelsAction(IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 11)),
        ],
      ),
    );
  }
}

