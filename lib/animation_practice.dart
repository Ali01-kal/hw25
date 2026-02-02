import 'package:flutter/material.dart';

class AnimationPracticePage extends StatefulWidget {
  const AnimationPracticePage({super.key});

  @override
  State<AnimationPracticePage> createState() => _AnimationPracticePageState();
}

class _AnimationPracticePageState extends State<AnimationPracticePage>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scale;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    scale = Tween(begin: 0.7, end: 1.2).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    offset = Tween(
      begin: const Offset(0, 0),
      end: const Offset(0, -100),
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation Practice")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: controller,
            child: const FlutterLogo(size: 100),
            builder: (context, child) {
              return Transform.translate(
                offset: offset.value,
                child: Transform.scale(
                  scale: scale.value,
                  child: child,
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: controller.forward,
                child: const Text("Start"),
              ),
              ElevatedButton(
                onPressed: controller.stop,
                child: const Text("Stop"),
              ),
              ElevatedButton(
                onPressed: controller.reverse,
                child: const Text("Reverse"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
