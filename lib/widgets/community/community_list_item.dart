import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/get_community_by_id_bloc/get_community_by_id_event.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import 'package:education_app/blocs/post/get_posts_by_community_stream_bloc/get_posts_by_community_stream_bloc.dart';
import 'package:education_app/constants/decorations/container_decorations.dart';
import 'package:education_app/models/community/community.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_community_repository.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_post_repository.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_user_repository.dart';
import 'package:education_app/screens/community/community_screen.dart';
import 'package:education_app/theme/text_styles.dart';
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
    return Container(
      decoration: ContainerDecorations.listTileContainerDecoration,
      child: ListTile(
        contentPadding: const EdgeInsets.all(5.0),
        leading: CircleAvatar(
          radius: 30.0,
          child: Text(
            widget.community.name[0],
          ),
        ),
        title: Text(
          widget.community.name,
          style: TextStyles.kListTileHeaderTextStyle,
        ),
        subtitle: Text(
          widget.community.description,
          style: TextStyles.kListTileDescriptionTextStyle,
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
              ),
              BlocProvider(
                create: (context) => GetUserByIdBloc(
                    repository: FirebaseUserRepository())
                  ..add(
                    GetUserById(
                      id: context.read<AuthenticationBloc>().state.user!.uid,
                    ),
                  ),
              )
            ],
            child: const CommunityScreen(),
          ),
        )),
      ),
    );
  }
}
