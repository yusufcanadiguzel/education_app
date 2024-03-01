import 'dart:developer';

import 'package:education_app/blocs/post/get_all_posts_bloc/get_all_posts_bloc.dart';
import 'package:education_app/blocs/post/get_all_posts_bloc/get_all_posts_state.dart';
import 'package:education_app/widgets/post/custom_post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/decorations/container_decorations.dart';
import '../../theme/text_styles.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({required this.communityId, super.key});

  final String communityId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainerDecorations.listContainerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10.0,),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Paylaşımlar',
                    style: TextStyles.kHeaderTextStyle,
                  ),
                ],
              ),
            ),
            BlocBuilder<GetAllPostsBloc, GetAllPostsState>(
              builder: (context, state) {
                if (state is GetAllPostsStateSuccess) {
                  log(state.posts.length.toString());
                  if(state.posts.isEmpty){
                    return const Text('Paylaşım bulunamadı...', style: TextStyles.kListTileHeaderTextStyle,);
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,),
                    shrinkWrap: true,
                    itemCount: state.posts.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10,),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if(communityId == state.posts[index].communityId){
                        return CustomPostItem(post: state.posts[index],);
                      }
                    },
                  );
                }

                if(state is GetAllPostsStateFailure){
                  return const Text('getAllPostsFailure', style: TextStyles.kHeaderTextStyle,);
                }

                return const Text('');
              },
            ),
          ],
        ),
      ),
    );
  }
}
