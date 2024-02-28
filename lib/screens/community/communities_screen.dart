import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/create_community_bloc/create_community_bloc.dart';
import 'package:education_app/blocs/get_communities_bloc/get_communities_bloc.dart';
import 'package:education_app/blocs/get_communities_bloc/get_communities_event.dart';
import 'package:education_app/blocs/join_community_bloc/join_community_bloc.dart';
import 'package:education_app/blocs/user_bloc/user_bloc.dart';
import 'package:education_app/blocs/user_bloc/user_event.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_community_repository.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_community_users_repository.dart';
import 'package:education_app/screens/community/create_community_screen.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:education_app/widgets/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_bloc/user_state.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return CustomActionButton(
                    function: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider(
                                      create: (context) => GetCommunitiesBloc(
                                          repository:
                                              FirebaseCommunityRepository())
                                        ..add(GetAllCommunitiesByName()),
                                    ),
                                    BlocProvider(
                                      create: (context) => CreateCommunityBloc(
                                          repository:
                                              FirebaseCommunityRepository()),
                                    ),
                                    BlocProvider(
                                      create: (context) => JoinCommunityBloc(
                                        repository:
                                            FirebaseCommunityUsersRepository(),
                                      ),
                                    )
                                  ],
                                  child: CreateCommunityScreen(
                                    user: state.userModel,
                                  ),
                                ))),
                    buttonText: 'Bir topluluk oluştur',
                  );
                }

                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
