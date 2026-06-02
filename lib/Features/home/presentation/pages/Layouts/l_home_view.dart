import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';

import '../../widgets/certification/certification_widget.dart';
import '../../widgets/education/education_widget.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/products/my_projects.dart';
import '../../widgets/skills/my_skills.dart';

class LargeHomeView extends StatelessWidget {
  const LargeHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        SliverToBoxAdapter(child: 40.0.heightBox,),
        /// Skills
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => c.data?.skills != p.data?.skills,
                builder: (context, state) {
                  return SkillsSection(
                    skills: state.data?.skills ?? [],
                  ).paddingOnly(start: 40,end: Constants.desktopHozPadding);
                })),

        SliverToBoxAdapter(child: 40.0.heightBox,),

        /// Experince
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => c.data?.experience != p.data?.experience,
                builder: (context, state) {
                  return ExperienceSection(
                    experiences: state.data?.experience ?? [],
                  ).paddingOnly(start: 40,end: Constants.desktopHozPadding);
                })),

        SliverToBoxAdapter(child: 40.0.heightBox,),

        SliverToBoxAdapter(
              child: BlocBuilder<PortfolioCubit, PortfolioState>(
                  buildWhen: (c, p) => c.data?.education != p.data?.education,
                  builder: (context, state) {
                    return EducationSection(
                        education: state.data?.education ?? []).paddingOnly(start: 40,end: Constants.desktopHozPadding);
                  }),
            ),

        SliverToBoxAdapter(child: 40.0.heightBox,),
        SliverToBoxAdapter(
              child: BlocBuilder<PortfolioCubit, PortfolioState>(
                  buildWhen: (c, p) =>
                      c.data?.certificates != p.data?.certificates,
                  builder: (context, state) {
                    return CertificationSection(
                        data: state.data?.certificates ?? []).paddingOnly(start: 40,end: Constants.desktopHozPadding);
                  }),
            ),

        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) =>
              c.data?.projects != p.data?.projects,
              builder: (context, state) {
                return MyProjectsWidget(
                    projects: state.data?.projects ?? []).paddingOnly(start: 40,end: Constants.desktopHozPadding);
              }),
        ),
      ],
    );
  }
}

class QADashboardHome extends StatefulWidget {
  const QADashboardHome({Key? key}) : super(key: key);

  @override
  State<QADashboardHome> createState() => _QADashboardHomeState();
}

class _QADashboardHomeState extends State<QADashboardHome>
    with TickerProviderStateMixin {
  bool darkMode = true;
  int currentSection = 0;
  bool systemScanning = true;
  double scanProgress = 0;
  int? selectedProjectIndex;
  bool terminalOpen = false;
  final TextEditingController terminalController = TextEditingController();
  final List<String> terminalOutput = [
    'QA_SYSTEM v1.0 initialized...',
    'Type "help" for commands'
  ];
  late ScrollController scrollController;
  late AnimationController scanAnimController;

  final List<String> sections = [
    'System',
    'Skills',
    'Experience',
    'Projects',
    'Pipeline'
  ];

  final Map<String, String> terminalCommands = {
    'help':
        'Commands: skills, exp, projects, certs, contact, about, status, clear',
    'skills':
        'TECHNICAL_SKILLS = {Testing_Tools: [Selenium, Postman, JMeter], Languages: [Java, Dart, JavaScript]}',
    'exp':
        'WORK_EXPERIENCE = [{Gulf Grid Company, QC Engineer, Jan2025-Present}, {Noouh Company, Test Engineer, Sep2024-Jan2025}]',
    'projects':
        'PROJECTS = [E-commerce, ERP System, HR Management, Banking App, Payment Gateway, Cryptocurrency Wallet]',
    'about':
        'PROFILE = {Name: Mohamed Mamdouh, Title: Senior QC Engineer, Experience: 3+ years, Location: Giza, Egypt}',
    'certs':
        'CERTIFICATIONS = [IBM - Web Development, University of Minnesota - Software Testing, Google - Agile]',
    'contact':
        'CONTACT = {Email: elnomrosymohamed@gmail.com, Phone: +20 1118712681, LinkedIn: Mohamed-Mamdouh}',
    'status':
        'System Status: OPERATIONAL | Memory: 45% | Performance: EXCELLENT',
  };

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scanAnimController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Start system scan animation
    _startSystemScan();
  }

  void _startSystemScan() {
    Timer.periodic(const Duration(milliseconds: 600), (timer) {
      if (mounted) {
        setState(() {
          scanProgress += (10 + (DateTime.now().microsecond % 20)).toDouble();
          if (scanProgress >= 100) {
            scanProgress = 100;
            systemScanning = false;
            timer.cancel();
          }
        });
      }
    });
  }

  void _handleTerminalCommand(String command) {
    final cmd = command.toLowerCase().trim();
    if (cmd == 'clear') {
      setState(() {
        terminalOutput.clear();
        terminalOutput.addAll(
            ['QA_SYSTEM v1.0 initialized...', 'Type "help" for commands']);
      });
    } else {
      String response =
          terminalCommands[cmd] ?? 'Command not found: $cmd. Type help.';
      setState(() {
        terminalOutput.add('\$ $command');
        terminalOutput.add(response);
      });
    }
    terminalController.clear();
  }

  @override
  void dispose() {
    scrollController.dispose();
    scanAnimController.dispose();
    terminalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkMode
            ? const Color(0xFF1a1a2e).withOpacity(0.8)
            : const Color(0xFFF5F5F5).withOpacity(0.9),
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00D4FF), Color(0xFF0EA5E9)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text('🧪',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'QA_DASHBOARD',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: darkMode ? const Color(0xFF00D4FF) : Colors.cyan[700],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              darkMode ? Icons.light_mode : Icons.dark_mode,
              color: darkMode ? const Color(0xFF00D4FF) : Colors.cyan[700],
            ),
            onPressed: () => setState(() => darkMode = !darkMode),
            tooltip: 'Manual/Automation Toggle',
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            // Terminal Widget
            const SizedBox(height: 20),

            // Contact Section
            _buildContactSection(),
            const SizedBox(height: 20),

            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildPipelineSection() {
    final stages = [
      {
        'phase': 'REQUIREMENTS',
        'title': 'Educational Foundation',
        'items': [
          'BSC Software Engineering - ACU (2018-2022)',
          'Grade: Very Good (B+) | GPA: 3.31/4',
          'Graduation Project: Student Registration App (Grade: A)'
        ]
      },
      {
        'phase': 'TESTING & EXECUTION',
        'title': 'Professional Experience',
        'items': [
          'Software QC Engineer - Gulf Grid Company (Jan 2025)',
          'Software Test Engineer - Noouh Company (Sep 2024)',
          'Testing Instructor - DEPI (Apr 2024)'
        ]
      },
      {
        'phase': 'RELEASE',
        'title': 'Certifications & Recognition',
        'items': [
          'IBM - Web Development Certificate',
          'University of Minnesota - Software Testing',
          'Google - Agile Project Management'
        ]
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CI/CD Pipeline',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkMode ? const Color(0xFF00D4FF) : Colors.cyan[700],
            ),
          ),
          const SizedBox(height: 24),
          ...stages.asMap().entries.map((entry) {
            final idx = entry.key;
            final stage = entry.value;
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: darkMode
                                ? const Color(0xFF00D4FF).withOpacity(0.2)
                                : Colors.cyan[200],
                          ),
                          child: Center(
                            child: Text(
                              '${idx + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: darkMode
                                    ? const Color(0xFF00D4FF)
                                    : Colors.cyan[700],
                              ),
                            ),
                          ),
                        ),
                        if (idx < stages.length - 1)
                          Container(
                            width: 2,
                            height: 100,
                            color: darkMode
                                ? const Color(0xFF00D4FF).withOpacity(0.3)
                                : Colors.cyan[300]!.withOpacity(0.3),
                          ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: darkMode
                                  ? const Color(0xFF00D4FF).withOpacity(0.2)
                                  : Colors.cyan[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'p-[lp',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: darkMode
                                    ? const Color(0xFF00D4FF)
                                    : Colors.cyan[700],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'kijiji',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...(stage['items'] as List<String>).map((item) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: 16,
                                    color: Colors.green[400],
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: darkMode
                                            ? Colors.white70
                                            : Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Initiate Connection',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkMode ? const Color(0xFF00D4FF) : Colors.cyan[700],
            ),
          ),
          const SizedBox(height: 24),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: [
              _buildContactCard('📧', 'Email', 'elnomrosymohamed@gmail.com'),
              _buildContactCard('📱', 'Phone', '+20 1118712681'),
              _buildContactCard('🔗', 'LinkedIn', 'Mohamed Mamdouh'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(String emoji, String label, String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: darkMode
              ? const Color(0xFF00D4FF).withOpacity(0.3)
              : Colors.cyan[300]!.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(12),
        color: darkMode ? Colors.white.withOpacity(0.05) : Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: darkMode ? Colors.white70 : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: darkMode ? Colors.white : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: darkMode
                ? const Color(0xFF00D4FF).withOpacity(0.2)
                : Colors.cyan[300]!.withOpacity(0.2),
          ),
        ),
        color: darkMode ? Colors.white.withOpacity(0.02) : Colors.grey[100],
      ),
      child: Column(
        children: [
          Text(
            '© 2025 QA_DASHBOARD v1.0',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              color: darkMode ? Colors.white38 : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Crafted with precision and quality',
            style: TextStyle(
              fontSize: 12,
              color: darkMode
                  ? const Color(0xFF00D4FF).withOpacity(0.6)
                  : Colors.cyan[700],
            ),
          ),
        ],
      ),
    );
  }
}
