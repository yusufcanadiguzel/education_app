import 'package:flutter/material.dart';
import 'package:education_app/screens/reviews_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  child: Image.asset('assets/images/tobeto-logo.png'),
                ),
              ),
            ],
          ),
          ListTile(
            title: const Text('Anasayfa'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Değerlendirmeler'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewsScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Profilim'),
            onTap: () {
              // Profilim'e tıklandığında yapılacak işlemler
            },
          ),
          ListTile(
            title: const Text('Katalog'),
            onTap: () {
              // Katalog'a tıklandığında yapılacak işlemler
            },
          ),
          ListTile(
            title: const Text('Takvim'),
            onTap: () {
              // Takvim'e tıklandığında yapılacak işlemler
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Tobeto'),
            leading: const Icon(Icons.home),
            onTap: () {
              // Tobeto'ya tıklandığında yapılacak işlemler
            },
          ),
          Card(
            child: ListTile(
              title: const Text('Username'),
              trailing: const Icon(Icons.person),
              onTap: () {
                // Username'e tıklandığında yapılacak işlemler
              },
            ),
          ),
          const ListTile(
            title: Text('\u00a9 2023 Tobeto'),
          ),
        ],
      ),
    );
  }
}
