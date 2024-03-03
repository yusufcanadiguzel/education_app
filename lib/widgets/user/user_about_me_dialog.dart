import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_state.dart';
import '../../blocs/update_user_info_bloc/update_user_info_bloc.dart';
import '../../blocs/update_user_info_bloc/update_user_info_event.dart';
import '../../theme/text_styles.dart';
import '../custom_action_button.dart';
import '../custom_text_form_field.dart';

class UserAboutMeDialog extends StatefulWidget {
  const UserAboutMeDialog({super.key});

  @override
  State<UserAboutMeDialog> createState() => _UserAboutMeDialogState();
}

class _UserAboutMeDialogState extends State<UserAboutMeDialog> {
  final aboutMeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
        builder: (context, state) {
          if (state is GetUserByIdSuccess) {
            aboutMeController.text = state.user.aboutMe == null ? '' : state.user.aboutMe!;
            return AlertDialog(
              backgroundColor: const Color(0xFF151A3C),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    MagicStrings.editAboutMe,
                    style: TextStyles.kHeaderTextStyle,
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      FontAwesomeIcons.xmark,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              content: Column(
                children: [
                  CustomTextFormField(
                    maxLength: 500,
                    maxLines: 10,
                    labelText: MagicStrings.aboutMe,
                    controller: aboutMeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return MagicStrings.pleaseFillThisField;
                      }
                      return null;
                    },
                  ),
                ],
              ),
              actions: [
                Center(
                  child: CustomActionButton(
                    function: () {
                      context.read<UpdateUserInfoBloc>().add(
                        UpdateUserInfo(
                          userModel: state.user.copyWith(
                            aboutMe: aboutMeController.text
                          ),
                        ),
                      );
      
                      Navigator.pop(context);
                    },
                    buttonText: MagicStrings.save,
                  ),
                ),
              ],
            );
          }
      
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
