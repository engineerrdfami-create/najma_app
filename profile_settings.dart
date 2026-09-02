import 'package:flutter/material.dart';
import 'database_service.dart'; // 🔗 ربط الإعدادات بالسيرفر لتحديث البيانات الشخصية
import 'security_service.dart'; // 🔒 ربط مفتاح الأمان بمستشعر البصمة

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  bool _isBiometricEnabled = true; // حالة تفعيل البصمة الافتراضية
  String _currentLanguage = "العربية"; // اللغة الافتراضية للتطبيق

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A), // ⚫ الأسود الملكي العميق
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.02),
        elevation: 0,
        title: const Text(
          "إعدادات الحساب والنجمة",
          style: TextStyle(color: Color(0xFFFFD700), fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFFFD700)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // 👤 بطاقة صانع المحتوى العلوية المصقولة بالذهب
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.02),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xFFFFD700).withOpacity(0.15)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFFFFD700).withOpacity(0.1),
                  child: const Icon(Icons.star_rounded, color: Color(0xFFFFD700), size: 35),
                ),
                const SizedBox(width: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("المبرمج النجم @engineer", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("engineer.rdfami@gmail.com", style: TextStyle(color: Colors.white38, fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 30),

          // ⚙️ المجموعة الأولى: إعدادات الحساب واللغة
          _buildSectionTitle("إدارة المنصة"),
          _buildSettingTile(Icons.language_rounded, "لغة التطبيق", _currentLanguage, () {
            setState(() {
              // 🌐 التبديل الفوري والذكي بين اللغتين بضغطة زر واحدة
              _currentLanguage = _currentLanguage == "العربية" ? "English" : "العربية";
            });
            debugPrint("تم تغيير لغة منصة نجمة إلى: $_currentLanguage");
          }),
          _buildSettingTile(Icons.edit_note_rounded, "تعديل الملف الشخصي", "تحديث البيانات", () {
            DatabaseService.registerUser("engineer", "engineer.rdfami@gmail.com", "updated_pass");
          }),
          const SizedBox(height: 25),

          // 🔒 المجموعة الثانية: الأمان والتحكم المالي
          _buildSectionTitle("الأمان والمالية StarPay"),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.02),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.04)),
            ),
            child: SwitchListTile(
              secondary: const Icon(Icons.fingerprint_rounded, color: Color(0xFFFFD700)),
              title: const Text("قفل المحفظة بالبصمة", style: TextStyle(color: Colors.white, fontSize: 14)),
              subtitle: const Text("حماية بيومترية صارمة لمنع السرقات", style: TextStyle(color: Colors.white38, fontSize: 11)),
              activeColor: const Color(0xFFFFD700),
              activeTrackColor: const Color(0xFFFFD700).withOpacity(0.2),
              value: _isBiometricEnabled,
              onChanged: (bool value) async {
                if (value) {
                  // فحص المستشعر البيومتري فور محاولة التشغيل
                  bool available = await SecurityService.checkBiometricsAvailable();
                  setState(() => _isBiometricEnabled = available);
                } else {
                  setState(() => _isBiometricEnabled = false);
                }
              },
            ),
          ),
          _buildSettingTile(Icons.account_balance_wallet_rounded, "تفاصيل أرباح البث المباشر", "عرض السجل", () {
            debugPrint("جاري سحب تقرير الأرباح المالي السحابي...");
          }),
        ],
      ),
    );
  }

  // ويدجت لبناء عناوين المجموعات
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, bottom: 8),
      child: Text(title, style: const TextStyle(color: Colors.white60, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
    );
  }

  // ويدجت لبناء أسطر الخيارات المصقولة
  Widget _buildSettingTile(IconData icon, String title, String trailingText, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: const Color(0xFFFFD700)),
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(trailingText, style: const TextStyle(color: Color(0xFFFFD700), fontSize: 12)),
            const SizedBox(width: 5),
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white24, size: 14),
          ],
        ),
      ),
    );
  }
}

