import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

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
                height: 70,
                child: DrawerHeader(child: Image.network('https://tobeto.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Ftobeto-logo.409772fc.png&w=256&q=75'),
                ),
              ),
            ],
          ),
          const ListTile(
            title: Text('Anasayfa'),
          ),
          const ListTile(
            title: Text('Değerlendirmeler'),
          ),
          const ListTile(
            title: Text('Profilim'),
          ),
          const ListTile(
            title: Text('Katalog'),
          ),
          const ListTile(
            title: Text('Takvim'),
          ),
          const Divider(),
          const ListTile(
            title: Text('Tobeto'),
            leading: Icon(Icons.home),
          ),
          const Card(
            child: ListTile(
              title: Text('Username'),
              trailing: Icon(Icons.person),
            ),
          ),
          const ListTile(
            title: Text('\u00a9 2023 Tobeto')
          ),
        ],
      ),
    );
  }
}
