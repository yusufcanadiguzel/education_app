import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/get_all_communities_bloc/get_all_communities_bloc.dart';
import 'package:education_app/blocs/get_all_communities_bloc/get_all_communities_state.dart';
import 'package:education_app/blocs/get_community_by_id_bloc/get_community_by_id_bloc.dart';
import 'package:education_app/blocs/get_community_by_id_bloc/get_community_by_id_event.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import 'package:education_app/blocs/get_users_by_name_bloc/get_users_by_name_event.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_community_repository.dart';
import 'package:education_app/screens/community/community_screen.dart';
import 'package:education_app/widgets/user/custom_container_get_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../blocs/get_all_communities_bloc/get_all_communities_event.dart';
import '../blocs/get_users_by_name_bloc/get_users_by_name_bloc.dart';

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
              context
                  .read<GetUsersByNameBloc>()
                  .add(GetUsersByName(name: searchText));
              context.read<GetAllCommunitiesBloc>().add(GetAllCommunities());
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
                    BlocProvider(
                      create: (context) => GetUserByIdBloc(repository: context.read<AuthenticationBloc>().userRepository),
                      child: const CustomContainerGetUsers(),
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),

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
                          BlocBuilder<GetAllCommunitiesBloc, GetAllCommunitiesState>(
                            builder: (context, state) {
                              if (state is GetAllCommunitiesSuccess) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.communities.length,
                                  itemBuilder: (context, index) {
                                    if (state.communities[index].name
                                            .toLowerCase()
                                            .contains(
                                                searchText.toLowerCase()) &&
                                        searchText.isNotEmpty) {
                                      return ListTile(
                                        leading: const CircleAvatar(
                                          child: Text('C'),
                                        ),
                                        title:
                                            Text(state.communities[index].name),
                                        onTap: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => BlocProvider(
                                            create: (context) => GetCommunityByIdBloc(
                                                repository:
                                                    FirebaseCommunityRepository())
                                              ..add(
                                                GetCommunityById(
                                                    id: state
                                                        .communities[index].id),
                                              ),
                                            child: const CommunityScreen(),
                                          ),
                                        )),
                                      );
                                    }

                                    return const Center();
                                  }

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
