import 'package:education_app/constants/decorations/container_decorations.dart';
import 'package:education_app/models/user/user_model.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import '../../blocs/update_user_info_bloc/update_user_info_bloc.dart';
import '../../screens/user/profile_screen.dart';
import '../../screens/user/user_details_screen.dart';

class CustomUserItem extends StatefulWidget {
  const CustomUserItem({required this.user, super.key});

  final UserModel user;

  @override
  State<CustomUserItem> createState() => _CustomUserItemState();
}

class _CustomUserItemState extends State<CustomUserItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainerDecorations.listTileContainerDecoration,
      child: ListTile(
        contentPadding: const EdgeInsets.all(5.0,),
        leading: widget.user.profilePictureUrl!.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: CircleAvatar(
                  radius: 30.0,
                  child: Text(
                    '${widget.user.firstName[0]}${widget.user.lastName[0]}',
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(widget.user.profilePictureUrl!),
                ),
              ),
        title: Text(
          widget.user.fullName!,
          style: TextStyles.kListTileHeaderTextStyle,
        ),
        subtitle: Text(
          widget.user.title!,
          style: TextStyles.kListTileDescriptionTextStyle,
        ),
        dense: true,
        tileColor: Colors.white,
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => GetUserByIdBloc(
                      repository:
                          context.read<AuthenticationBloc>().userRepository)
                    ..add(
                      GetUserById(id: widget.user.id),
                    ),
                ),
                BlocProvider(
                  create: (context) => UpdateUserInfoBloc(
                    repository: context.read<AuthenticationBloc>().userRepository,
                  ),
                ),
              ],
              child: widget.user.id ==
                      context.read<AuthenticationBloc>().state.user!.uid
                  ? ProfileScreen(userId: widget.user.id)
                  : const UserDetailsScreen()),
        )),
      ),
    );
  }
}
