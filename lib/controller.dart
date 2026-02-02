import 'package:flutter/material.dart';

class ControllerExample extends StatefulWidget {
  const ControllerExample({super.key});

  @override
  State<ControllerExample> createState() => _ControllerExampleState();
}

class _ControllerExampleState extends State<ControllerExample>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          scale: controller,
          child: const FlutterLogo(size: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.forward,
              child: const Text("Start"),
            ),
            ElevatedButton(
              onPressed: controller.reverse,
              child: const Text("Reverse"),
            ),
          ],
        )
      ],
    );
  }
}
// конспект: Уақытты 0.0 => 1.0 басқаратын қозғалтқыш.