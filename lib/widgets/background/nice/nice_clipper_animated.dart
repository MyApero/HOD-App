import 'package:flutter/material.dart';
import 'package:hod_app/widgets/background/nice/nice_clipper.dart';

class NiceClipperAnimated extends StatefulWidget {
  const NiceClipperAnimated({super.key, this.child});

  final Widget? child;

  @override
  State<NiceClipperAnimated> createState() => _NiceClipperAnimatedState();
}

class _NiceClipperAnimatedState extends State<NiceClipperAnimated>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  double value = 200;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    // animation = Tween<double>(begin: 5, end: 30).animate(controller)
    //   ..addListener(() {
    //     setState(() {
    //       value = animation.value;
    //     });
    //   });
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addListener(
        () {
          setState(() {
            value = animation.value * 35 + 10;
          });
        },
      );
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NiceClipper(value: value,);
  }
}
