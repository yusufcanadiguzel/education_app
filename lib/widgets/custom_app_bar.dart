import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../blocs/get_users_bloc/get_users_bloc.dart';
import '../screens/search_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({this.leadingWidget, super.key});

  final Widget? leadingWidget;

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
              builder: (context) => BlocProvider(
                create: (context) => GetUsersBloc(
                  repository: context.read<AuthenticationBloc>().userRepository,
                ),
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
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.gear,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 50.0);
}
