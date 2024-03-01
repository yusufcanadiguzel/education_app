// import 'package:education_app/widgets/post/post_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../blocs/post/get_all_posts_by_community_id/get_all_posts_by_community_id_bloc.dart';
// import '../../blocs/post/get_all_posts_by_community_id/get_all_posts_by_community_id_state.dart';
//
// class ContainerPostList extends StatelessWidget {
//   const ContainerPostList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: BlocBuilder<GetAllPostsByCommunityIdBloc, GetAllPostsByCommunityIdState>(
//         builder: (context, state) {
//           if(state is GetAllPostsByCommunityIdSuccess){
//             return ListView.separated(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0,),
//               shrinkWrap: true,
//               itemCount: state.posts.length,
//               separatorBuilder: (context, index) => const SizedBox(height: 10,),
//               physics: const BouncingScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return PostItem(post: state.posts[index].post);
//               },
//             );
//           }
//
//           return const CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }
