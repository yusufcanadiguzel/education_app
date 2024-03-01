import 'dart:io';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_state.dart';
import 'package:education_app/blocs/update_user_info_bloc/update_user_info_event.dart';
import 'package:education_app/blocs/user/update_user_picture_bloc/update_user_picture_bloc.dart';
import 'package:education_app/blocs/user/update_user_picture_bloc/update_user_picture_event.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:education_app/widgets/custom_text_form_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import '../../blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'custom_user_circle_avatar.dart';

class UserDetailsDialog extends StatefulWidget {
  const UserDetailsDialog({super.key});

  @override
  State<UserDetailsDialog> createState() => _UserDetailsDialogState();
}

class _UserDetailsDialogState extends State<UserDetailsDialog> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _titleController = TextEditingController();

  PlatformFile? pickedFile;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile(String userId) async {
    final String path = '$userId/PP/${userId}_lead';
    final File file = File(pickedFile!.path!);

    context
        .read<UpdateUserPictureBloc>()
        .add(UpdateUserPicture(userId: userId, path: path, file: file));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
        builder: (context, state) {
          if (state is GetUserByIdSuccess) {
            _firstNameController.text = state.user.firstName;
            _lastNameController.text = state.user.lastName;
            state.user.title == null
                ? _titleController.text = ''
                : _titleController.text = state.user.title!;

            return AlertDialog(
              backgroundColor: const Color(0xFF151A3C),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Bilgileri Düzenle',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pickedFile != null
                      ? CircleAvatar(
                          radius: 75.0,
                          child: Image.file(
                            File(pickedFile!.path!),
                            fit: BoxFit.cover,
                          ),
                        )
                      : BlocProvider(
                          create: (context) => GetUserByIdBloc(
                            repository: context
                                .read<AuthenticationBloc>()
                                .userRepository,
                          )..add(
                              GetUserById(
                                id: context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .user!
                                    .uid,
                              ),
                            ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomUserPictureCircle(
                              radius: 75.0,
                              function: () => selectFile(),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CustomTextFormField(
                    labelText: 'İsim',
                    controller: _firstNameController,
                    hintText: state.user.firstName,
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
                    hintText: state.user.lastName,
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
                    hintText: state.user.title == null ? '' : state.user.title!,
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
                Center(
                  child: CustomActionButton(
                    function: () {
                      context.read<UpdateUserInfoBloc>().add(
                            UpdateUserInfo(
                              userModel: state.user.copyWith(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                title: _titleController.text,
                              ),
                            ),
                          );

                      uploadFile(state.user.id);

                      Navigator.pop(context);
                    },
                    buttonText: 'Kaydet',
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
