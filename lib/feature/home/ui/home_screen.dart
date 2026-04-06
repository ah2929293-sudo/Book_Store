import 'package:book_store/feature/home/ui/widgets/home_app_bar.dart';
import 'package:book_store/feature/home/ui/widgets/home_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(children: [HomeAppBar(), HomeSlider()]));
  }
}
