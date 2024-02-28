import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/get_communities_bloc/get_communities_bloc.dart';
import 'package:education_app/blocs/get_communities_bloc/get_communities_event.dart';
import 'package:education_app/blocs/get_communities_bloc/get_communities_state.dart';
import 'package:education_app/blocs/get_community_bloc/get_community_bloc.dart';
import 'package:education_app/blocs/get_community_bloc/get_community_event.dart';
import 'package:education_app/blocs/get_user_bloc/get_user_event.dart';
import 'package:education_app/blocs/get_users_bloc/get_users_event.dart';
import 'package:education_app/blocs/get_users_bloc/get_users_state.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_community_repository.dart';
import 'package:education_app/screens/community/community_screen.dart';
import 'package:education_app/screens/user/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../blocs/get_user_bloc/get_user_bloc.dart';
import '../blocs/get_users_bloc/get_users_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String searchText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40.0,
          child: TextField(
            onChanged: (value) => setState(() {
              searchText = value;
              context.read<GetUsersBloc>().add(GetUsersByName());
              context.read<GetCommunitiesBloc>().add(GetAllCommunitiesByName());
            }),
            decoration: InputDecoration(
              hintText: 'Arama Yapın',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: const EdgeInsets.all(8.0),
              filled: true,
              fillColor: Theme.of(context).secondaryHeaderColor,
              prefix: const Icon(FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [

                    //Kişiler
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Kişiler',
                                ),
                              ],
                            ),
                          ),
                          BlocBuilder<GetUsersBloc, GetUsersState>(
                            builder: (context, state) {
                              if (state is GetUsersSuccess) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.users.length,
                                  itemBuilder: (context, index) {
                                    if (state.users[index].fullName!
                                            .toLowerCase()
                                            .contains(searchText.toLowerCase()) &&
                                        searchText.isNotEmpty) {
                                      return ListTile(
                                        leading: state.users[index]
                                                .profilePictureUrl!.isEmpty
                                            ? CircleAvatar(
                                                child: Text(
                                                    '${state.users[index].firstName[0]}${state.users[index].lastName[0]}'),
                                              )
                                            : CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    state.users[index]
                                                        .profilePictureUrl!),
                                              ),
                                        title: Text(state.users[index].fullName!),
                                        subtitle: Text(state.users[index].title!),
                                        dense: true,
                                        tileColor: Colors.white,
                                        onTap: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => BlocProvider(
                                            create: (context) => GetUserBloc(
                                                repository: context
                                                    .read<AuthenticationBloc>()
                                                    .userRepository)
                                              ..add(
                                                GetUser(
                                                    userId:
                                                        state.users[index].id),
                                              ),
                                            child: const UserDetailsScreen(),
                                          ),
                                        )),
                                      );
                                    }
                                  },
                                );
                              }
          
                              return const Text('sonuç yok');
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10.0,),

                    //Topluluklar
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Topluluklar'),
                              ],
                            ),
                          ),
                          BlocBuilder<GetCommunitiesBloc, GetCommunitiesState>(
                            builder: (context, state) {
                              if (state is GetCommunitiesSuccess) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.communities.length,
                                  itemBuilder: (context, index) {
                                    if(state.communities[index].name.toLowerCase().contains(searchText.toLowerCase()) && searchText.isNotEmpty){
                                      return ListTile(
                                        leading: const CircleAvatar(
                                          child: Text('C'),
                                        ),
                                        title: Text(state.communities[index].name),
                                        onTap: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => BlocProvider(
                                            create: (context) => GetCommunityBloc(
                                                repository:
                                                FirebaseCommunityRepository())
                                              ..add(
                                                GetCommunity(
                                                    communityId: state
                                                        .communities[index].id),
                                              ),
                                            child: const CommunityScreen(),
                                          ),
                                        )),
                                      );
                                    }
                                  },
                                );
                              }
          
                              return const Text('unknown state');
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
