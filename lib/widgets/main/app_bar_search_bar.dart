import 'package:education_app/blocs/community/get_all_communities_by_name_bloc/get_all_communities_by_name_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/get_all_communities_bloc/get_all_communities_bloc.dart';
import '../../blocs/get_users_bloc/get_users_bloc.dart';
import '../../blocs/get_users_by_name_bloc/get_users_by_name_bloc.dart';
import '../../repositories/concrete/firebase/firebase_community_repository.dart';
import '../../repositories/concrete/firebase/firebase_user_repository.dart';
import '../../screens/search_screen.dart';
import '../../theme/text_styles.dart';

class AppBarSearchBar extends StatelessWidget {
  const AppBarSearchBar({this.function, super.key});

  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUsersBloc(
        repository: context.read<AuthenticationBloc>().userRepository,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => GetUsersByNameBloc(
                      repository: FirebaseUserRepository(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => GetAllCommunitiesBloc(
                        repository: FirebaseCommunityRepository()),
                  ),
                  BlocProvider(
                    create: (context) => GetAllCommunitiesByNameBloc(
                      repository: FirebaseCommunityRepository(),
                    ),
                  )
                ],
                child: const SearchScreen(),
              ),
            ),
          );
        },
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xFF272B4D),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 16.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Arama Yapın',
                  style: TextStyles.kNormalTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
