import 'package:education_app/blocs/get_all_communities_bloc/get_all_communities_bloc.dart';
import 'package:education_app/blocs/get_all_communities_bloc/get_all_communities_event.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_community_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_state.dart';
import '../../blocs/update_user_info_bloc/update_user_info_bloc.dart';
import '../../screens/community/communities_screen.dart';
import '../../screens/user/profile_screen.dart';
import '../user/custom_user_circle_avatar.dart';

class CustomUserDrawer extends StatelessWidget {
  const CustomUserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
                builder: (context, state) {
                  if (state is GetUserByIdSuccess) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 6,
                      color: Colors.blueGrey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomUserPictureCircle(radius: 40.0),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('${state.user.fullName}'),
                        ],
                      ),
                    );
                  }

                  return const CircularProgressIndicator();
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.solidUser),
                title: const Text('Profil'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => GetUserByIdBloc(
                            repository: context
                                .read<AuthenticationBloc>()
                                .userRepository,
                          )..add(
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
                            repository: context
                                .read<AuthenticationBloc>()
                                .userRepository,
                          ),
                        ),
                      ],
                      child: ProfileScreen(
                        userId:
                            context.read<AuthenticationBloc>().state.user!.uid,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.peopleRoof),
                title: const Text('Topluluklar'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => GetUserByIdBloc(
                              repository: context
                                  .read<AuthenticationBloc>()
                                  .userRepository)
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
                          create: (context) => GetAllCommunitiesBloc(
                            repository: FirebaseCommunityRepository(),
                          )..add(
                              GetAllCommunities(),
                            ),
                        )
                      ],
                      child: const CommunitiesScreen(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
