import 'dart:developer';

import 'package:education_app/blocs/post/get_post_stream_bloc/get_post_stream_bloc.dart';
import 'package:education_app/blocs/post/get_post_stream_bloc/get_post_stream_state.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/post/custom_post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PostStream extends StatelessWidget {
  const PostStream({required this.communityId, super.key});

  final String communityId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPostStreamBloc,
        GetPostStreamState>(
      builder: (context, state) {
        if (state is GetPostStreamSuccess) {
          return StreamBuilder(
            stream: state.postStream,
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
                  if (snapshot.data![index].communityId == communityId) {
                    log(snapshot.data![index].toString());
                    return CustomPostItem(post: snapshot.data![index]);
                  }

                  return Text(MagicStrings.attemp, style: TextStyles.kHeaderTextStyle,);
                },
              );
            },
          );
        }

        return Center(
          child: Text(
            MagicStrings.unknownState,
            style: TextStyles.kHeaderTextStyle,
          ),
        );
      },
    );
  }
}
