// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Habit _$HabitFromJson(Map<String, dynamic> json) {
  return _Habit.fromJson(json);
}

/// @nodoc
mixin _$Habit {
  String get title => throw _privateConstructorUsedError;
  String get shortTermGoal => throw _privateConstructorUsedError;
  String get longTermGoal => throw _privateConstructorUsedError;
  String get routineDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HabitCopyWith<Habit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) then) =
      _$HabitCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String shortTermGoal,
      String longTermGoal,
      String routineDate});
}

/// @nodoc
class _$HabitCopyWithImpl<$Res> implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._value, this._then);

  final Habit _value;
  // ignore: unused_field
  final $Res Function(Habit) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? shortTermGoal = freezed,
    Object? longTermGoal = freezed,
    Object? routineDate = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      shortTermGoal: shortTermGoal == freezed
          ? _value.shortTermGoal
          : shortTermGoal // ignore: cast_nullable_to_non_nullable
              as String,
      longTermGoal: longTermGoal == freezed
          ? _value.longTermGoal
          : longTermGoal // ignore: cast_nullable_to_non_nullable
              as String,
      routineDate: routineDate == freezed
          ? _value.routineDate
          : routineDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$HabitCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$HabitCopyWith(_Habit value, $Res Function(_Habit) then) =
      __$HabitCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String shortTermGoal,
      String longTermGoal,
      String routineDate});
}

/// @nodoc
class __$HabitCopyWithImpl<$Res> extends _$HabitCopyWithImpl<$Res>
    implements _$HabitCopyWith<$Res> {
  __$HabitCopyWithImpl(_Habit _value, $Res Function(_Habit) _then)
      : super(_value, (v) => _then(v as _Habit));

  @override
  _Habit get _value => super._value as _Habit;

  @override
  $Res call({
    Object? title = freezed,
    Object? shortTermGoal = freezed,
    Object? longTermGoal = freezed,
    Object? routineDate = freezed,
  }) {
    return _then(_Habit(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      shortTermGoal == freezed
          ? _value.shortTermGoal
          : shortTermGoal // ignore: cast_nullable_to_non_nullable
              as String,
      longTermGoal == freezed
          ? _value.longTermGoal
          : longTermGoal // ignore: cast_nullable_to_non_nullable
              as String,
      routineDate == freezed
          ? _value.routineDate
          : routineDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Habit with DiagnosticableTreeMixin implements _Habit {
  const _$_Habit(
      this.title, this.shortTermGoal, this.longTermGoal, this.routineDate);

  factory _$_Habit.fromJson(Map<String, dynamic> json) =>
      _$$_HabitFromJson(json);

  @override
  final String title;
  @override
  final String shortTermGoal;
  @override
  final String longTermGoal;
  @override
  final String routineDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Habit(title: $title, shortTermGoal: $shortTermGoal, longTermGoal: $longTermGoal, routineDate: $routineDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Habit'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('shortTermGoal', shortTermGoal))
      ..add(DiagnosticsProperty('longTermGoal', longTermGoal))
      ..add(DiagnosticsProperty('routineDate', routineDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Habit &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.shortTermGoal, shortTermGoal) &&
            const DeepCollectionEquality()
                .equals(other.longTermGoal, longTermGoal) &&
            const DeepCollectionEquality()
                .equals(other.routineDate, routineDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(shortTermGoal),
      const DeepCollectionEquality().hash(longTermGoal),
      const DeepCollectionEquality().hash(routineDate));

  @JsonKey(ignore: true)
  @override
  _$HabitCopyWith<_Habit> get copyWith =>
      __$HabitCopyWithImpl<_Habit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HabitToJson(this);
  }
}

abstract class _Habit implements Habit {
  const factory _Habit(final String title, final String shortTermGoal,
      final String longTermGoal, final String routineDate) = _$_Habit;

  factory _Habit.fromJson(Map<String, dynamic> json) = _$_Habit.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get shortTermGoal => throw _privateConstructorUsedError;
  @override
  String get longTermGoal => throw _privateConstructorUsedError;
  @override
  String get routineDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HabitCopyWith<_Habit> get copyWith => throw _privateConstructorUsedError;
}
