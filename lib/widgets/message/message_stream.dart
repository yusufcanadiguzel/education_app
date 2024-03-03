import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/message/get_messages_by_user_stream_bloc/get_messages_by_user_stream_bloc.dart';
import '../../blocs/message/get_messages_by_user_stream_bloc/get_messages_by_user_stream_state.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMessagesByUserStreamBloc, GetMessagesByUserStreamState>(
      builder: (context, state) {
        if(state is GetMessagesByUserStreamSuccess){
          return StreamBuilder(stream: state.messageStream, builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container();
            }

            var messages = snapshot.data!.docs;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
              return Text(messages[index].data()[MagicStrings.messageFieldName]);
            },);
          },);
        }

        return Center(
          child: Text(MagicStrings.unknownState),
        );
      },
    );
  }
}
