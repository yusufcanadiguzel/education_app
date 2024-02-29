import 'package:education_app/models/course.dart';

abstract class CatalogEvent {}

class AddCatalog extends CatalogEvent {}

class RemoveCatalog extends CatalogEvent {}

class UpdateCatalog extends CatalogEvent {}

class GetCatalogs extends CatalogEvent {}
