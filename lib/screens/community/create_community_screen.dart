import 'dart:developer';

import 'package:education_app/blocs/create_community_bloc/create_community_event.dart';
import 'package:education_app/blocs/get_communities_bloc/get_communities_bloc.dart';
import 'package:education_app/blocs/join_community_bloc/join_community_bloc.dart';
import 'package:education_app/blocs/join_community_bloc/join_community_event.dart';
import 'package:education_app/models/community/community.dart';
import 'package:education_app/models/communityUser/communityUser.dart';
import 'package:education_app/models/user/user_model.dart';
import 'package:education_app/screens/community/community_screen.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:education_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/create_community_bloc/create_community_bloc.dart';
import '../../blocs/get_communities_bloc/get_communities_state.dart';

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
        title: const Text('Bir topluluk oluştur'),
      ),
      body: BlocBuilder<GetCommunitiesBloc, GetCommunitiesState>(
        builder: (context, state) {
          if (state is GetCommunitiesSuccess) {
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
                                if(element.name == searchText){
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
                      log(isAvailable.toString());



                      log(isAvailable.toString());

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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CommunityScreen(),),);
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