import 'package:education_app/models/post/post.dart';
import 'package:education_app/widgets/user/user_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_state.dart';

class PostItem extends StatelessWidget {
  const PostItem({required this.post, super.key});

  //final DateTime createdAt;
  final Post post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
      builder: (context, state) {
        if(state is GetUserByIdSuccess){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UserRow(userId: state.user.id),
                  ),
                  Text(
                    post.post,
                  ),
                ],
              ),
            ),
          );
        }

        return const Text('PostItem error');
      },
    );
  }
}
