import 'package:education_app/models/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/post/create_post_bloc/create_post_bloc.dart';
import '../../blocs/post/create_post_bloc/create_post_event.dart';
import '../../blocs/post/create_post_bloc/create_post_state.dart';
import '../../models/user/user_model.dart';

class CommunityPostScreen extends StatefulWidget {
  final UserModel user;
  final String communityId;

  const CommunityPostScreen({required this.user, required this.communityId, super.key});

  @override
  State<CommunityPostScreen> createState() => _CommunityPostScreenState();
}

class _CommunityPostScreenState extends State<CommunityPostScreen> {
  final _postController = TextEditingController();

  late Post post;

  @override
  void initState() {
    super.initState();
    post = Post.empty;
    post.creator = widget.user;
    post.communityId = widget.communityId;
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (state is CreatePostSuccess) {
          Navigator.pop(context);
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            elevation: 0,
            foregroundColor: Colors.white,
            title: const Center(child: Text('Bir şeyler paylaş...')),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _postController,
                maxLines: 10,
                maxLength: 500,
                decoration: InputDecoration(
                    hintText: 'Ne düşünüyorsun...',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                    )),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (_postController.text.isNotEmpty) {
                post.post = _postController.text;
              }

              context.read<CreatePostBloc>().add(CreatePost(post: post));
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}