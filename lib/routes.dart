import 'package:filme_flix_bruno.rodrigues/pages/home_page.dart';
import 'package:filme_flix_bruno.rodrigues/pages/initial_page.dart';
import 'package:filme_flix_bruno.rodrigues/pages/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/login',
  // redirect: (context, state) {
  //   return '/login';
  // },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LandingPage();
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        int? index;
        if (state.extra is int) {
          index = state.extra as int;
        }
        return HomePage(index: index ?? 0, child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const InitialPage(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => Container(color: Colors.green),
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => Container(color: Colors.amber),
        ),
        GoRoute(
          path: '/config',
          builder: (context, state) => Container(color: Colors.red),
        ),
      ],
    ),
  ],
);
