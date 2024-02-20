// import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
// import 'package:education_app/blocs/auth_bloc/auth_event.dart';
// import 'package:education_app/blocs/auth_bloc/auth_state.dart';
// import 'package:education_app/screens/home_screen.dart';
// import 'package:education_app/screens/login_screen.dart';
// import 'package:education_app/theme/theme_constants.dart';
// import 'package:education_app/widgets/custom_elevated_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<AuthBloc, AuthState>(
//         builder: (context, state) {
//           if(state is AuthInitial){
//             context.read<AuthBloc>().add(CheckUser());
//           }
//
//           if(state is AuthLoading){
//
//           }
//
//           if(state is AuthLoaded){
//             final _formKey = GlobalKey<FormState>();
//             var email = '';
//             var password = '';
//
//             return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(40.0),
//                   child: AspectRatio(
//                     aspectRatio: 9 / 16,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           color: Colors.white
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Form(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset('assets/images/education_app_blue_logo.png'),
//                                 Expanded(
//                                   child: Form(
//                                     key: _formKey,
//                                     child: Column(
//                                       children: [
//                                         Expanded(
//                                           child: TextFormField(
//                                             validator: (value) {
//                                               if(value!.isEmpty){
//                                                 return 'Lütfen alanı boş geçmeyiniz';
//                                               }
//                                             },
//                                             onChanged: (value) => email = value,
//                                             decoration: kTextFormFieldDecoration.copyWith(
//                                               labelText: 'Email*',
//                                               prefixIcon: const Align(
//                                                 widthFactor: 1.0,
//                                                 heightFactor: 1.0,
//                                                 child: Icon(Icons.mail),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: TextFormField(
//                                             validator: (value) {
//                                               if(value!.isEmpty){
//                                                 return 'Lütfen alanı boş geçmeyiniz';
//                                               }
//                                             },
//                                             onChanged: (value) => password = value,
//                                             obscureText: true,
//                                             decoration: kTextFormFieldDecoration.copyWith(
//                                               labelText: 'Şifre*',
//                                               prefixIcon: const Align(
//                                                 widthFactor: 1.0,
//                                                 heightFactor: 1.0,
//                                                 child: Icon(Icons.password),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: TextFormField(
//                                             validator: (value) {
//                                               if(value!.isEmpty){
//                                                 return 'Lütfen alanı boş geçmeyiniz';
//                                               }
//
//                                               if(value != password){
//                                                 return 'Girilen şifreler aynı olmalıdır';
//                                               }
//                                             },
//                                             obscureText: true,
//                                             decoration: kTextFormFieldDecoration.copyWith(
//                                               labelText: 'Şifre tekrar*',
//                                               prefixIcon: const Align(
//                                                 widthFactor: 1.0,
//                                                 heightFactor: 1.0,
//                                                 child: Icon(Icons.password),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 CustomElevatedButton(
//                                   onPressed: (){
//                                     print(email);
//                                     print(password);
//                                     if(_formKey.currentState!.validate()){
//                                       context.read<AuthBloc>().add(RegisterUser(email: email, password: password));
//                                     }
//                                   },
//                                   buttonText: 'Kayıt Ol',
//                                 ),
//                               ],
//                             )
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//           }
//
//           if(state is AuthSuccesfull){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
//           }
//
//           if(state is AuthError){
//
//           }
//
//           return Container();
//         },
//       ),
//     );
//   }
// }
