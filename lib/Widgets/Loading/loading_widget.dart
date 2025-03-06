import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:portfolio/Core/Theme/theme_model.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const LoadingWidget({super.key, this.isLoading = false, required this.child});

  @override
  Widget build(BuildContext context) {
    return !isLoading
         ? SpinKitCubeGrid(color: ThemeFactory.of(context).primary,)
        : child;
  }
}
