import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  const CircleButton({super.key, this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          side: const BorderSide(width: 2, color: Colors.white)),
      onPressed: onTap ?? () {},
      child: child ?? const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 35),
    );
  }
}
