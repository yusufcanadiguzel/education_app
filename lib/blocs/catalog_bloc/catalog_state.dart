import 'package:education_app/models/course.dart';

abstract class CatalogState {}

class CatalogInitial extends CatalogState {}

class CatalogLoading extends CatalogState {}

class CatalogLoaded extends CatalogState {
  final List<CoursesCard> coursesInfo;

  CatalogLoaded({required this.coursesInfo});
}

class CatalogError extends CatalogState {}
