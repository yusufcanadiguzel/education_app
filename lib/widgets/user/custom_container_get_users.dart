import 'package:education_app/constants/decorations/container_decorations.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/theme/text_styles.dart';
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
      decoration: ContainerDecorations.listContainerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    MagicStrings.people,
                    style: TextStyles.kHeaderTextStyle,
                  ),
                ],
              ),
            ),
            BlocBuilder<GetUsersByNameBloc, GetUsersByNameState>(
              builder: (context, state) {
                if (state is GetUsersByNameSuccess) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    shrinkWrap: true,
                    itemCount: state.users.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomUserItem(user: state.users[index]);
                    },
                  );
                }

                if (state is GetUsersByNameProcess) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }

                return Text(MagicStrings.empty);
              },
            ),
          ],
        ),
      ),
    );
  }
}
