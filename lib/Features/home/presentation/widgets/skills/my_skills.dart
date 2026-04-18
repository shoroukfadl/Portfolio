import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Core/Theme/theme_colors.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';

import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final skills = [
      SkillModel(
        icon: '📱',
        title: 'Flutter',
        description:
        'Expert in building cross-platform mobile applications with Flutter.',
      ),
      SkillModel(
        icon: '🎨',
        title: 'UI/UX Design',
        description: 'Creating beautiful and intuitive user interfaces.',
      ),
      SkillModel(
        icon: '🔧',
        title: 'Backend Integration',
        description: 'Proficient in REST APIs, Firebase, and real-time databases.',
      ),
      SkillModel(
        icon: '🐙',
        title: 'Version Control',
        description:
        'Git workflows, collaborative development, and clean histories.',
      ),
      SkillModel(
        icon: '🧪',
        title: 'Testing',
        description:
        'Unit testing, widget testing, and integration testing.',
      ),
      SkillModel(
        icon: '📊',
        title: 'Performance',
        description:
        'App optimization, memory profiling, and battery efficiency.',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [
                const Color(0xFFff006e),
                const Color(0xFF00d9ff),
              ],
            ).createShader(bounds),
            child: const Text(
              'Core Skills',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 768 ? 3 : 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.2,
            ),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return SkillCard(skill: skills[index], index: index);
            },
          ),
        ],
      ),
    );
  }
}




