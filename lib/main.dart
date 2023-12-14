import 'package:education_app/widgets/drawer_menu_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );

  }}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: const SideMenu(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://pixelplex.io/wp-content/uploads/2023/01/metaverse-in-education-main-1600.jpg'),
           fit: BoxFit.cover)
        ),
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 420.0,
                child: Card(
                  color: Colors.white.withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0),),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: NetworkImage('https://tobeto.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Ftobeto-logo.409772fc.png&w=256&q=75'),
                          height: 30.0
                        ),
                        SizedBox(height: 40.0,),
                        SizedBox(
                          width: 300.0,
                          height: 50.0,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'Kullanıcı Kodu',
                              contentPadding: EdgeInsets.all(20.0)
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        SizedBox(
                          width: 300.0,
                          height: 50.0,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              hintText: 'Parola',
                              suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off))
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(
                          width: 300.0,
                          child: ElevatedButton(
                              onPressed: (){},
                              child: Text('GİRİŞ YAP'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff9B33FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                )
                            ),
                          ),
                        ),
                        Divider(
                            thickness: 1.0,
                        ),
                        TextButton(onPressed: (){}, child: Text('Parolamı Unuttum'), )
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