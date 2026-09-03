import 'package:flutter/material.dart';
import 'database_service.dart'; // 🔗 ربط المتجر بالخدمات السحابية لتحديث الأرصدة عند الشراء

class StarMarket extends StatelessWidget {
  const StarMarket({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة تجريبية بالمنتجات الرقمية والمادية التي يعشقها المستخدمون
    final List<Map<String, String>> products = [
      {"name": "سماعة المستقبل اللاسلكية", "price": "150.00", "image": "🎧"},
      {"name": "نظارة الواقع الافتراضي النجمية", "price": "350.00", "image": "🥽"},
      {"name": "ساعة ذكية الإصدار المضيء", "price": "200.00", "image": "⌚"},
      {"name": "اشتراك نجمة بريميوم السنوي", "price": "50.00", "image": "🌟"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D), // الأسود العميق لمنصة نجمة
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🛍️ عنوان المتجر الذكي
              const Text(
                "متجر نَجْمَة الذكي",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "تسوق منتجات المؤثرين المفضلة بضغطة زر عبر StarPay",
                style: TextStyle(color: Colors.white60, fontSize: 13),
              ),
              const SizedBox(height: 25),

              // 📦 شبكة عرض المنتجات (Grid View)
              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.04), // تأثير زجاجي
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white.withOpacity(0.08)),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // أيقونة تمثل صورة المنتج
                          Center(
                            child: Text(
                              product["image"]!,
                              style: const TextStyle(fontSize: 50),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product["name"]!,
                                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "\$${product["price"]}",
                                style: const TextStyle(color: Color(0xFFFFD700), fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // 💳 زر الشراء الفوري المرتبط بالمحفظة السحابية
                          GestureDetector(
                            onTap: () {
                              final double price = double.parse(product["price"]!);
                              // تنفيذ المزامنة والخصم السحابي فوراً من محفظة StarPay
                              DatabaseService.syncWalletBalance("user_101", price, "شراء من المتجر: ${product["name"]}");
                            },
                            child: Container(
                              width: double.infinity,
                              height: 35,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF8A2BE2), Color(0xFFFFD700)],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "شراء سريع",
                                  style: TextStyle(color: Color(0xFF0D0D0D), fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

