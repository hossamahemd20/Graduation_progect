import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_svg/flutter_svg.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('About Us', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF8180B6),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            _buildHeader(context),

            // Mission Section
            _buildMissionSection(),

            // Features Section
            _buildFeaturesSection(),

            // FAQ Section
            _buildFAQSection(),

            // Team Section (6 members)
            _buildTeamSection(),

            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(
        color: Color(0xFF8180B6),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 60, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              'Student Information System',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'نظام متكامل لإدارة العملية التعليمية',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'رؤيتنا ورسالتنا',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8180B6),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  const Text(
                    'نهدف إلى تطوير وتسهيل العملية التعليمية في مصر من خلال توفير نظام معلوماتي متكامل يوفر الوقت والجهد لكل من الطلاب والمعلمين والإداريين، مع ضمان دقة البيانات وسهولة الوصول إليها في أي وقت ومن أي مكان.',
                    style: TextStyle(fontSize: 16, height: 1.6),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatItem('100+', 'مدرسة تستخدم النظام'),
                      ),
                      Expanded(
                        child: _buildStatItem('50K+', 'طالب مسجل'),
                      ),
                      Expanded(
                        child: _buildStatItem('24/7', 'دعم فني'),
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

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8180B6),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFeaturesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      color: Colors.grey[50],
      child: Column(
        children: [
        Text(
        'لماذا تختار نظامنا؟',
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF8180B6),
        ),
        ),
          SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildFeatureCard(
                  Icons.cloud,
                  'سحابي بالكامل',
                  'يمكن الوصول للنظام من أي جهاز متصل بالإنترنت دون الحاجة لتثبيت برامج'
              ),
              _buildFeatureCard(
                  Icons.security,
                  'آمن ومحمي',
                  'نظام متكامل للحماية والنسخ الاحتياطي التلقائي للبيانات'
              ),
              _buildFeatureCard(
                  Icons.analytics,
                  'تقارير ذكية',
                  'نوفر تحليلات وتقارير مفصلة لمساعدة المدارس في اتخاذ القرارات'
              ),
              _buildFeatureCard(
                  Icons.accessibility,
                  'سهل الاستخدام',
                  'واجهة بسيطة وسهلة الاستخدام لجميع الفئات العمرية'
              ),
            ],
          ),
        ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String desc) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: const Color(0xFF8180B6)),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'أسئلة شائعة',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8180B6),
            ),
          ),
          SizedBox(height: 30),
          ExpansionTile(
            title: Text('كيف يسهم النظام في تطوير التعليم المصري؟'),
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'يوفر النظام بيئة متكاملة تربط بين جميع أطراف العملية التعليمية (طلاب، معلمين، إداريين، أولياء أمور) مما يقلل من الوقت الضائع في العمليات الإدارية ويركز على الجانب التعليمي الأساسي.',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
          Divider(),
          ExpansionTile(
            title: Text('هل النظام متوافق مع أنظمة وزارة التربية والتعليم؟'),
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'نعم، تم تطوير النظام بالتعاون مع خبراء تربويين ليكون متوافقًا تمامًا مع متطلبات وزارة التربية والتعليم المصرية، كما يمكن تخصيصه حسب احتياجات كل مدرسة.',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
          Divider(),
          ExpansionTile(
            title: Text('ما هي تكلفة استخدام النظام؟'),
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'نقدم عدة باقات تناسب جميع أحجام المدارس بدءًا من باقة مجانية مع ميزات أساسية وحتى باقات متكاملة بأسعار تنافسية، مع خصومات خاصة للمدارس الحكومية.',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      color: const Color(0xFF8180B6).withOpacity(0.05),
      child: Column(
        children: [
        Text(
        'فريق العمل',
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF8180B6),
        ),
        ),
         SizedBox(height: 40),
        Text(
          'خبراء في التعليم والتقنية لخدمة مستقبل أفضل',
          style: TextStyle(color: Colors.grey[600]),
        ),

        const SizedBox(height: 40),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildTeamMember('Eng. Ismail Ahmed Aboelhamd', ' Flutter Developer', 'assets/images/sgs logo.png'),
              _buildTeamMember('Eng.  Hossam Ahmed Hassan', 'Flutter Developer', 'assets/team/2.jpg'),
              _buildTeamMember('Eng.  Mohamed Abdelfatah. ', 'Back End Developer', 'assets/team/3.jpg'),
              _buildTeamMember('Eng. Mostafa Mohamed  ', 'Back End Developer', 'assets/team/4.jpg'),
              _buildTeamMember('Eng. Manar Ahmed Ezz', 'UI/UX Designer', 'assets/team/5.jpg'),
              _buildTeamMember('Eng. Aya Seif', 'Front End Developer', 'assets/team/6.jpg'),
            ],
          ),
        ),

        ],
      ),
    );
  }

  Widget _buildTeamMember(String name, String role, String imagePath) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: const Color(0xFF8180B6),
                width: 3,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            role,
            style: const TextStyle(color: Color(0xFF8180B6)),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      color: const Color(0xFF8180B6),
      child: Column(
        children: [
          const Text(
            'Student Information System',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'نحو تعليم مصري أكثر تطورًا وسهولة',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.facebook, 'https://www.facebook.com/share/1Yywr7AvQ7/'),
              _buildSocialIcon(Icons.email, 'mailto:example@email.com'),
              _buildSocialIcon(Icons.phone, 'tel:+201234567890'),
              _buildSocialIcon(Icons.language, 'https://yourwebsite.com'),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '© 2023 جميع الحقوق محفوظة',
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: const Color(0xFF8180B6)),
      ),
    );
  }
}