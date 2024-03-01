import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/get_community_by_id_bloc/get_community_by_id_bloc.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_post_repository.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_user_repository.dart';
import 'package:education_app/screens/post/community_post_screen.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:education_app/widgets/post/post_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/get_community_by_id_bloc/get_community_by_id_state.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import '../../blocs/post/create_post_bloc/create_post_bloc.dart';

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
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<GetCommunityByIdBloc, GetCommunityByIdState>(
                builder: (context, state) {
                  if (state is GetCommunityByIdSuccess) {
                    return Column(
                      children: [
                        //Topluluk Bilgileri
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
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

                                //Ad ve Soyad
                                Text(
                                  state.community.name,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                //Ünvan
                                Text(
                                  state.community.description,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        CustomActionButton(
                          function: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => CreatePostBloc(
                                    repository: FirebasePostRepository()),
                                child: CommunityPostScreen(
                                  userId: context
                                      .read<AuthenticationBloc>()
                                      .state
                                      .user!
                                      .uid,
                                  communityId: state.community.id,
                                ),
                              ),
                            ),
                          ),
                          buttonText: 'Bir Şeyler Paylaş',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocProvider(
                          create: (context) => GetUserByIdBloc(
                            repository: FirebaseUserRepository(),
                          ),
                          child: const PostStream(),
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
