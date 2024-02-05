import 'package:education_app/widgets/form_input_field.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AspectRatio(
              aspectRatio: 9 / 16,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0),),
                  color: Colors.white
                ),
                child: Form(
                  key: _formKey,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KFormInput(iconData: Icons.email, labelText: 'email'),
                        KFormInput(iconData: Icons.person, labelText: 'Ad'),
                        KFormInput(iconData: Icons.person, labelText: 'Soyad'),
                        KFormInput(iconData: Icons.email, labelText: 'Başlık'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
