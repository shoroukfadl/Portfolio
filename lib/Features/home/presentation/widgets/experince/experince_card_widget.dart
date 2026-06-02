import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/experince/experince_item_card.dart';
import 'package:portfolio/Utilities/extensions.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceEntity> experiences;
  const ExperienceSection({super.key, this.experiences = const []});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          'Test Run Reports',
          style: AppTextStyles.semiBold24(

            color: colors.accent,
          ),
        ),
        ...experiences.map((exp) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ExperinceItemCard(
              item: exp,
            )
          );
        }).toList(),
      ],
    );
  }
}

/*    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance Testing Results',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkMode ? const Color(0xFF00D4FF) : Colors.cyan[700],
            ),
          ),
          const SizedBox(height: 16),
          ...skills.map((skill) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          skill.$1,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${skill.$2}%',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'monospace',
                            color: darkMode
                                ? const Color(0xFF00D4FF)
                                : Colors.cyan[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: skill.$2 / 100,
                        minHeight: 12,
                        backgroundColor:
                            darkMode ? Colors.white12 : Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          darkMode
                              ? const Color(0xFF00D4FF)
                              : Colors.cyan[700]!,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
*/
