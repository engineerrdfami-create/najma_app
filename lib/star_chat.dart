import 'package:flutter/material.dart';
import 'database_service.dart'; // 🔗 ربط الشات بالخدمات السحابية لإرسال الهدايا النقدية فوراً

class StarChat extends StatelessWidget {
  const StarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D), // الأسود العميق للتطبيق
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.04), // بار زجاجي شفاف
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFF8A2BE2),
            child: Icon(Icons.person, color: Colors.white),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "المؤثر النجمي",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                // 🟢 المؤشر الذكي للاتصال الفوري (Online) الذي طلبته
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.greenAccent.withOpacity(0.6), blurRadius: 4, spreadRadius: 1)
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Text("متصل الآن", style: TextStyle(color: Colors.greenAccent, fontSize: 11)),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam_rounded, color: Colors.white70),
            onPressed: () => debugPrint("جاري بدء اتصال مرئي مشفر..."),
          ),
        ],
      ),
      body: Column(
        children: [
          // 💬 مساحة عرض الرسائل التفاعلية
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                _buildMessageBubble("مرحباً! كيف يمكنني دعم محتواك اليوم؟", true),
                _buildMessageBubble("أهلاً بك! يمكنك إرسال الدعم المالي مباشرة عبر زر StarPay في الأسفل 🌟", false),
                _buildMessageBubble("رائع! سأقوم بتحويل 20 دولاراً الآن.", true),
              ],
            ),
          ),

          // 📥 شريط إدخال الرسائل المطور وزر محفظة StarPay
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.02),
              border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05))),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  // 💳 زر الدفع السريع والتحويل الفوري من داخل المحادثة
                  GestureDetector(
                    onTap: () {
                      // الخصم والمزامنة السحابية الفورية للأموال
                      DatabaseService.syncWalletBalance("user_101", 20.0, "هدية دعم مالي مباشر عبر الشات");
                    },
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFF8A2BE2), Color(0xFFFFD700)]),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: const Color(0xFF8A2BE2).withOpacity(0.3), blurRadius: 8)
                        ],
                      ),
                      child: const Icon(Icons.stars_rounded, color: Color(0xFF0D0D0D), size: 22),
                    ),
                  ),
                  const SizedBox(width: 10),
                  
                  // حقل كتابة النص الزجاجي
                  Expanded(
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.white.withOpacity(0.08)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "اكتب رسالة مشعة...",
                          hintStyle: TextStyle(color: Colors.white38, fontSize: 13),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // زر الإرسال
                  IconButton(
                    icon: const Icon(Icons.send_rounded, color: Color(0xFFFFD700)),
                    onPressed: () => debugPrint("تم إرسال الرسالة سحابياً."),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // ويدجت لبناء فقاعات المحادثة
  static Widget _buildMessageBubble(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF8A2BE2).withOpacity(0.2) : Colors.white.withOpacity(0.06),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: Radius.circular(isMe ? 15 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 15),
          ),
          border: Border.all(color: isMe ? const Color(0xFF8A2BE2).withOpacity(0.3) : Colors.white.withOpacity(0.05)),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 13)),
      ),
    );
  }
}

