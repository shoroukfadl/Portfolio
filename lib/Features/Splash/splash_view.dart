import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/pages/home_view.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';

import '../../../../Utilities/extensions.dart';
import '../../Widgets/Animation/loading_text_animation.dart';
import '../home/presentation/cubit/cubit.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/";

  const SplashScreen({
    super.key,
  });

  @override
  createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocListener<PortfolioCubit, PortfolioState>(
        listener: (c, state) {
          if (state.loading == RequestStatus.success) {
            context.goNamed(HomeView.routeName);
          }
        },
        listenWhen: (p, n) => p.loading != n.loading,
        child: Scaffold(
          backgroundColor: colors.background,
          body:
              AnimatedBackground(child:
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    24.0.heightBox,
                    const LoadingTextWidget()
                  ],
                ),
              ),

          ),
        ));
  }
}
