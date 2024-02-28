import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/get_communities_bloc/get_communities_bloc.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_community_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../blocs/get_users_bloc/get_users_bloc.dart';
import '../screens/search_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({this.leadingWidget, this.function, super.key});

  final Widget? leadingWidget;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leadingWidget,
      title: BlocProvider(
        create: (context) => GetUsersBloc(
          repository: context.read<AuthenticationBloc>().userRepository,
        ),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => GetUsersBloc(
                      repository:
                          context.read<AuthenticationBloc>().userRepository,
                    ),
                  ),
                  BlocProvider(
                    create: (context) => GetCommunitiesBloc(
                      repository: FirebaseCommunityRepository(),
                    ),
                  ),
                ],
                child: const SearchScreen(),
              ),
            ),
          ),
          child: Container(
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Theme.of(context).secondaryHeaderColor,
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
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      actions: [
        BlocProvider(
          create: (context) => SignInBloc(
              userRepository:
                  context.read<AuthenticationBloc>().userRepository),
          child: IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(SignOut());
            },
            icon: const Icon(
              FontAwesomeIcons.gear,
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 50.0);
}
