import 'package:json_annotation/json_annotation.dart';
import 'package:noteapp/data/note_model/note_model.dart';

part 'get_allresp_model.g.dart';

@JsonSerializable()
class GetAllrespModel {
  @JsonKey(name: 'data')
  List<NoteModel> data;

  GetAllrespModel({this.data = const []});

  factory GetAllrespModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllrespModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllrespModelToJson(this);
}
