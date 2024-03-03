import 'package:education_app/blocs/get_all_communities_bloc/get_all_communities_state.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/widgets/community/community_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/get_all_communities_bloc/get_all_communities_bloc.dart';

class ContainerGetCommunities extends StatefulWidget {
  const ContainerGetCommunities({super.key});

  @override
  State<ContainerGetCommunities> createState() =>
      _ContainerGetCommunitiesState();
}

class _ContainerGetCommunitiesState extends State<ContainerGetCommunities> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  MagicStrings.people,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<GetAllCommunitiesBloc, GetAllCommunitiesState>(
            builder: (context, state) {
              if (state is GetAllCommunitiesSuccess) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,),
                  shrinkWrap: true,
                  itemCount: state.communities.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10,),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CommunityListItem(community: state.communities[index]);
                  },
                );
              }

              return Text(MagicStrings.cantFindAnything);
            },
          ),
        ],
      ),
    );
  }
}
