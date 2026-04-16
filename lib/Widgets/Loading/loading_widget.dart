import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Utilities/extensions.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingWidget({super.key, this.isLoading = false, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return !isLoading
        ? SpinKitCubeGrid(
            color: colors.accent,
          )
        : child;
  }
}
