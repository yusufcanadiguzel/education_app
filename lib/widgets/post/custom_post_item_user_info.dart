import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/get_user_by_id_bloc/get_user_by_id_state.dart';

class CustomPostItemUserInfo extends StatefulWidget {
  const CustomPostItemUserInfo({super.key});

  @override
  State<CustomPostItemUserInfo> createState() => _CustomPostItemUserInfoState();
}

class _CustomPostItemUserInfoState extends State<CustomPostItemUserInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
      builder: (context, state) {
        if (state is GetUserByIdSuccess) {
          return Row(
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: state.user.profilePictureUrl == MagicStrings.empty
                    ? NetworkImage(
                        MagicStrings.defaultProfilePictureUrl,
                      )
                    : NetworkImage(state.user.profilePictureUrl!),
              ),
              Column(
                children: [
                  Text(
                    state.user.fullName!,
                    style: TextStyles.kListTileHeaderTextStyle,
                  ),
                ],
              )
            ],
          );
        }

        return const CircularProgressIndicator(
          color: Colors.white,
        );
      },
    );
  }
}
