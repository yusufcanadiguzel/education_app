import 'package:education_app/widgets/application_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_menu_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ApplicationBar(appBar: AppBar()),
      drawer: const SideMenu(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://pixelplex.io/wp-content/uploads/2023/01/metaverse-in-education-main-1600.jpg'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(
                16.0), //margin kenar boslukları //edgeınsets.all bütün kenarlaran boslukları
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/tobeto-logo.png',
                    fit: BoxFit.cover,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: const Icon(Icons.person),
                          label: const Text(
                            'Kullanıcı Kodu',
                            style: TextStyle(fontFamily: 'Tinos'),
                          ),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      obscureText:
                          !isPasswordVisible, // parolada *yıldız görünümü yapar,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          label: const Text(
                            'Parola',
                            style: TextStyle(fontFamily: 'Tinos'),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible =
                                      !isPasswordVisible; //parolada yıldız görünümünü kapayıp açar
                                });
                              },
                              icon: isPasswordVisible
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff9B33FF),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                      child: const Text(
                        'GİRİŞ YAP',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Tinos',
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1.0,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Parolamı Unuttum',
                      style: TextStyle(fontFamily: 'Tinos'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
