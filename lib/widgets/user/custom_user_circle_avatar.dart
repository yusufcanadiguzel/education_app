import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../../constants/strings/magic_strings.dart';

class CustomUserPictureCircle extends StatelessWidget {
  const CustomUserPictureCircle(
      {this.function, required this.radius, super.key});

  final Function()? function;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
      builder: (context, state) {
        if (state is GetUserByIdSuccess) {
          return GestureDetector(
            onTap: function,
            child: CircleAvatar(
              radius: radius,
              backgroundImage: state.user.profilePictureUrl == null ||
                      state.user.profilePictureUrl!.isEmpty
                  ? NetworkImage(
                      MagicStrings.defaultProfilePictureUrl,
                    )
                  : NetworkImage(state.user.profilePictureUrl!),
            ),
          );
        }

        return const CircleAvatar(
          backgroundColor: Color(0xFF272B4D),
          child: Icon(
            FontAwesomeIcons.solidUser,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
