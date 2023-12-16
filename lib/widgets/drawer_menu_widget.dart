import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 90,
                child: DrawerHeader(
                  child: Image.network(
                    'https://images-ext-2.discordapp.net/external/8Pv0gcBN2RdtJLeNyfEnbLCuBUMJaz1-SDaEj7qRFe8/%3Furl%3D%252F_next%252Fstatic%252Fmedia%252Ftobeto-logo.409772fc.png%26w%3D256%26q%3D75/https/tobeto.com/_next/image?format=webp&width=361&height=75',
                  ),
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
          Container(
            child: const Card(
              child: ListTile(
                title: Text('Kullanıcı Adı'),
                leading: Icon(Icons.person_3),
              ),
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
