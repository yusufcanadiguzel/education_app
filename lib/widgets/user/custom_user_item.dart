import 'package:education_app/models/user/user_model.dart';
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
    return ListTile(
      contentPadding: EdgeInsets.zero,
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
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        widget.user.title!,
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
    );
  }
}
