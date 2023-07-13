import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  final VoidCallback? callback;
  const Button({super.key, 
    required this.name,
    this.callback,
    
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: const Text('update'),
    );
  }
}
