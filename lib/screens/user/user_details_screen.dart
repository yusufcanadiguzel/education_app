import 'package:education_app/blocs/get_user_bloc/get_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/get_user_bloc/get_user_bloc.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetUserBloc, GetUserState>(
        builder: (context, state) {
          if(state is GetUserSuccess){
            return Center(
              child: Text(state.userModel.firstName),
            );
          }

          return const Text('unknown state');
        },
      ),
    );
  }
}
