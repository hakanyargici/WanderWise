import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/boarding_screen.dart';
import '../screens/home_screen.dart';
import '../screens/reservation_screen.dart';
import '../screens/search_screen.dart';
import '../screens/trip_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const LoadingScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/reservation',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const ReservationScreen(),
      ),
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SearchScreen(),
      ),
    ),
    GoRoute(
      path: '/trip',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const TripScreen(),
      ),
    ),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const ProfileScreen(),
      ),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const RegisterScreen(),
      ),
    ),
  ],
);
