import 'package:flutter/material.dart';

class ExerciseOnePage extends StatefulWidget {
  const ExerciseOnePage({Key? key}) : super(key: key);

  @override
  _ExerciseOnePageState createState() => _ExerciseOnePageState();
}

class _ExerciseOnePageState extends State<ExerciseOnePage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Size?> sizeAnimation;
  late Animation<Decoration?> decorationAnimation;
  late Animation<Alignment?> alignmentAnimation;

  void toggle() {
    if (controller.value == 0) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  Duration duration = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);

    alignmentAnimation = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.topCenter,
    ).animate(controller);

    sizeAnimation = SizeTween(
      begin: Size(50, 50),
      end: Size(100, 50),
    ).animate(controller);

    decorationAnimation = DecorationTween(
      begin: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(99),
      ),
      end: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(0),
      ),
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2 - Exercise One'),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            padding: EdgeInsets.all(20),
            alignment: alignmentAnimation.value,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return GestureDetector(
                  onTap: () => toggle(),
                  child: Container(
                    width: sizeAnimation.value?.width,
                    height: sizeAnimation.value?.height,
                    decoration: decorationAnimation.value,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
