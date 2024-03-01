import 'package:education_app/widgets/user/custom_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/get_users_by_name_bloc/get_users_by_name_bloc.dart';
import '../../blocs/get_users_by_name_bloc/get_users_by_name_state.dart';

class CustomContainerGetUsers extends StatefulWidget {
  const CustomContainerGetUsers({super.key});

  @override
  State<CustomContainerGetUsers> createState() =>
      _CustomContainerGetUsersState();
}

class _CustomContainerGetUsersState extends State<CustomContainerGetUsers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Kişiler',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<GetUsersByNameBloc, GetUsersByNameState>(
            builder: (context, state) {
              if (state is GetUsersByNameSuccess) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,),
                  shrinkWrap: true,
                  itemCount: state.users.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10,),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomUserItem(user: state.users[index]);
                  },
                );
              }

              return const Text('sonuç yok');
            },
          ),
        ],
      ),
    );
  }
}
