import 'package:education_app/blocs/get_community_bloc/get_community_bloc.dart';
import 'package:education_app/blocs/get_community_bloc/get_community_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetCommunityBloc, GetCommunityState>(
        builder: (context, state) {
          if(state is GetCommunitySuccess){
            return Center(
              child: Text(state.community.name),
            );
          }

          return const Text('unknown state');
        },
      ),
    );
  }
}
