import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/main/app_bar_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../blocs/get_users_bloc/get_users_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({this.leadingWidget, this.function, super.key});

  final Widget? leadingWidget;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leadingWidget,
      title: AppBarSearchBar(
        function: function,
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
  Size get preferredSize => const Size(double.infinity, 60.0);
}
