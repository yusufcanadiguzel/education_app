import 'package:education_app/blocs/community/get_all_communities_by_name_bloc/get_all_communities_by_name_bloc.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/widgets/community/custom_community_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/community/get_all_communities_by_name_bloc/get_all_communities_by_name_state.dart';
import '../../constants/decorations/container_decorations.dart';
import '../../theme/text_styles.dart';

class CustomContainerGetCommunities extends StatefulWidget {
  const CustomContainerGetCommunities({super.key});

  @override
  State<CustomContainerGetCommunities> createState() => _CustomContainerGetCommunitiesState();
}

class _CustomContainerGetCommunitiesState extends State<CustomContainerGetCommunities> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainerDecorations.listContainerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10.0,),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    MagicStrings.communities,
                    style: TextStyles.kHeaderTextStyle,
                  ),
                ],
              ),
            ),
              BlocBuilder<GetAllCommunitiesByNameBloc, GetAllCommunitiesByNameState>(
              builder: (context, state) {
                if (state is GetAllCommunitiesByNameStateSuccess) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,),
                    shrinkWrap: true,
                    itemCount: state.communities.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10,),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomCommunityItem(community: state.communities[index]);
                    },
                  );

                }

                return Text(MagicStrings.unknownState);
              },
            ),
          ],
        ),
      ),
    );
  }
}
