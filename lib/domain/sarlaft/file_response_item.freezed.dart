// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'file_response_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$FileResponseItem {
  File get file;
  int get id;

  FileResponseItem copyWith({File file, int id});
}

class _$FileResponseItemTearOff {
  const _$FileResponseItemTearOff();

  _FileResponseItem call({@required File file, @required int id}) {
    return _FileResponseItem(
      file: file,
      id: id,
    );
  }
}

const $FileResponseItem = _$FileResponseItemTearOff();

class _$_FileResponseItem implements _FileResponseItem {
  const _$_FileResponseItem({@required this.file, @required this.id})
      : assert(file != null),
        assert(id != null);

  @override
  final File file;
  @override
  final int id;

  @override
  String toString() {
    return 'FileResponseItem(file: $file, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FileResponseItem &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(file) ^
      const DeepCollectionEquality().hash(id);

  @override
  _$_FileResponseItem copyWith({
    Object file = freezed,
    Object id = freezed,
  }) {
    return _$_FileResponseItem(
      file: file == freezed ? this.file : file as File,
      id: id == freezed ? this.id : id as int,
    );
  }
}

abstract class _FileResponseItem implements FileResponseItem {
  const factory _FileResponseItem({@required File file, @required int id}) =
      _$_FileResponseItem;

  @override
  File get file;
  @override
  int get id;

  @override
  _FileResponseItem copyWith({File file, int id});
}
