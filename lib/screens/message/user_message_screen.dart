import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/message/message_box.dart';
import 'package:education_app/widgets/user/custom_user_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_state.dart';
import '../../blocs/message/send_message_bloc/send_message_bloc.dart';
import '../../repositories/concrete/firebase/firebase_message_repository.dart';
import '../../widgets/message/message_field.dart';
import '../../widgets/message/message_stream_v2.dart';

class UserMessageScreen extends StatefulWidget {
  const UserMessageScreen({super.key});

  @override
  State<UserMessageScreen> createState() => _UserMessageScreenState();
}

class _UserMessageScreenState extends State<UserMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
      builder: (context, state) {
        if (state is GetUserByIdSuccess) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent,
              title: Row(
                children: [
                  const CustomUserPictureCircle(
                    radius: 20.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    state.user.fullName!,
                    style: TextStyles.kHeaderTextStyle,
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: MessageStreamV2(receiverId: state.user.id),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  BlocProvider(
                    create: (context) => SendMessageBloc(
                        repository: FirebaseMessageRepository()),
                    child: MessageField(
                      senderId:
                          context.read<AuthenticationBloc>().state.user!.uid,
                      receiverId: state.user.id,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(color: Colors.white,),
          ),
        );
      },
    );
  }
}
