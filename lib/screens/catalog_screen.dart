import 'dart:developer';
import 'dart:io';

import 'package:education_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:education_app/blocs/catalog_bloc/catalog_event.dart';
import 'package:education_app/blocs/catalog_bloc/catalog_state.dart';
import 'package:education_app/models/course.dart';
import 'package:education_app/repositories/catalog_repository.dart';
import 'package:education_app/screens/catalog_videos.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: const Card(
                    color: Color(0xFF1d3566),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Öğrenmeye başla !',
                          style: TextStyle(
                            // fontFamily: 'DMSerifDisplay', //??
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.all(17.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Eğitim arayın..',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35.0),
                                    topRight: Radius.circular(35),
                                    bottomLeft: Radius.circular(35),
                                    bottomRight: Radius.circular(35)),
                              ),
                              prefixIcon: Icon(Icons.search),
                              hintStyle: TextStyle(color: Colors.white30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D3566),
                      minimumSize: const Size(350, 40),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Filtrele',
                      style: TextStyle(color: Color(0xFF8fccf4)),
                    )),
                BlocBuilder<CatalogBloc, CatalogState>(
                  builder: (context, state) {
                    if (state is CatalogInitial) {
                      context.read<CatalogBloc>().add(GetCatalogs());
                    }
                    if (state is CatalogLoaded) {
                      return ListView.builder(
                          shrinkWrap:
                              true, // Bu satırı ekleyerek ListView'ı sarmalayabiliriz.
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.coursesInfo.length,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CatalogVideos(
                                  courseCard: state.coursesInfo[index],
                                ),
                              ));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox sizedBox() {
    return const SizedBox(
      height: 30,
    );
  }
}
