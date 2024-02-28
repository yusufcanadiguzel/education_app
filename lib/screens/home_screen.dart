import 'dart:developer';

import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/user_bloc/user_bloc.dart';
import 'package:education_app/blocs/user_bloc/user_event.dart';
import 'package:education_app/screens/community/communities_screen.dart';
import 'package:education_app/screens/friend/friends_screen.dart';
import 'package:education_app/screens/message/message_screen.dart';
import 'package:education_app/screens/post/post_screen.dart';
import 'package:education_app/screens/tobeto_screen.dart';
import 'package:education_app/widgets/announcement_card.dart';
import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/custom_app_bar.dart';
import 'package:education_app/widgets/drawers/custom_user_drawer.dart';
import 'package:education_app/widgets/user/custom_user_circle_avatar.dart';
import 'package:education_app/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _key = GlobalKey<ScaffoldState>();

  late PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

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
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TobetoScreen(),
          FriendsScreen(),
          PostScreen(),
          MessageScreen(),
          BlocProvider(
            create: (context) => UserBloc(
                repository: context.read<AuthenticationBloc>().userRepository)
              ..add(
                GetUserById(
                  id: context.read<AuthenticationBloc>().state.user!.uid,
                ),
              ),
            child: const CommunitiesScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              color: _currentPage == 0 ? Colors.black : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.users,
              color: _currentPage == 1 ? Colors.black : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.squarePlus,
              color: _currentPage == 2 ? Colors.black : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.message,
              color: _currentPage == 3 ? Colors.black : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.peopleRoof,
              color: _currentPage == 4 ? Colors.black : Colors.grey,
            ),
            label: '',
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
