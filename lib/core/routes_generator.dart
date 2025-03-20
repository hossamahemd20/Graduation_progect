import 'package:flutter/material.dart';
import 'package:graduation_project/core/page_route_names.dart';
import 'package:graduation_project/model/forget%20password/forget%20password.dart';
import 'package:graduation_project/model/login%20view/login%20view.dart';
import 'package:graduation_project/model/splash%20screen/splash_view.dart';

import '../model/home/home_view.dart';
import '../model/registration/regisration view.dart';

class RouteGenerator{
  static Route<dynamic> onGeneratorRoute (RouteSettings settings)
 {
switch(settings.name)
    {
  case PageRouteNames.initial:
    return MaterialPageRoute(builder: (context)=>SplashView(),settings:settings);
  case PageRouteNames.Login:
    return MaterialPageRoute(builder: (context)=>LoginView(),settings:settings);
  case PageRouteNames.regisration:
    return MaterialPageRoute(builder: (context)=>RegistrationView(),settings:settings);
  case PageRouteNames.forgetpassword:
    return MaterialPageRoute(builder: (context)=>ForgetPassword(),settings: settings);
      case PageRouteNames.home_view:
        return MaterialPageRoute(
            builder: (context) => HomeScreen(), settings: settings);
      default:
    return MaterialPageRoute(builder: (context)=>SplashView());

    }
 }
}