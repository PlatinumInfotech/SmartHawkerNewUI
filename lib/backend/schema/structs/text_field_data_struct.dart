// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TextFieldDataStruct extends BaseStruct {
  TextFieldDataStruct({
    String? id,
    String? textFieldValue,
    String? textFieldName,
  })  : _id = id,
        _textFieldValue = textFieldValue,
        _textFieldName = textFieldName;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "textFieldValue" field.
  String? _textFieldValue;
  String get textFieldValue => _textFieldValue ?? '';
  set textFieldValue(String? val) => _textFieldValue = val;

  bool hasTextFieldValue() => _textFieldValue != null;

  // "textFieldName" field.
  String? _textFieldName;
  String get textFieldName => _textFieldName ?? '';
  set textFieldName(String? val) => _textFieldName = val;

  bool hasTextFieldName() => _textFieldName != null;

  static TextFieldDataStruct fromMap(Map<String, dynamic> data) =>
      TextFieldDataStruct(
        id: data['id'] as String?,
        textFieldValue: data['textFieldValue'] as String?,
        textFieldName: data['textFieldName'] as String?,
      );

  static TextFieldDataStruct? maybeFromMap(dynamic data) => data is Map
      ? TextFieldDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'textFieldValue': _textFieldValue,
        'textFieldName': _textFieldName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'textFieldValue': serializeParam(
          _textFieldValue,
          ParamType.String,
        ),
        'textFieldName': serializeParam(
          _textFieldName,
          ParamType.String,
        ),
      }.withoutNulls;

  static TextFieldDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      TextFieldDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        textFieldValue: deserializeParam(
          data['textFieldValue'],
          ParamType.String,
          false,
        ),
        textFieldName: deserializeParam(
          data['textFieldName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TextFieldDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TextFieldDataStruct &&
        id == other.id &&
        textFieldValue == other.textFieldValue &&
        textFieldName == other.textFieldName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, textFieldValue, textFieldName]);
}

TextFieldDataStruct createTextFieldDataStruct({
  String? id,
  String? textFieldValue,
  String? textFieldName,
}) =>
    TextFieldDataStruct(
      id: id,
      textFieldValue: textFieldValue,
      textFieldName: textFieldName,
    );
