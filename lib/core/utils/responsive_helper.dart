import 'package:assesment_app/config/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';

class ResponsiveHelper extends StatelessWidget {
  final Widget mobileWidget, desktopWidget;
  const ResponsiveHelper(
      {super.key, required this.mobileWidget, required this.desktopWidget});

  @override
  Widget build(BuildContext context) {
    return context.isDesktop || context.landScape
        ? desktopWidget
        : mobileWidget;
  }
}
