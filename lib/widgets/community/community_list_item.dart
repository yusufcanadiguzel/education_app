import 'package:education_app/blocs/get_community_by_id_bloc/get_community_by_id_event.dart';
import 'package:education_app/blocs/post/get_posts_by_community_stream_bloc/get_posts_by_community_stream_bloc.dart';
import 'package:education_app/models/community/community.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_community_repository.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_post_repository.dart';
import 'package:education_app/screens/community/community_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/get_community_by_id_bloc/get_community_by_id_bloc.dart';
import '../../blocs/post/get_posts_by_community_stream_bloc/get_posts_by_community_stream_event.dart';

class CommunityListItem extends StatefulWidget {
  const CommunityListItem({required this.community, super.key});

  final Community community;

  @override
  State<CommunityListItem> createState() => _CommunityListItem();
}

class _CommunityListItem extends State<CommunityListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: CircleAvatar(
          radius: 30.0,
          child: Text(
            widget.community.name[0],
          ),
        ),
      ),
      title: Text(
        widget.community.name,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        widget.community.description,
        style: const TextStyle(
          fontSize: 15.0,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      dense: true,
      tileColor: Colors.white,
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetCommunityByIdBloc(
                  repository: FirebaseCommunityRepository())
                ..add(
                  GetCommunityById(
                    id: widget.community.id,
                  ),
                ),
            ),
            BlocProvider(
              create: (context) => GetPostsByCommunityStreamBloc(
                repository: FirebasePostRepository(),
              )..add(
                  GetPostByCommunityStream(
                    communityId: widget.community.id,
                  ),
                ),
            )
          ],
          child: const CommunityScreen(),
        ),
      )),
    );
  }
}
