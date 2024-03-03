import 'package:education_app/models/post/post.dart';
import 'package:flutter/material.dart';

import '../../constants/decorations/container_decorations.dart';
import '../../constants/strings/magic_strings.dart';
import '../../theme/text_styles.dart';

class CustomPostItem extends StatefulWidget {
  const CustomPostItem({required this.post, super.key});

  final Post post;

  @override
  State<CustomPostItem> createState() => _CustomPostItemState();
}

class _CustomPostItemState extends State<CustomPostItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainerDecorations.listTileContainerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  widget.post.creator.profilePictureUrl!.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          child: CircleAvatar(
                            radius: 30.0,
                            child: Text(
                              MagicStrings.getUserLetters(
                                  firstName: widget.post.creator.firstName,
                                  lastName: widget.post.creator.lastName),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                              widget.post.creator.profilePictureUrl!,
                            ),
                          ),
                        ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.creator.fullName!,
                        style: TextStyles.kListTileHeaderTextStyle,
                      ),
                      Text(
                        widget.post.createdAt.toString(),
                        style: TextStyles.kListTileDescriptionTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Text(
              widget.post.post,
              style: TextStyles.kNormalTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
