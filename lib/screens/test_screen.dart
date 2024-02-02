import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    //Profil
                    SizedBox(
                      height: 200.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10),),
                            color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 50.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Yusufcan Adıgüzel',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  const Text(
                                    'Software Developer',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.person, size: 16.0),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.person, size: 16.0),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.person, size: 16.0),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.person, size: 16.0),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.person, size: 16.0),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    //Hakkımda
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0),),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hakkımda', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),),
                            Text('asdhsjfdnjjfjfdjnfnlfnlfjnfjlnffjnfnlf'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    //Kurslarım
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0),),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kurslarım', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      ),
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
