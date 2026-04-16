import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';

import '../../../../Homel/home_controller.dart';
import '../../widgets/aboutMe/about_me_widget.dart';
import '../../widgets/contact_me.dart';
import '../../widgets/education/education_widget.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/my_projects_widget.dart';
import '../../widgets/skills/my_skills.dart';

class LargeHomeView extends StatelessWidget {
  final HomeController con;

  const LargeHomeView({super.key, required this.con});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        // 32.0.heightBox,
        SliverToBoxAdapter(
          child: AboutMeWidget(
            name: con.user?.name ?? "shorouk fadl",
            role: con.user?.jobName ?? "flutter developer",
            desc: con.user?.summary ??
                "Jenny’s Exceptional product design ensure our website’s success. Highly Recommended",
          ),
        ),
        // 64.0.heightBox,
        //
        SliverToBoxAdapter(
            child: MySkillsWidget(
          skills: [
            SkillModel(
                skillTitle: 'FrameWork', skills: ['Flutter', 'Flutter Web']),
            SkillModel(
                skillTitle: 'FrameWork', skills: ['Flutter', 'Flutter Web']),
            SkillModel(
                skillTitle: 'FrameWork', skills: ['Flutter', 'Flutter Web']),
            SkillModel(
                skillTitle: 'FrameWork', skills: ['Flutter', 'Flutter Web']),
            SkillModel(
                skillTitle: 'FrameWork', skills: ['Flutter', 'Flutter Web']),
            SkillModel(
                skillTitle: 'FrameWork', skills: ['Flutter', 'Flutter Web']),
          ],
        )),
        // 64.0.heightBox,
        //
        SliverToBoxAdapter(
            child: ExperienceCardWidget(
          items: con.user?.experience ?? [],
        )),
        // 64.0.heightBox,
        SliverPadding(
          padding: const EdgeInsets.all(Constants.desktopHozPadding),
          sliver: SliverToBoxAdapter(
            child: EducationWidget(
              item: con.user?.eduction ??
                  EductionModel(
                      country: 'Egp',
                      date: '2023',
                      desc:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacus nunc, posuere in justo vulputate, bibendum sodales ',
                      uniName: 'FCGS OF COMPAUTER '),
            ),
          ),
        ),
        //
        SliverPadding(
            padding: const EdgeInsets.all(Constants.desktopHozPadding),
            sliver: SliverToBoxAdapter(
                child: MyProjectsWidget(
              projects: con.user?.project ??
                  [
                    ProjectModel(
                        description: 'fuiewru',
                        companyName: 'ddwrs comf',
                        images: [
                          'https://tse2.mm.bing.net/th/id/OIP.e6voHjED4omwbyU6TqoCmwHaE8?rs=1&pid=ImgDetMain&o=7&rm=3',
                          'https://tse2.mm.bing.net/th/id/OIP.e6voHjED4omwbyU6TqoCmwHaE8?rs=1&pid=ImgDetMain&o=7&rm=3'
                        ],
                        link: '',
                        projectName: 'detts',
                        projectType: 'web')
                  ],
            ))),
        SliverToBoxAdapter(child: ContactMeWidget(con: con))
      ],
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
