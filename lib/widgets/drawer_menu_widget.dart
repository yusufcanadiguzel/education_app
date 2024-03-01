import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import 'package:education_app/screens/catalog_screen.dart';
import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:education_app/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:education_app/screens/user/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import '../blocs/sign_in_bloc/sign_in_bloc.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({required this.userId, super.key});

  final String userId;

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
          const ListTile(
            title: Text('Anasayfa'),
          ),
          const ListTile(
            title: Text('Değerlendirmeler'),
          ),
          ListTile(
            title: const Text('Profilim'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => GetUserByIdBloc(
                          repository:
                              context.read<AuthenticationBloc>().userRepository)
                        ..add(
                          GetUserById(
                            id: context
                                .read<AuthenticationBloc>()
                                .state
                                .user!
                                .uid,
                          ),
                        ),
                    ),
                    BlocProvider(
                      create: (context) => UpdateUserInfoBloc(
                        repository:
                            context.read<AuthenticationBloc>().userRepository,
                      ),
                    ),
                  ],
                  child: ProfileScreen(userId: userId),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CatalogScreen(),
                  ));
            },
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
          ListTile(
            title: Text('Çıkış Yap'),
            onTap: () => context.read<SignInBloc>().add(SignOut()),
          ),
          const ListTile(title: Text('\u00a9 2023 Tobeto')),
        ],
      ),
    );
  }
}
