import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/message/get_message_stream_bloc/get_message_stream_bloc.dart';
import 'package:education_app/blocs/message/get_message_stream_bloc/get_message_stream_state.dart';
import 'package:education_app/widgets/message/message_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageStreamV2 extends StatelessWidget {
  const MessageStreamV2({required this.receiverId, super.key});

  final String receiverId;

  @override
  Widget build(BuildContext context) {
    String userId = context.read<AuthenticationBloc>().state.user!.uid;

    return BlocBuilder<GetMessageStreamBloc, GetMessageStreamState>(
      builder: (context, state) {
        if (state is GetMessageStreamStateSuccess) {
          return StreamBuilder(
            stream: state.messageStream,
            builder: (context, snapshot) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                shrinkWrap: true,
                itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if ((snapshot.data![index].senderId == userId && snapshot.data![index].receiverId == receiverId) ||
                      snapshot.data![index].receiverId == userId && snapshot.data![index].senderId == receiverId) {
                    return MessageBox(
                        isSender: snapshot.data![index].senderId == userId,
                        text: snapshot.data == null
                            ? ''
                            : snapshot.data![index].message);
                  }

                  return const Text('');
                },
              );
            },
          );
        }

        return const Text('MessageStreamV2 unknown state.');
      },
    );
  }
}
