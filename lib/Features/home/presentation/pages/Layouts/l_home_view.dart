import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';

import '../../../../../Utilities/extensions.dart';
import '../../widgets/aboutMe/about_me_widget.dart';
import '../../widgets/contact/contact_me.dart';
import '../../widgets/education/education_widget.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/project/my_projects_widget.dart';
import '../../widgets/skills/my_skills.dart';

class LargeHomeView extends StatelessWidget {
  const LargeHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        /// about
        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => p.data?.profile != c.data?.profile,
              builder: (context, s) {
                return SummarySection(
                  profile: s.data?.profile,
                ).paddingSymmetric(horizontal: Constants.desktopHozPadding);
              }),
        ),

        /// skills
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => p.data?.skills != c.data?.skills,
                builder: (context, s) {
                  return SkillsSection(
                    skills: s.data?.skills ??[],
                  );
                })),
        SliverToBoxAdapter(child: 64.0.heightBox),

        /// experince
        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => p.data?.experience != c.data?.experience,
              builder: (context, s) {
                return ExperienceSection(
                  experiences: s.data?.experience ?? [],
                );
              }),
        ),


        /// education
        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => p.data?.education != c.data?.education,
              builder: (c, s) =>
                  EducationSection(education: s.data?.education.firstOrNull)),
        ),
        //
        SliverPadding(
            padding: const EdgeInsets.all(Constants.desktopHozPadding),
            sliver: SliverToBoxAdapter(
                child:BlocBuilder<PortfolioCubit, PortfolioState>(
    buildWhen: (c, p) => p.data?.projects != c.data?.projects,
    builder: (c, s) => MyProjectsWidget(
              projects:s.data?.projects??[],
            )))),
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => p.data?.profile != c.data?.profile,
                builder: (c, s) => ContactMeWidget(
                      email: s.data?.profile?.email ?? "",
                      linkedIN: s.data?.profile?.linkedin ?? "",
                      phoneNumber: s.data?.profile?.phone ?? "",
                      github: s.data?.profile?.github ?? "",
                    )))
      ],
    );
  }
}



class StackCard extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;
  final ScrollController controller;

  const StackCard({
    super.key,
    required this.index,
    required this.data,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // حساب الـ "Stacking" - كل كارت بيفضل مكانه لما يوصل فوق
        double cardHeight = MediaQuery.of(context).size.height * 0.8;
        double scrollOffset = controller.hasClients ? controller.offset : 0.0;
        double cardPosition = (index * cardHeight);

        // الـ Logic السحري هنا:
        double topPadding =
            (cardPosition - scrollOffset).clamp(0.0, double.infinity);

        return Container(
          height: cardHeight,
          margin: EdgeInsets.only(
              top: index == 0 ? 0 : 0), // إلغاء المسافات بين الكروت
          padding: EdgeInsets.only(top: topPadding > 0 ? 0 : 0),
          child: Transform.translate(
            offset: Offset(0, topPadding > 0 ? 0 : 0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: data['color'],
                border: const Border(
                    top: BorderSide(color: Colors.white10, width: 0.5)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 40,
                      offset: const Offset(0, -20))
                ],
              ),
              padding: const EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("0${index + 1}",
                      style: const TextStyle(
                          color: Colors.blueAccent, fontFamily: 'monospace')),
                  const SizedBox(height: 20),
                  Text(data['title'],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  Text(data['content'],
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 18)),
                  const Spacer(),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.arrow_downward,
                        color: Colors.white10, size: 40),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DNASkillsView extends StatefulWidget {
  @override
  _DNASkillsViewState createState() => _DNASkillsViewState();
}

class _DNASkillsViewState extends State<DNASkillsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(double.infinity, 400),
          painter: DNAPainter(_controller.value),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class DNAPainter extends CustomPainter {
  final double animationValue;

  DNAPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..strokeWidth = 3.0;
    final paint2 = Paint()..strokeWidth = 3.0;
    final linePaint = Paint()
      ..color = Colors.white24
      ..strokeWidth = 1.0;

    int pointsCount = 15;
    double verticalSpacing = size.height / pointsCount;

    for (int i = 0; i < pointsCount; i++) {
      // الموجة الأولى
      double angle = (i / pointsCount) * 2 * pi + (animationValue * 2 * pi);
      double x1 = (size.width / 2) + sin(angle) * 80;
      double y1 = i * verticalSpacing + 20;

      // الموجة الثانية (عكس الأولى)
      double x2 = (size.width / 2) + sin(angle + pi) * 80;
      double y2 = i * verticalSpacing + 20;

      // تحديد الألوان حسب العمق (عشان تبان 3D)
      double depth1 = cos(angle);
      double depth2 = cos(angle + pi);

      // رسم الخط الرابط بين المهرتين
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), linePaint);

      // رسم "نقطة المهارة" الأولى
      paint1.color = Colors.blue.withOpacity(depth1 > 0 ? 1 : 0.3);
      canvas.drawCircle(Offset(x1, y1), 6 + (depth1 * 2), paint1);

      // رسم "نقطة المهارة" الثانية
      paint2.color = Colors.cyan.withOpacity(depth2 > 0 ? 1 : 0.3);
      canvas.drawCircle(Offset(x2, y2), 6 + (depth2 * 2), paint2);
    }
  }

  @override
  bool shouldRepaint(DNAPainter oldDelegate) => true;
}
