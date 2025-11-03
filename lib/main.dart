import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:wichteln/pages/home.dart';

/*
Colors
FF386641
FF6A994E
FFA7C957
FFF2E8CF
FFBC4749
*/


void main() {
  setUrlStrategy(PathUrlStrategy());

  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      /*
      GoRoute(
        path: '/groups/:username',
        builder: (context, state) {
          final username = state.pathParameters['username']!;
          return AccountPage(username: username);
        },
      ),
      */
    ],
  );

  runApp(
    MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    ),
  );
}

/*
class AccountPage extends StatelessWidget {
  final String username;
  const AccountPage({required this.username, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Account: $username')),
      body: Center(child: Text('Loading data for $username...')),
    );
  }
}
*/