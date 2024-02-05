import 'package:auto_size_text/auto_size_text.dart';
import 'package:education_app/blocs/user_details_bloc/user_detail_bloc.dart';
import 'package:education_app/blocs/user_details_bloc/user_detail_event.dart';
import 'package:education_app/blocs/user_details_bloc/user_detail_state.dart';
import 'package:education_app/screens/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  
  const ProfileScreen({required this.userId, super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserDetailBloc>().add(GetUserDetail(userId: 'gJtoBBLZWNs8DP5v2ReM'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserDetailBloc, UserDetailState>(
  builder: (context, state) {
    if(state is UserDetailInitial){

    }

    if(state is UserDetailLoaded){
      return SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    //Profil
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10),),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsScreen(user: state.user, docId: 'gJtoBBLZWNs8DP5v2ReM'),)),
                                      icon: const Icon(Icons.edit)
                                  ),
                                ],
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 50.0,
                              ),
                              AutoSizeText(
                                '${state.user.firstName} ${state.user.lastName}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                minFontSize: 12.0,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                state.user.title,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    //Hakkımda
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0),),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hakkımda', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),),
                            Text('asdhsjfdnjjfjfdjnfnlfnlfjnfjlnffjnfnlf'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    //Kurslarım
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0),),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kurslarım', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      ),
                    )
                  ]
              ),
            ),
          ],
        ),
      );
    }

    return Text('unknown state');
  },
),
    );
  }
}
