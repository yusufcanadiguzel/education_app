import 'package:education_app/blocs/get_community_by_id_bloc/get_community_by_id_bloc.dart';
import 'package:education_app/blocs/get_community_by_id_bloc/get_community_by_id_event.dart';
import 'package:education_app/models/community/community.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_community_repository.dart';
import 'package:education_app/screens/community/community_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/decorations/container_decorations.dart';
import '../../theme/text_styles.dart';

class CustomCommunityItem extends StatefulWidget {
  const CustomCommunityItem({required this.community, super.key});

  final Community community;

  @override
  State<CustomCommunityItem> createState() => _CustomCommunityItemState();
}

class _CustomCommunityItemState extends State<CustomCommunityItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainerDecorations.listTileContainerDecoration,
      child: ListTile(
        contentPadding: const EdgeInsets.all(
          5.0,
        ),
        leading: CircleAvatar(
          child: Text(widget.community.name[0]),
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
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => GetCommunityByIdBloc(
                            repository: FirebaseCommunityRepository())
                          ..add(
                            GetCommunityById(id: widget.community.id),
                          ),
                      ),
                    ],
                    child: const CommunityScreen(),
                  )),
        ),
      ),
    );
  }
}
