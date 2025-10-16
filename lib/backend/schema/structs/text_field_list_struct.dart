// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TextFieldListStruct extends BaseStruct {
  TextFieldListStruct({
    int? id,
    List<TextFieldDataStruct>? textField,
  })  : _id = id,
        _textField = textField;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "textField" field.
  List<TextFieldDataStruct>? _textField;
  List<TextFieldDataStruct> get textField => _textField ?? const [];
  set textField(List<TextFieldDataStruct>? val) => _textField = val;

  void updateTextField(Function(List<TextFieldDataStruct>) updateFn) {
    updateFn(_textField ??= []);
  }

  bool hasTextField() => _textField != null;

  static TextFieldListStruct fromMap(Map<String, dynamic> data) =>
      TextFieldListStruct(
        id: castToType<int>(data['id']),
        textField: getStructList(
          data['textField'],
          TextFieldDataStruct.fromMap,
        ),
      );

  static TextFieldListStruct? maybeFromMap(dynamic data) => data is Map
      ? TextFieldListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'textField': _textField?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'textField': serializeParam(
          _textField,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TextFieldListStruct fromSerializableMap(Map<String, dynamic> data) =>
      TextFieldListStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        textField: deserializeStructParam<TextFieldDataStruct>(
          data['textField'],
          ParamType.DataStruct,
          true,
          structBuilder: TextFieldDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TextFieldListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TextFieldListStruct &&
        id == other.id &&
        listEquality.equals(textField, other.textField);
  }

  @override
  int get hashCode => const ListEquality().hash([id, textField]);
}

TextFieldListStruct createTextFieldListStruct({
  int? id,
}) =>
    TextFieldListStruct(
      id: id,
    );
