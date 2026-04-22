import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceEntity> experiences;
  const ExperienceSection({super.key, this.experiences = const []});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Test Run Reports',
            style: AppTextStyles.semiBold24(

              color: colors.accent,
            ),
          ),
          const SizedBox(height: 16),
          ...experiences.map((exp) {
            final isActive = exp.status ;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: colors.accent,
                      width: 2,
                    ),
                  ),
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exp.companyName??"",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:colors.accent,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              exp.jobTitle??"",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isActive
                                ? Colors.green.withOpacity(0.2)
                                : Colors.blue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            exp.status?'Active':'Closed',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: isActive ? Colors.green[300] : Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      exp.period??"",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'monospace',
                        color: colors.accent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      exp.responsibilities.firstOrNull??"",
                      style: TextStyle(
                        fontSize: 13,
                        color: colors.accent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
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
