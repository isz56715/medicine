import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class KeyboardHider extends StatelessWidget {
  const KeyboardHider({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Get.focusScope?.unfocus();
      },
      child: child,
    );
  }
}
