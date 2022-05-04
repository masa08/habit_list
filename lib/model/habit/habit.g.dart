// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Habit _$$_HabitFromJson(Map<String, dynamic> json) => _$_Habit(
      json['title'] as String,
      json['shortTermGoal'] as String,
      json['longTermGoal'] as String,
      json['routineDate'] as String,
    );

Map<String, dynamic> _$$_HabitToJson(_$_Habit instance) => <String, dynamic>{
      'title': instance.title,
      'shortTermGoal': instance.shortTermGoal,
      'longTermGoal': instance.longTermGoal,
      'routineDate': instance.routineDate,
    };
