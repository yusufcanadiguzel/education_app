import 'package:education_app/blocs/update_user_info_bloc/update_user_info_event.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:education_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/update_user_info_bloc/update_user_info_bloc.dart';
import '../../blocs/user_bloc/user_bloc.dart';
import '../../blocs/user_bloc/user_state.dart';

class UserDetailsDialog extends StatefulWidget {
  const UserDetailsDialog({super.key});

  @override
  State<UserDetailsDialog> createState() => _UserDetailsDialogState();
}

class _UserDetailsDialogState extends State<UserDetailsDialog> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          _firstNameController.text = state.userModel.firstName;
          _lastNameController.text = state.userModel.lastName;
          state.userModel.title == null
              ? _titleController.text = ''
              : _titleController.text = state.userModel.title!;

          return AlertDialog(
            title: const Text('Bilgileri Düzenle'),
            content: Column(
              children: [
                CustomTextFormField(
                  labelText: 'İsim',
                  controller: _firstNameController,
                  hintText: state.userModel.firstName,
                  iconData: FontAwesomeIcons.person,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Lütfen alanı doldurunuz.';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  labelText: 'Soy İsim',
                  controller: _lastNameController,
                  hintText: state.userModel.lastName,
                  iconData: FontAwesomeIcons.person,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Lütfen alanı doldurunuz.';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  labelText: 'Ünvan',
                  controller: _titleController,
                  hintText: state.userModel.title == null
                      ? ''
                      : state.userModel.title!,
                  iconData: FontAwesomeIcons.idBadge,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Lütfen alanı doldurunuz.';
                    }
                    return null;
                  },
                ),
              ],
            ),
            actions: [
              CustomActionButton(
                function: () {
                  context.read<UpdateUserInfoBloc>().add(
                        UpdateUserInfo(
                          userModel: state.userModel.copyWith(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            title: _titleController.text,
                          ),
                        ),
                      );

                  Navigator.pop(context);
                },
                buttonText: 'Kaydet',
              ),
            ],
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
