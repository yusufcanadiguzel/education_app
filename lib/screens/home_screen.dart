import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/user_bloc/user_bloc.dart';
import 'package:education_app/blocs/user_bloc/user_event.dart';
import 'package:education_app/widgets/announcement_card.dart';
import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/custom_app_bar.dart';
import 'package:education_app/widgets/drawers/custom_user_drawer.dart';
import 'package:education_app/widgets/user/custom_user_circle_avatar.dart';
import 'package:education_app/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BlocProvider(
        create: (context) => UserBloc(
            repository: context.read<AuthenticationBloc>().userRepository)
          ..add(
            GetUserById(
              id: context.read<AuthenticationBloc>().state.user!.uid,
            ),
          ),
        child: const CustomUserDrawer(),
      ),
      key: _key,
      appBar: CustomAppBar(
        leadingWidget: BlocProvider(
          create: (context) => UserBloc(
            repository: context.read<AuthenticationBloc>().userRepository,
          )..add(
              GetUserById(
                id: context.read<AuthenticationBloc>().state.user!.uid,
              ),
            ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomUserPictureCircle(
              radius: 20.0,
              function: () => _key.currentState!.openDrawer(),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 75.0,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: 'TOBETO',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9B33FF),
                              fontSize: 26.4),
                          children: [
                            TextSpan(
                                text: '\'ya hoş geldin',
                                style: TextStyle(
                                    color: Color(0xFF4D4D4D), fontSize: 26.4)),
                            TextSpan(
                              text: '\nUsername',
                              style: TextStyle(
                                  color: Color(0xFF4D4D4D), fontSize: 26.4),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      'Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
              ),
            ),
            AnnouncementCard(),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                          'assets/images/istanbul_kodluyor_logo.png',
                          width: 200.0),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: const Text(
                          'Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.',
                          style:
                              TextStyle(fontSize: 18.0, fontFamily: 'Poppins'),
                          textAlign: TextAlign.center),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            text: 'Aradığın ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF282828),
                                fontSize: 26.4,
                                wordSpacing: 4.0),
                            children: [
                              TextSpan(
                                  text: '"',
                                  style: TextStyle(
                                      color: Color(0xFF00d29b),
                                      fontSize: 26.4)),
                              TextSpan(
                                  text: 'İş',
                                  style: TextStyle(
                                      fontSize: 26.4,
                                      color: Color(0xFF282828))),
                              TextSpan(
                                  text: '" ',
                                  style: TextStyle(
                                      color: Color(0xFF00d29b),
                                      fontSize: 26.4)),
                              TextSpan(
                                text: '\nBurada!',
                                style: TextStyle(
                                    fontSize: 26.4, color: Color(0xFF282828)),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const MyButton(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
