// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_allresp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllrespModel _$GetAllrespModelFromJson(Map<String, dynamic> json) =>
    GetAllrespModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => NoteModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetAllrespModelToJson(GetAllrespModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
