import 'package:flutter/material.dart';

String loreIpsum =
    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''';

class ExerciseTwoPage extends StatefulWidget {
  const ExerciseTwoPage({Key? key}) : super(key: key);

  @override
  _ExerciseTwoPageState createState() => _ExerciseTwoPageState();
}

class _ExerciseTwoPageState extends State<ExerciseTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3 - Exercise Two'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GenericControlledAnimationExpansionTileWidget(
              title: 'My expansion tile 0',
              subtitle: 'Subtitle Trailing expansion arrow icon',
              children: <Widget>[
                FlutterLogo(),
                Text(
                  loreIpsum,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            GenericControlledAnimationExpansionTileWidget(
              title: 'My expansion tile 1',
              subtitle: 'Subtitle Trailing expansion arrow icon',
              children: <Widget>[
                FlutterLogo(),
                Text(
                  loreIpsum,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GenericControlledAnimationExpansionTileWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;

  const GenericControlledAnimationExpansionTileWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.children,
  }) : super(key: key);

  @override
  _GenericControlledAnimationExpansionTileWidgetState createState() =>
      _GenericControlledAnimationExpansionTileWidgetState();
}

class _GenericControlledAnimationExpansionTileWidgetState
    extends State<GenericControlledAnimationExpansionTileWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  late Animation<double?> angleAnimation;
  late Animation<double?> heightFactorAnimation;

  void toggle() {
    if (controller.value == 0) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  Duration duration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);

    colorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.blue,
    ).animate(controller);

    angleAnimation = Tween<double>(
      begin: 0,
      end: 3,
    ).animate(controller);

    heightFactorAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => toggle(),
          child: Column(
            children: [
              _buildListTile(
                widget.title,
                widget.subtitle,
                colorAnimation.value!,
                angleAnimation.value!,
              ),
              _buildChildren(heightFactorAnimation.value!, widget.children),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildListTile(title, subtitle, colorAnimation, angleAnimation) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(
        color: colorAnimation,
      ),
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(
        color: colorAnimation,
      ),
    ),
    trailing: _buildTrailing(angleAnimation, colorAnimation),
  );
}

Widget _buildTrailing(angleAnimation, colorAnimation) {
  return Transform.rotate(
    angle: angleAnimation,
    child: Icon(
      Icons.keyboard_arrow_down,
      color: colorAnimation,
    ),
  );
}

Widget _buildChildren(heightFactorAnimation, children) {
  return ClipRect(
    child: Align(
      alignment: Alignment.center,
      heightFactor: heightFactorAnimation,
      child: Column(
        children: children,
      ),
    ),
  );
}
