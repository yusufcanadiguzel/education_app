import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/get_community_by_id_bloc/get_community_by_id_bloc.dart';
import 'package:education_app/blocs/post/get_all_posts_bloc/get_all_posts_event.dart';
import 'package:education_app/blocs/post/get_post_stream_bloc/get_post_stream_bloc.dart';
import 'package:education_app/blocs/post/get_post_stream_bloc/get_post_stream_event.dart';
import 'package:education_app/constants/decorations/container_decorations.dart';
import 'package:education_app/models/user/user_model.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_post_repository.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_user_repository.dart';
import 'package:education_app/screens/post/community_post_screen.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:education_app/widgets/main/app_bar_search_bar.dart';
import 'package:education_app/widgets/post/post_container.dart';
import 'package:education_app/widgets/post/post_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/get_community_by_id_bloc/get_community_by_id_state.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_state.dart';
import '../../blocs/post/create_post_bloc/create_post_bloc.dart';
import '../../blocs/post/get_all_posts_bloc/get_all_posts_bloc.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarSearchBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<GetCommunityByIdBloc, GetCommunityByIdState>(
                builder: (context, state) {
                  if (state is GetCommunityByIdSuccess) {
                    String communityId = state.community.id;
                    return Column(
                      children: [
                        //Topluluk Bilgileri
                        Container(
                          decoration:
                              ContainerDecorations.listContainerDecoration,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 50.0,
                                      child: Text(
                                        state.community.name[0],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  state.community.name,
                                  style: TextStyles.kListTileHeaderTextStyle,
                                ),
                                Text(
                                  state.community.description,
                                  style:
                                      TextStyles.kListTileDescriptionTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
                          builder: (context, state) {
                            if(state is GetUserByIdSuccess){
                              return CustomActionButton(
                                function: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => CreatePostBloc(
                                          repository: FirebasePostRepository()),
                                      child: CommunityPostScreen(
                                        user: state.user,
                                        communityId: communityId,
                                      ),
                                    ),
                                  ),
                                ),
                                buttonText: 'Bir Şeyler Paylaş',
                              );
                            }

                            return Container();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocProvider(
                          create: (context) => GetAllPostsBloc(
                              repository: FirebasePostRepository())
                            ..add(
                              GetAllPosts(),
                            ),
                          child: PostContainer(communityId: state.community.id),
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
