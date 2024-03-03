import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/community/get_all_communities_by_name_bloc/get_all_communities_by_name_bloc.dart';
import 'package:education_app/blocs/community/get_all_communities_by_name_bloc/get_all_communities_by_name_event.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import 'package:education_app/blocs/get_users_by_name_bloc/get_users_by_name_event.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/user/custom_container_get_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../blocs/get_users_by_name_bloc/get_users_by_name_bloc.dart';
import '../widgets/custom_text_form_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late String searchText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MagicStrings.search,
          style: TextStyles.kHeaderTextStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: _searchController,
                  hintText: searchText,
                  iconData: FontAwesomeIcons.magnifyingGlass,
                  onChanged: (value) => setState(() {
                    searchText = value;
                    context
                        .read<GetUsersByNameBloc>()
                        .add(GetUsersByName(name: _searchController.text));
                    context.read<GetAllCommunitiesByNameBloc>().add(
                          GetAllCommunitiesByName(
                            name: _searchController.text,
                          ),
                        );
                  }),
                  validator: null,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    //Kişiler
                    BlocProvider(
                      create: (context) => GetUserByIdBloc(
                          repository: context
                              .read<AuthenticationBloc>()
                              .userRepository),
                      child: const CustomContainerGetUsers(),
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
