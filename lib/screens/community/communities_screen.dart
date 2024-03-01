import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/create_community_bloc/create_community_bloc.dart';
import 'package:education_app/blocs/get_all_communities_bloc/get_all_communities_bloc.dart';
import 'package:education_app/blocs/get_all_communities_bloc/get_all_communities_event.dart';
import 'package:education_app/blocs/get_all_communities_bloc/get_all_communities_state.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_state.dart';
import 'package:education_app/blocs/join_community_bloc/join_community_bloc.dart';
import 'package:education_app/constants/decorations/container_decorations.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_community_repository.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_community_users_repository.dart';
import 'package:education_app/screens/community/create_community_screen.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/community/community_list_item.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              //Topluluk Oluştur Butonu
              BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
                builder: (context, state) {
                  if (state is GetUserByIdSuccess) {
                    return CustomActionButton(
                      function: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider(
                                        create: (context) =>
                                            GetAllCommunitiesBloc(
                                                repository:
                                                    FirebaseCommunityRepository())
                                              ..add(GetAllCommunities()),
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
                                      ),
                                    ],
                                    child: CreateCommunityScreen(
                                      user: state.user,
                                    ),
                                  ))),
                      buttonText: 'Bir topluluk oluştur',
                    );
                  }
        
                  return const CircularProgressIndicator();
                },
              ),
        
              const SizedBox(
                height: 10.0,
              ),
        
              //Topluluk Listesi
              Container(
                decoration: ContainerDecorations.listContainerDecoration,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Topluluklarım',
                                style: TextStyles.kHeaderTextStyle,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<GetAllCommunitiesBloc,
                                  GetAllCommunitiesState>(
                                builder: (context, state) {
                                  if (state is GetAllCommunitiesSuccess) {
                                    return ListView.separated(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      shrinkWrap: true,
                                      itemCount: state.communities.length,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        height: 10,
                                      ),
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            CommunityListItem(
                                              community: state.communities[index],
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
        
                                  return Container();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
