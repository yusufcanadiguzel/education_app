import 'package:education_app/blocs/get_users_bloc/get_users_event.dart';
import 'package:education_app/blocs/get_users_bloc/get_users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../blocs/get_users_bloc/get_users_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40.0,
          child: TextField(
            onChanged: (value) => setState(() {
              searchText = value;
              context.read<GetUsersBloc>().add(
                    GetUsersByName(name: searchText),
                  );
            }),
            decoration: InputDecoration(
              hintText: 'Arama Yapın',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: const EdgeInsets.all(8.0),
              filled: true,
              fillColor: Colors.blueGrey,
              prefix: const Icon(FontAwesomeIcons.magnifyingGlass),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<GetUsersBloc, GetUsersState>(
            builder: (context, state) {
              if (state is GetUsersSuccess) {
                return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.users[index].firstName),
                    );
                  },
                );
              }

              return const Text('sonuç yok');
            },
          ),
        ),
      ),
    );
  }
}
