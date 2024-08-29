import 'package:flutter/material.dart';
import 'package:pulpo_line/app/app.dart';
import 'package:pulpo_line/inject_dependencies.dart';

void main() async {
  await injectDependencies();
  runApp(const App());
}
