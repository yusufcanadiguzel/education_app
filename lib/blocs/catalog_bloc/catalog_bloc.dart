import 'package:education_app/blocs/catalog_bloc/catalog_event.dart';
import 'package:education_app/blocs/catalog_bloc/catalog_state.dart';
import 'package:education_app/repositories/catalog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial()) {
    on<GetCatalogs>((event, emit) async {
      try {
        final coursesCardInfo = await CatalogRepository().getCourseInfo();

        print(coursesCardInfo.courseList);

        emit(CatalogLoaded(coursesInfo: coursesCardInfo.courseList));
      } catch (e) {
        emit(CatalogError());
        print(e);
      }
    });
  }
}
