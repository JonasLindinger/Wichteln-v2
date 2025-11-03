import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2E8CF),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Willkommen!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 40),
              RedBigButton("Gruppe erstellen", context, openCreateGroupPage),
              SizedBox(height: 20),
              RedBigButton("Gruppe ansehen", context, openViewGroupPage),
            ],
          ),
        ),
      ),
    );
  }

  void openCreateGroupPage(BuildContext context) {
    GoRouter.of(context).go("/create");
  }

  void openViewGroupPage(BuildContext context) {
    GoRouter.of(context).go("/group");
  }

  Widget RedBigButton(String name, BuildContext context, void Function(BuildContext context) onClick) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFBC4749),
          foregroundColor: Color(0xFFF2E8CF),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        onPressed: () {
          onClick(context);
        },
        child: Text(name),
      ),
    );
  }
}
