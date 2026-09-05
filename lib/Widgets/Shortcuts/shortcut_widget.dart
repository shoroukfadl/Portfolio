import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShortcutWidget extends StatefulWidget {
  final Widget child;
  final Function() nextPress, previousPress;

  const ShortcutWidget({
    super.key,
    required this.child,
    required this.nextPress,
    required this.previousPress,
  });
  @override
  State<ShortcutWidget> createState() => _ShortcutWidgetState();
}

class _ShortcutWidgetState extends State<ShortcutWidget> {
  @override
  void initState() {
    super.initState();
    HardwareKeyboard.instance.addHandler(_onKey);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_onKey);
    super.dispose();
  }

  bool _onKey(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) widget.nextPress();
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        widget.previousPress();
      }
      if (event.logicalKey == LogicalKeyboardKey.escape) Navigator.pop(context);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
        focusNode: FocusNode()..requestFocus(),
        onKeyEvent: (_) {},
        child: widget.child);
  }
}
