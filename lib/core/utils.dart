import 'package:flutter/material.dart' as material;

void showSnackBar(material.BuildContext context, String content) {
  material.ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(material.SnackBar(content: material.Text(content)));
}
