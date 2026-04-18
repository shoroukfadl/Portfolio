import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Models/user_data_model.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/Custom/rounded_doted_widget.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class EducationWidget extends StatelessWidget {
  final EductionModel? item;
  final TextStyle? nameStyle, dateStyle, locationStyle, descriptionStyle;

  const EducationWidget(
      {super.key,
      this.item,
      this.nameStyle,
      this.dateStyle,
      this.locationStyle,
      this.descriptionStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          key: GlobalKeys.education,
          title: Strings.education.translate,
          // titleStyle: titleStyle,
          // myStyle: myStyle,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            const RoundedDotedWidget(
              padding: 4,
              innerRadius: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item?.uniName ?? "",
                  style: (nameStyle ?? AppTextStyles.medium16())
                      .copyWith(color: colors.secondary),
                ),
                Text(
                  item?.desc ?? "",
                  style: (descriptionStyle ?? AppTextStyles.regular14())
                      .copyWith(color: colors.secondary),
                )
              ],
            ).expand,
            Text(
              item?.date ?? "",
              style: (dateStyle ?? AppTextStyles.regular14())
                  .copyWith(color: colors.secondary),
            ),
          ],
        ),
      ],
    );
  }
}




class EducationTimeline extends StatefulWidget {
  const EducationTimeline({super.key});

  @override
  State<EducationTimeline> createState() => _EducationTimelineState();
}

class _EducationTimelineState extends State<EducationTimeline> {
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> educationData = [
    {
      "year": "2022 - 2026",
      "title": "Bachelor of Computer Science",
      "uni": "Your University Name",
      "desc": "Specialized in Software Engineering and Mobile Development."
    },
    {
      "year": "2021",
      "title": "Flutter Advanced Diploma",
      "uni": "Tech Academy",
      "desc": "Deep dive into Clean Architecture and State Management."
    },
    {
      "year": "2020",
      "title": "High School Diploma",
      "uni": "International School",
      "desc": "Graduated with honors, focusing on Mathematics and Physics."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          // الخط الرأسي الثابت في المنتصف
          Center(
            child: Container(
              width: 2,
              color: Colors.blueAccent.withOpacity(0.2),
            ),
          ),
          // محتوى السكرول
          ListView.builder(
            controller: _scrollController,
            itemCount: educationData.length,
            padding: const EdgeInsets.symmetric(vertical: 200), // عشان أول عنصر يبدأ من النص
            itemBuilder: (context, index) {
              return MagneticTile(
                controller: _scrollController,
                data: educationData[index],
                isLeft: index % 2 == 0, // تبديل العناصر يمين وشمال الخط
              );
            },
          ),
        ],
      );
  }
}

class MagneticTile extends StatelessWidget {
  final ScrollController controller;
  final Map<String, String> data;
  final bool isLeft;

  const MagneticTile({
    super.key,
    required this.controller,
    required this.data,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // حساب وضع العنصر بالنسبة للشاشة
        final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
        final double offset = renderBox?.localToGlobal(Offset.zero).dy ?? 0;
        final double screenHeight = MediaQuery.of(context).size.height;
        final double center = screenHeight / 2;

        // حساب المسافة عن المنتصف (كل ما قرب من الصفر كان في النص بالظبط)
        double distanceFromCenter = (offset - center).abs();
        double normalizedDistance = (1 - (distanceFromCenter / center)).clamp(0.0, 1.0);

        // تأثيرات الحركة والشفافية
        double opacity = Curves.easeIn.transform(normalizedDistance);
        double scale = 0.8 + (0.2 * normalizedDistance);
        double slideAdjustment = (1 - normalizedDistance) * (isLeft ? -50 : 50);

        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(slideAdjustment, 0),
            child: Transform.scale(
              scale: scale,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: isLeft ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isLeft) const Spacer(flex: 1),
                    // الكارت التعليمي
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.blueAccent.withOpacity(opacity * 0.5),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: isLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['year']!,
                              style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              data['title']!,
                              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data['uni']!,
                              style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data['desc']!,
                              textAlign: isLeft ? TextAlign.right : TextAlign.left,
                              style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isLeft) const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}