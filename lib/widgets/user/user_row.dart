import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_state.dart';
import '../../repositories/concrete/firebase/firebase_user_repository.dart';
import 'custom_user_circle_avatar.dart';

class UserRow extends StatelessWidget {
  const UserRow({required this.userId, super.key});

  //final DateTime createdAt;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
      builder: (context, state) {
        if(state is GetUserByIdSuccess){
          return Row(
            children: [
              BlocProvider(
                create: (context) => GetUserByIdBloc(repository: FirebaseUserRepository())..add(GetUserById(id: userId),),
                child: const CustomUserPictureCircle(radius: 30),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.user.fullName!,
                    style:
                    const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ],
          );
        }

        return const Text('UserRow error');
      },
    );
  }
}
