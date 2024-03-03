import 'package:education_app/constants/decorations/container_decorations.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_user_repository.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/user/user_about_me_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_state.dart';
import '../../blocs/update_user_info_bloc/update_user_info_bloc.dart';
import '../../blocs/update_user_info_bloc/update_user_info_state.dart';
import '../../blocs/user/update_user_picture_bloc/update_user_picture_bloc.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/user/user_details_dialog.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  const ProfileScreen({required this.userId, super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserInfoBloc, UpdateUserInfoState>(
      listener: (context, state) {
        if (state is UpdateUserInfoSuccess) {}
      },
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
                  builder: (context, state) {
                    if (state is GetUserByIdSuccess) {
                      return Column(
                        children: [
                          //Kullanıcı Bilgileri
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
                                        backgroundImage: state
                                                    .user.profilePictureUrl ==
                                                ''
                                            ? NetworkImage(
                                               MagicStrings.defaultProfilePictureUrl )
                                            : NetworkImage(
                                                state.user.profilePictureUrl!),
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    MultiBlocProvider(
                                                  providers: [
                                                    BlocProvider(
                                                      create: (context) =>
                                                          GetUserByIdBloc(
                                                              repository: context
                                                                  .read<
                                                                      AuthenticationBloc>()
                                                                  .userRepository)
                                                            ..add(
                                                              GetUserById(
                                                                id: context
                                                                    .read<
                                                                        AuthenticationBloc>()
                                                                    .state
                                                                    .user!
                                                                    .uid,
                                                              ),
                                                            ),
                                                    ),
                                                    BlocProvider(
                                                      create: (context) =>
                                                          UpdateUserInfoBloc(
                                                              repository: context
                                                                  .read<
                                                                      AuthenticationBloc>()
                                                                  .userRepository),
                                                    ),
                                                  ],
                                                  child:
                                                      const UserDetailsDialog(),
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              FontAwesomeIcons.pen,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 50, width: 50),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),

                                  //Ad ve Soyad
                                  Text(
                                    state.user.fullName!,
                                    style: TextStyles.kHeaderTextStyle,
                                  ),

                                  //Ünvan
                                  Text(
                                    '${state.user.title}',
                                    style: TextStyles
                                        .kListTileDescriptionTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 10.0),

                          Container(
                            decoration:
                                ContainerDecorations.listContainerDecoration,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        MagicStrings.aboutIt,
                                        style: TextStyles.kHeaderTextStyle,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                MultiBlocProvider(
                                              providers: [
                                                BlocProvider(
                                                  create: (context) =>
                                                      GetUserByIdBloc(
                                                          repository: context
                                                              .read<
                                                                  AuthenticationBloc>()
                                                              .userRepository)
                                                        ..add(
                                                          GetUserById(
                                                            id: context
                                                                .read<
                                                                    AuthenticationBloc>()
                                                                .state
                                                                .user!
                                                                .uid,
                                                          ),
                                                        ),
                                                ),
                                                BlocProvider(
                                                  create: (context) =>
                                                      UpdateUserInfoBloc(
                                                          repository: context
                                                              .read<
                                                                  AuthenticationBloc>()
                                                              .userRepository),
                                                ),
                                                BlocProvider(
                                                  create: (context) =>
                                                      UpdateUserPictureBloc(
                                                    repository:
                                                        FirebaseUserRepository(),
                                                  ),
                                                )
                                              ],
                                              child: const UserAboutMeDialog(),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          FontAwesomeIcons.pen,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    state.user.aboutMe == null
                                        ? ''
                                        : state.user.aboutMe!,
                                    style: TextStyles.kNormalTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10.0,
                          ),

                          //Kurslar
                          Container(
                            decoration: ContainerDecorations.listContainerDecoration,
                            width: double.infinity,
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    MagicStrings.myCourses,
                                    style: TextStyles.kHeaderTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          width: 100,
                                          color: Colors.red,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 100,
                                          color: Colors.blue,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 100,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 100,
                                          color: Colors.yellow,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
