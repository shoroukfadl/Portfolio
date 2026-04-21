import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final experiences = [
      ExperienceItem(
        position: 'Senior Flutter Developer',
        company: 'Tech Innovation Labs',
        duration: '2023 - Present',
        description:
        'Lead development of high-performance mobile applications for enterprise clients.',
        achievements: [
          'Led team of 3 developers',
          'Increased app performance by 45%',
          'Managed 5+ production apps',
        ],
        technologies: ['Flutter', 'Firebase', 'BLoC', 'REST APIs'],
        icon: '⭐',
        color: 0xFF10B981,
      ),
      ExperienceItem(
        position: 'Flutter Developer (Mid-level)',
        company: 'Digital Solutions Agency',
        duration: '2022 - 2023',
        description: 'Developed and maintained multiple Flutter applications for various clients.',
        achievements: [
          'Developed 8+ client projects',
          'Improved code quality',
          'Mentored junior developers',
        ],
        technologies: ['Flutter', 'Dart', 'Firebase', 'Getx'],
        icon: '🚀',
        color: 0xFF0EA5E9,
      ),
      ExperienceItem(
        position: 'Junior Flutter Developer',
        company: 'StartUp Mobile Company',
        duration: '2021 - 2022',
        description: 'Assisted in development of mobile applications and learned best practices.',
        achievements: [
          'Built first production app',
          'Learned Flutter fundamentals',
          'Collaborated with team',
        ],
        technologies: ['Flutter', 'Dart', 'Firebase'],
        icon: '🎯',
        color: 0xFF6366F1,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ).createShader(bounds),
            child: const Text(
              'Experience',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 60),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              return ExperienceCard(
                item: experiences[index],
                index: index,
                totalItems: experiences.length,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ExperienceItem {
  final String position;
  final String company;
  final String duration;
  final String description;
  final List<String> achievements;
  final List<String> technologies;
  final String icon;
  final int color;

  ExperienceItem({
    required this.position,
    required this.company,
    required this.duration,
    required this.description,
    required this.achievements,
    required this.technologies,
    required this.icon,
    required this.color,
  });
}

class ExperienceCard extends StatefulWidget {
  final ExperienceItem item;
  final int index;
  final int totalItems;

  const ExperienceCard({
    required this.item,
    required this.index,
    required this.totalItems,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _expandController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _expandController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() => _isExpanded = !_isExpanded);
    if (_isExpanded) {
      _expandController.forward();
    } else {
      _expandController.reverse();
    }
  }

  Color _getAccentColor() {
    return Color(widget.item.color);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = _getAccentColor();

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline line
          Row(
            children: [
              // Left timeline
              SizedBox(
                width: 60,
                child: Column(
                  children: [
                    // Dot with gradient
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            accentColor,
                            accentColor.withValues(alpha:0.6),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: accentColor.withValues(alpha:0.5),
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDark
                                ? const Color(0xFF0F172A)
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // Connecting line
                    if (widget.index < widget.totalItems - 1)
                      Container(
                        width: 2,
                        height: 140,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              accentColor.withValues(alpha:0.3),
                              accentColor.withValues(alpha:0.1),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 30),

              // Card content
              Expanded(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: _toggleExpand,
                    child: AnimatedBuilder(
                      animation: _expandController,
                      builder: (context, child) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: accentColor.withValues(alpha:
                                _isExpanded ? 0.4 : 0.2,
                              ),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: accentColor.withValues(alpha:
                                  0.15 * _expandController.value,
                                ),
                                blurRadius: 25,
                                spreadRadius: 5,
                              ),
                            ],
                            color: accentColor.withValues(alpha:
                              0.05 + (0.05 * _expandController.value),
                            ),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: accentColor.withValues(alpha:0.2),
                                      border: Border.all(
                                        color: accentColor.withValues(alpha:0.4),
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        widget.item.icon,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.item.position,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: accentColor,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          widget.item.company,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Expand indicator
                                  Transform.rotate(
                                    angle: _expandController.value * 3.14159,
                                    child: Icon(
                                      Icons.expand_more,
                                      color: accentColor,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              // Duration badge
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: accentColor.withValues(alpha:0.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: accentColor.withValues(alpha:0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  widget.item.duration,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: accentColor,
                                  ),
                                ),
                              ),

                              // Expanded content
                              SizeTransition(
                                sizeFactor: _expandController,
                                axisAlignment: -1,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 1,
                                        color: accentColor.withValues(alpha:0.2),
                                        margin: const EdgeInsets.only(
                                            bottom: 16),
                                      ),

                                      // Description
                                      Text(
                                        widget.item.description,
                                        style: TextStyle(
                                          fontSize: 13,
                                          height: 1.6,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.color,
                                        ),
                                      ),

                                      const SizedBox(height: 16),

                                      // Achievements
                                      Text(
                                        'Key Achievements',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: accentColor,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      ...widget.item.achievements
                                          .map((achievement) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 6,
                                                height: 6,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: accentColor,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  achievement,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.color,
                                                    height: 1.4,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),

                                      const SizedBox(height: 16),

                                      // Technologies
                                      Text(
                                        'Technologies',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: accentColor,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children:
                                        widget.item.technologies.map(
                                              (tech) {
                                            return Container(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 5,
                                              ),
                                              decoration: BoxDecoration(
                                                color: accentColor
                                                    .withValues(alpha:0.2),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: accentColor
                                                      .withValues(alpha:0.3),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                tech,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600,
                                                  color: accentColor,
                                                ),
                                              ),
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
