// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bplan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BPlan _$BPlanFromJson(Map<String, dynamic> json) => BPlan(
      title: json['title'] as String,
      content: json['content'] as String,
      version: json['version'] as int,
    );

Map<String, dynamic> _$BPlanToJson(BPlan instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'version': instance.version,
    };
