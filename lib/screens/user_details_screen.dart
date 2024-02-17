import 'dart:io';

import 'package:education_app/blocs/user_bloc/user_bloc.dart';
import 'package:education_app/blocs/user_bloc/user_event.dart';
import 'package:education_app/blocs/user_bloc/user_state.dart';
import 'package:education_app/models/user/user_model.dart';
import 'package:education_app/screens/profile_screen.dart';
import 'package:education_app/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserModel user;
  final String docId;

  const UserDetailsScreen({required this.user, required this.docId, super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    String _firstName = user.firstName;
    String _lastName = user.lastName;
    String _title = user.title;
    late File _image;

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if(state is UserChangesSaved){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(userId: user.id),));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: ListView(
                  children: [
                    //ProfilFotoğrafı
                    //Kullanıcı Bilgileri
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0),),
                          color: Colors.white
                      ),
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery,);
                                  _image = File(pickedImage!.path);
                                },
                                child: CircleAvatar(
                                  child: Image.network(user.profilePictureUrl),
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'Lütfen alanı boş geçmeyiniz';
                                  }
                                },
                                enabled: false,
                                decoration: kTextFormFieldDecoration.copyWith(
                                  labelText: user.email,
                                  prefixIcon: const Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(Icons.mail),
                                  ),
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'Lütfen alanı boş geçmeyiniz';
                                  }
                                },
                                onChanged: (value) => _firstName = value,
                                decoration: kTextFormFieldDecoration.copyWith(
                                  labelText: user.firstName,
                                  prefixIcon: const Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(Icons.mail),
                                  ),
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'Lütfen alanı boş geçmeyiniz';
                                  }
                                },
                                onChanged: (value) => _lastName = value,
                                decoration: kTextFormFieldDecoration.copyWith(
                                  labelText: user.lastName,
                                  prefixIcon: const Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(Icons.mail),
                                  ),
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'Lütfen alanı boş geçmeyiniz';
                                  }
                                },
                                onChanged: (value) => _title = value,
                                decoration: kTextFormFieldDecoration.copyWith(
                                  labelText: user.title,
                                  prefixIcon: const Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(Icons.mail),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<UserBloc>().add(UpdateUserPicture(pickedFile: _image, docId: docId));
                                  context.read<UserBloc>().add(UpdateUser(user:
                                  UserModel(
                                      id: user.id,
                                      firstName: _firstName,
                                      lastName: _lastName,
                                      email: user.email,
                                      title: _title,
                                      profilePictureUrl: user.profilePictureUrl
                                  ),
                                      docId: docId));
                                },
                                child: const Text('Kaydet'),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
