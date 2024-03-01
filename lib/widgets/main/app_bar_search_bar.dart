import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/get_users_bloc/get_users_bloc.dart';
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
        onTap: function,
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
