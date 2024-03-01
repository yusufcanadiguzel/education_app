import 'dart:developer';

import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/create_community_bloc/create_community_event.dart';
import 'package:education_app/blocs/get_all_communities_bloc/get_all_communities_bloc.dart';
import 'package:education_app/blocs/get_all_communities_bloc/get_all_communities_state.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import 'package:education_app/blocs/join_community_bloc/join_community_bloc.dart';
import 'package:education_app/blocs/join_community_bloc/join_community_event.dart';
import 'package:education_app/models/community/community.dart';
import 'package:education_app/models/communityUser/communityUser.dart';
import 'package:education_app/models/user/user_model.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_community_repository.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_user_repository.dart';
import 'package:education_app/screens/community/community_screen.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:education_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/create_community_bloc/create_community_bloc.dart';
import '../../blocs/get_community_by_id_bloc/get_community_by_id_bloc.dart';
import '../../blocs/get_community_by_id_bloc/get_community_by_id_event.dart';

class CreateCommunityScreen extends StatefulWidget {
  const CreateCommunityScreen({required this.user, super.key});

  final UserModel user;

  @override
  State<CreateCommunityScreen> createState() => _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends State<CreateCommunityScreen> {
  late Community community;
  late CommunityUser communityUser;

  final _formKey = GlobalKey<FormState>();
  final _communityNameController = TextEditingController();

  String searchText = '';
  bool isEnabled = false;
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bir topluluk oluştur',
          style: TextStyles.kHeaderTextStyle,
        ),
      ),
      body: BlocBuilder<GetAllCommunitiesBloc, GetAllCommunitiesState>(
        builder: (context, state) {
          if (state is GetAllCommunitiesSuccess) {
            return Container(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _communityNameController,
                          hintText: 'Topluluk ismi',
                          iconData: FontAwesomeIcons.peopleRoof,
                          onChanged: (value) {
                            setState(() {
                              searchText = value;

                              for (var element in state.communities) {
                                if (element.name == searchText) {
                                  isAvailable = false;
                                }
                              }
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen alanı doldurunuz.';
                            }

                            if (isAvailable == false) {
                              return 'Bu isim kullanılmaktadır.';
                            }

                            if (value.length < 3 || value.length > 21) {
                              return 'Lütfen 3 ile 21 karakter arasında bir isim giriniz.';
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomActionButton(
                    function: () {
                      if (isAvailable) {
                        if (_formKey.currentState!.validate()) {
                          community = Community.empty;
                          community.name = _communityNameController.text;
                          community.creator = widget.user;
                        }

                        context.read<CreateCommunityBloc>().add(
                              CreateCommunity(community: community),
                            );

                        communityUser = CommunityUser.empty;
                        communityUser.communityId = community.id;
                        communityUser.userId = widget.user.id;

                        context.read<JoinCommunityBloc>().add(
                              JoinCommunity(communityUser: communityUser),
                            );

                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) => GetCommunityByIdBloc(
                                    repository: FirebaseCommunityRepository(),
                                  )..add(
                                      GetCommunityById(
                                        id: community.id,
                                      ),
                                    ),
                                ),
                                BlocProvider(
                                  create: (context) => GetUserByIdBloc(
                                      repository: FirebaseUserRepository())
                                    ..add(
                                      GetUserById(
                                        id: context
                                            .read<AuthenticationBloc>()
                                            .state
                                            .user!
                                            .uid,
                                      ),
                                    ),
                                )
                              ],
                              child: const CommunityScreen(),
                            ),
                          ),
                        );
                      }
                    },
                    buttonText: 'Topluluğu Oluştur',
                  ),
                ],
              ),
            );
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
