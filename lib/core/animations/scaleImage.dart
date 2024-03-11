/* import 'package:flutter/material.dart';

class ScaleImage extends StatefulWidget {
  final Widget child;
  const ScaleImage({super.key, required this.child});

  @override
  _ScaleImageState createState() => _ScaleImageState();
}

class _ScaleImageState extends State<ScaleImage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ),
    );
   
      controller.forward();
      super.initState();
   
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 700),
      scale: scaleAnimation,
      child: widget.child,
    );
  }
}
 */