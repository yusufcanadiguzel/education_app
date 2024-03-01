import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_state.dart';
import 'package:education_app/blocs/message/get_message_stream_bloc/get_message_stream_event.dart';
import 'package:education_app/constants/decorations/container_decorations.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_message_repository.dart';
import 'package:education_app/screens/message/user_message_screen.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:education_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import '../../blocs/message/get_message_stream_bloc/get_message_stream_bloc.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
          builder: (context, state) {
            if (state is GetUserByIdSuccess) {
              return Column(
                children: [
                  //Kullanıcı Bilgileri
                  Container(
                    decoration: ContainerDecorations.listContainerDecoration,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 50.0,
                                backgroundImage: state.user.profilePictureUrl ==
                                        ''
                                    ? const NetworkImage(
                                        'https://w7.pngwing.com/pngs/177/551/png-transparent-user-interface-design-computer-icons-default-stephen-salazar-graphy-user-interface-design-computer-wallpaper-sphere-thumbnail.png')
                                    : NetworkImage(
                                        state.user.profilePictureUrl!),
                              ),
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
                            style: TextStyles.kListTileDescriptionTextStyle,
                          ),

                          //Mesaj Butonu
                          CustomActionButton(
                            function: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MultiBlocProvider(
                                providers: [
                                  BlocProvider(
                                    create: (context) => GetUserByIdBloc(
                                        repository: context
                                            .read<AuthenticationBloc>()
                                            .userRepository)
                                      ..add(
                                        GetUserById(
                                          id: state.user.id,
                                        ),
                                      ),
                                  ),
                                  BlocProvider(
                                    create: (context) => GetMessageStreamBloc(
                                     repository: FirebaseMessageRepository(),
                                    )..add(
                                        GetMessageStream(),
                                      ),
                                  )
                                ],
                                child: const UserMessageScreen(),
                              ),
                            )),
                            buttonText: 'Mesaj Gönder',
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10.0),

                  Container(
                    decoration: ContainerDecorations.listContainerDecoration,
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hakkında',
                            style: TextStyles.kHeaderTextStyle,
                          ),
                          SizedBox(
                            height: 10,
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
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    width: double.infinity,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Kurslarım',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
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

            return const Text('unknown state');
          },
        ),
      ),
    );
  }
}
