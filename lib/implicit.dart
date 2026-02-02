import 'package:flutter/material.dart';

class ImplicitExample extends StatefulWidget {
  const ImplicitExample({super.key});

  @override
  State<ImplicitExample> createState() => _ImplicitExampleState();
}

class _ImplicitExampleState extends State<ImplicitExample> {
  bool big = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() => big = !big),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: big ? 150 : 80,
          height: big ? 150 : 80,
          color: Colors.blue,
        ),
      ),
    );
  }
}

//Конспект Flutter өзі анимацияны автоматты түрде жасайды сен тек соңғы мәнді бересің
