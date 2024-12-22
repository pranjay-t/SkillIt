import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:skill_it/Features/Learning/learning_screen.dart';
import 'package:skill_it/Features/Professional/professional_screen.dart';
import 'package:skill_it/Features/Home/Screens/home_screen.dart';


final loggedInRoute = RouteMap(routes: {

  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/professional': (_) => const MaterialPage(child: ProfessionalScreen()),
  '/learning': (_) => const MaterialPage(child: LearningScreen()),

});
