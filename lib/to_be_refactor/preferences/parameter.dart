import 'package:ualet/to_be_refactor/models/generic/table_model.dart';

class Parameter {
  static final Parameter _instance = Parameter._internal();

  factory Parameter() {
    return _instance;
  }

  List<TableModel> _parameter;

  Parameter._internal();
  init() {
    this._parameter = List<TableModel>();
  }

  get parameterAppList {
    return _parameter ?? null;
  }

  set parameterAppList(List<TableModel> value) {
    _parameter = value;
  }
}
