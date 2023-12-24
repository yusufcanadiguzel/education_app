import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/drawer_menu_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF4D4D4D)),
        elevation: 0,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1), child: Divider()),
        backgroundColor: Colors.transparent,
        toolbarHeight: 90.0,
        title: Image.asset('assets/images/tobeto-logo.png', height: 40.0),
      ),
      endDrawer: const SideMenu(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 75.0,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: 'TOBETO',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9B33FF),
                          fontSize: 26.4),
                      children: [
                        TextSpan(
                            text: '\'ya hoş geldin',
                            style: TextStyle(
                                color: Color(0xFF4D4D4D), fontSize: 26.4)),
                        TextSpan(
                          text: '\nUsername',
                          style: TextStyle(
                              color: Color(0xFF4D4D4D), fontSize: 26.4),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  'Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
                const Button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
