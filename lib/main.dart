import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: RoutingDemo(),
    ),
  );
}

class RoutingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                CustomRoute(
                  builder: (BuildContext context) {
                    return PageTwo();
                  },
                ),
              );
            },
            title: Text('Surprise?'),
            subtitle: Text(':)'),
          ),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          EdgeInsets.symmetric(vertical: 30.0, horizontal: 24.0),
      curve: Curves.ease,
      duration: const Duration(milliseconds: 100),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            24.0,
          ),
        ),
        color: Colors.blueAccent,
        child: Center(
            child: Image.asset(
          'assets/batman.png',
          height: 100.0,
        )),
      ),
    );
  }
}

class CustomRoute extends PopupRoute {
  CustomRoute({
    @required this.builder,
    this.dismissible = true,
    this.label,
    this.color,
    RouteSettings setting,
  }) : super(settings: setting);

  final WidgetBuilder builder;
  final bool dismissible;
  final String label;
  final Color color;

  @override
  Color get barrierColor => color;

  @override
  bool get barrierDismissible => dismissible;

  @override
  String get barrierLabel => label;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return RotationTransition(
      turns: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);
}
