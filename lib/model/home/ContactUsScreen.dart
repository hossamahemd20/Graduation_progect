import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // تأكد من الاستيراد


class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6FA),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF8180B6)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'اتصل بنا',
            style: TextStyle(color: Color(0xFF8180B6), fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: const [
                    Icon(Icons.support_agent, size: 80, color: Color(0xFF8180B6)),
                    SizedBox(height: 10),
                    Text(
                      'يسعدنا تواصلك معنا',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF8180B6)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'أرسل استفسارك أو اقتراحك وسنرد عليك في أقرب وقت.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              _buildField(label: 'الاسم'),
              const SizedBox(height: 16),
              _buildField(label: 'البريد الإلكتروني'),
              const SizedBox(height: 16),
              _buildField(label: 'اكتب رسالتك هنا...', maxLines: 5),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text('إرسال'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8180B6),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 20),
              const Text(
                'معلومات التواصل',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF8180B6)),
              ),
              const SizedBox(height: 15),
              _buildContactInfo(Icons.phone, 'رقم الهاتف: +20 101 234 5678'),
              _buildContactInfo(Icons.email_outlined, 'البريد الإلكتروني: info@school-system.com'),
              _buildContactInfo(Icons.location_on, 'العنوان: القاهرة، مصر'),
              const SizedBox(height: 25),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  children: [
                    _socialIcon(Icons.facebook, 'https://www.facebook.com/yourpage'),
                    _socialIcon(FontAwesomeIcons.whatsapp, 'https://wa.me/201012345678'),
                    _socialIcon(Icons.email, 'mailto:info@school-system.com'),
                    _socialIcon(Icons.language, 'https://school-system.com'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField({required String label, int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF8180B6)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF8180B6), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF8180B6)),
          const SizedBox(width: 10),
          Expanded(child: Text(info, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, color: const Color(0xFF8180B6), size: 30),
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        }
      },
    );
  }
}
