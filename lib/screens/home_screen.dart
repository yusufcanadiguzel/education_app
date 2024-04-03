import 'package:education_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:education_app/screens/catalog_screen.dart';
import 'package:education_app/screens/post/post_screen.dart';
import 'package:education_app/screens/reviews_screen.dart';
import 'package:education_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/get_all_communities_bloc/get_all_communities_bloc.dart';
import '../blocs/get_all_communities_bloc/get_all_communities_event.dart';
import '../blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import '../blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import '../blocs/get_users_by_name_bloc/get_users_by_name_bloc.dart';
import '../repositories/concrete/firebase/firebase_community_repository.dart';
import '../repositories/concrete/firebase/firebase_user_repository.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/drawers/custom_user_drawer.dart';
import '../widgets/user/custom_user_circle_avatar.dart';
import 'community/communities_screen.dart';
import 'tobeto_screen.dart';

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
    return SafeArea(
      child: Scaffold(
        drawer: BlocProvider(
          create: (context) => GetUserByIdBloc(
              repository: context.read<AuthenticationBloc>().userRepository)
            ..add(
              GetUserById(
                id: context.read<AuthenticationBloc>().state.user!.uid,
              ),
            ),
          child: CustomUserDrawer(
            pushCommunity: () => onPageChanged(4),
          ),
        ),
        key: _key,
        appBar: CustomAppBar(
          function: () => navigationTapped(5),
          leadingWidget: BlocProvider(
            create: (context) => GetUserByIdBloc(
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
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => GetUsersByNameBloc(
                    repository: FirebaseUserRepository(),
                  ),
                ),
                BlocProvider(
                  create: (context) => GetAllCommunitiesBloc(
                      repository: FirebaseCommunityRepository()),
                ),
              ],
              child: const SearchScreen(),
            ),
            BlocProvider(
              create: (context) => CatalogBloc(),
              child: const CatalogScreen(),
            ),
            ReviewsScreen(),
            PostScreen(),
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => GetUserByIdBloc(
                      repository:
                      context.read<AuthenticationBloc>().userRepository)
                    ..add(
                      GetUserById(
                        id: context.read<AuthenticationBloc>().state.user!.uid,
                      ),
                    ),
                ),
                BlocProvider(
                  create: (context) => GetAllCommunitiesBloc(
                    repository: FirebaseCommunityRepository(),
                  )..add(
                    GetAllCommunities(),
                  ),
                )
              ],
              child: const CommunitiesScreen(),
            ),
            TobetoScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
                color:
                _currentPage == 0 ? const Color(0xFFFF0067) : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.book,
                color:
                _currentPage == 1 ? const Color(0xFFFF0067) : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.flaskVial,
                color:
                _currentPage == 2 ? const Color(0xFFFF0067) : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.squarePlus,
                color:
                _currentPage == 3 ? const Color(0xFFFF0067) : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.peopleRoof,
                color:
                _currentPage == 4 ? const Color(0xFFFF0067) : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.graduationCap,
                color:
                _currentPage == 5 ? const Color(0xFFFF0067) : Colors.black,
              ),
              label: '',
            ),
          ],
          onTap: navigationTapped,
        ),
      ),
    );
  }
}
