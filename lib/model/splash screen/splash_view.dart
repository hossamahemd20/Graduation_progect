import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/page_route_names.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState()
  {
    super.initState();
    Timer(const Duration(seconds: 6),()
    {
      Navigator.pushReplacementNamed(context, PageRouteNames.Login);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: const BoxDecoration(
      color: Color(0xFF8292BB),
      image: DecorationImage(
          image: AssetImage("assets/images/smart-genius-high-resolution-logo-transparent (3) 1.png"),
        fit: BoxFit.contain

      ),

    ),
    );
  }
}
