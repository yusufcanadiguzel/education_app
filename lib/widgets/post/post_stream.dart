

import 'package:education_app/widgets/post/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import '../../blocs/post/get_posts_by_community_stream_bloc/get_posts_by_community_stream_bloc.dart';
import '../../blocs/post/get_posts_by_community_stream_bloc/get_posts_by_community_stream_state.dart';
import '../../repositories/concrete/firebase/firebase_user_repository.dart';

class PostStream extends StatelessWidget {
  const PostStream({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPostsByCommunityStreamBloc,
        GetPostsByCommunityStreamState>(
      builder: (context, state) {
        if (state is GetPostsByCommunityStreamSuccess) {
          return StreamBuilder(
            stream: state.postStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }

              var posts = snapshot.data!.docs;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return BlocProvider(
                    create: (context) => GetUserByIdBloc(repository: FirebaseUserRepository(),)..add(GetUserById(id: posts[index].data()['creatorId'])),
                    child: PostItem(
                      post: posts[index].data()['post'],
                    ),
                  );
                },
              );
            },
          );
        }

        return const Center(
          child: Text(
            'unknown state',
          ),
        );
      },
    );
  }
}
