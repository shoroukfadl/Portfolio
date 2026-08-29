import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Widgets/Buttons/theme_button.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/appbar_helper.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/home_app_bar_item.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';

import '../../../Features/home/presentation/cubit/cubit.dart';
import '../../../Features/home/presentation/cubit/state.dart';
import '../../../Utilities/Constants/constants.dart';
import '../../../Utilities/Constants/enums.dart';
import '../../../Utilities/Constants/global_keys.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Utilities/extensions.dart';
import 'menu_item_button.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({
    super.key,
  });

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _ctrl;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _fadeAnim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
    _scaleAnim = Tween<double>(begin: 0.95, end: 1.0)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));

    _ctrl.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() => _isOpen = false);
      }
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _toggle() {
    if (_isOpen) {
      _ctrl.reverse();
    } else {
      setState(() => _isOpen = true);
      _ctrl.forward();
    }
  }

  Widget sectionsWidget({
    required HomeSection section,
    required GlobalKey key,
    required String title,
  }) =>
      BlocBuilder<PortfolioCubit, PortfolioState>(
          buildWhen: (c, p) => c.section != p.section,
          builder: (context, state) {
            return HomeAppBarItem(
              onTap: () {
                context.read<PortfolioCubit>().changeSection(
                      section,
                    );
                Scrollable.ensureVisible(
                  key.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
                _ctrl.reverse();
              },
              selected: state.section == section,
              title: title,
            );
          });

  List<Widget> get paths => [
        sectionsWidget(
          section: HomeSection.about,
          key: GlobalKeys.aboutMe,
          title: Strings.aboutMe.translate,
        ),
        sectionsWidget(
          section: HomeSection.skills,
          key: GlobalKeys.skill,
          title: Strings.mySkill.translate,
        ),
        sectionsWidget(
          section: HomeSection.experience,
          key: GlobalKeys.experince,
          title: Strings.experience.translate,
        ),
        sectionsWidget(
          section: HomeSection.projects,
          key: GlobalKeys.projects,
          title: Strings.projects.translate,
        ),
        sectionsWidget(
          section: HomeSection.education,
          key: GlobalKeys.education,
          title: Strings.education.translate,
        ),
      ];

  @override
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = 56.0;
    final padding = context.isMedium ? tabletHozPadding : mobileHozPadding;

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none, // ← اتنقل لبره الـ Container
      children: [
        // ── AppBar ──
        Container(
          height: size,
          width: double.infinity,
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: padding, vertical: 8),
          decoration: BoxDecoration(
            color: colors.surface,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HamburgerBtn(
                isOpen: _isOpen,
                onTap: _toggle,
              ),
              NameAppBar(),
              ThemeButton(),
            ],
          ),
        ),

        // ── Dropdown overlay ──
        Positioned(
          left: 0,
          width: 180,
          top: size,
          child: FadeTransition(
            opacity: _fadeAnim,
            child: ScaleTransition(
              scale: _scaleAnim,
              alignment: Alignment.center,
              child: AnimatedBackground(
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: paths,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
