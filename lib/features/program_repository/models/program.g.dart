// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Program _$ProgramFromJson(Map<String, dynamic> json) => Program(
      title: json['title'] as String,
      url: json['url'] as String,
      category: json['category'] as String,
      organization: json['organization'] as String,
      subject: json['subject'] as String,
      applyPeriod: json['apply_period'] as String,
      applyMethod: json['apply_method'] as String,
      content: json['content'] as String,
      inquiries: json['inquiries'] as String,
      age: json['age'] as String,
    );

Map<String, dynamic> _$ProgramToJson(Program instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'category': instance.category,
      'organization': instance.organization,
      'subject': instance.subject,
      'apply_period': instance.applyPeriod,
      'apply_method': instance.applyMethod,
      'content': instance.content,
      'inquiries': instance.inquiries,
      'age': instance.age,
    };
