import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeInAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _handleSend() async {
    if (_formKey.currentState!.validate()) {
      // هنا تقدر تبعت البيانات إلى Firebase
      final name = nameController.text.trim();
      final email = emailController.text.trim();
      final message = messageController.text.trim();



      nameController.clear();
      emailController.clear();
      messageController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إرسال الرسالة وسيتم مراجعتها من قبل الإدارة'),
          backgroundColor: Color(0xFF8180B6),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const mainColor = Color(0xFF8180B6);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6FA),
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Colors.white, textDirection: TextDirection.ltr),
              onPressed: () => Navigator.pop(context),
            ),
          ],
          title: const Text(
            'اتصل بنا',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: FadeTransition(
          opacity: _fadeInAnimation,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: const [
                        Icon(Icons.support_agent,
                            size: 80, color: mainColor),
                        SizedBox(height: 10),
                        Text(
                          'يسعدنا تواصلك معنا',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: mainColor),
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
                  _buildField(controller: nameController, label: 'الاسم'),
                  const SizedBox(height: 16),
                  _buildField(
                      controller: emailController, label: 'البريد الإلكتروني'),
                  const SizedBox(height: 16),
                  _buildField(
                      controller: messageController,
                      label: 'اكتب رسالتك هنا...',
                      maxLines: 5),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.send),
                      label: const Text('إرسال'),
                      onPressed: _handleSend,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Divider(),
                  const SizedBox(height: 20),
                  const Text(
                    'معلومات التواصل',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  ),
                  const SizedBox(height: 15),
                  _buildContactInfo(Icons.phone, 'رقم الهاتف: +20 101 234 5678'),
                  _buildContactInfo(Icons.email_outlined,
                      'البريد الإلكتروني: info@school-system.com'),
                  _buildContactInfo(Icons.location_on, 'العنوان: القاهرة، مصر'),
                  const SizedBox(height: 25),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      children: [
                        _socialIcon(Icons.facebook,
                            'https://www.facebook.com/yourpage'),
                        _socialIcon(FontAwesomeIcons.whatsapp,
                            'https://wa.me/201012345678'),
                        _socialIcon(Icons.email,
                            'mailto:info@school-system.com'),
                        _socialIcon(
                            Icons.language, 'https://school-system.com'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'يرجى ملء هذا الحقل';
        }
        return null;
      },
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
