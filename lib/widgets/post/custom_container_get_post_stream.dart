import 'package:education_app/blocs/post/get_post_stream_bloc/get_post_stream_bloc.dart';
import 'package:education_app/blocs/post/get_post_stream_bloc/get_post_stream_state.dart';
import 'package:education_app/constants/decorations/container_decorations.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/post/custom_post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomContainerPostStream extends StatefulWidget {
  const CustomContainerPostStream({required this.communityId, super.key});

  final String communityId;

  @override
  State<CustomContainerPostStream> createState() =>
      _CustomContainerPostStreamState();
}

class _CustomContainerPostStreamState extends State<CustomContainerPostStream> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainerDecorations.listContainerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Gönderiler',
                    style: TextStyles.kHeaderTextStyle,
                  ),
                ],
              ),
            ),
            BlocBuilder<GetPostStreamBloc, GetPostStreamState>(
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
                        itemCount:
                            snapshot.data == null ? 0 : snapshot.data!.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (snapshot.data![index].communityId == widget.communityId) {
                            return CustomPostItem(post: snapshot.data![index]);
                          }

                          return const Text('');
                        },
                      );
                    },
                  );
                }

                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
