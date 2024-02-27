import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:education_app/blocs/user_bloc/user_bloc.dart';
import 'package:education_app/blocs/user_bloc/user_event.dart';
import 'package:education_app/screens/user/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/user_bloc/user_state.dart';

class CustomUserPictureCircle extends StatelessWidget {
  const CustomUserPictureCircle({this.function, required this.radius, super.key});

  final Function()? function;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          return GestureDetector(
            onTap: function,
            child: CircleAvatar(
              radius: radius,
              backgroundColor: Colors.grey,
              backgroundImage: state.userModel.profilePictureUrl == null || state.userModel.profilePictureUrl!.isEmpty
                  ? const NetworkImage(
                      'https://w7.pngwing.com/pngs/177/551/png-transparent-user-interface-design-computer-icons-default-stephen-salazar-graphy-user-interface-design-computer-wallpaper-sphere-thumbnail.png',
                    )
                  : NetworkImage(state.userModel.profilePictureUrl!),
            ),
          );
        }

        return const Icon(FontAwesomeIcons.solidUser);
      },
    );
  }
}
