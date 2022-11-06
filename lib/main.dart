import 'package:ayopay_assessment/presentation/app.dart';
import 'package:flutter/material.dart';
import 'app/util/dependency.dart';

void main() {
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}