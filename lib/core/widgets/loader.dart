import 'package:flutter/material.dart' as material;

class Loader extends material.StatelessWidget {
  const Loader({super.key});

  @override
  material.Widget build(material.BuildContext context) {
    return const material.Center(
      child: material.CircularProgressIndicator.adaptive(),
    );
  }
}
