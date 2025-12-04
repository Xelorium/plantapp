// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent()';
}


}

/// @nodoc
class $OnboardingEventCopyWith<$Res>  {
$OnboardingEventCopyWith(OnboardingEvent _, $Res Function(OnboardingEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingEvent].
extension OnboardingEventPatterns on OnboardingEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GoToNextPage value)?  goToNextPage,TResult Function( _GoToPage value)?  goToPage,TResult Function( _OnboardingPageChanged value)?  onboardingPageChanged,TResult Function( _SelectSubscriptionPlan value)?  selectSubscriptionPlan,TResult Function( _CompleteOnboarding value)?  completeOnboarding,TResult Function( _GoToPaywall value)?  goToPaywall,TResult Function( _ClosePaywall value)?  closePaywall,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoToNextPage() when goToNextPage != null:
return goToNextPage(_that);case _GoToPage() when goToPage != null:
return goToPage(_that);case _OnboardingPageChanged() when onboardingPageChanged != null:
return onboardingPageChanged(_that);case _SelectSubscriptionPlan() when selectSubscriptionPlan != null:
return selectSubscriptionPlan(_that);case _CompleteOnboarding() when completeOnboarding != null:
return completeOnboarding(_that);case _GoToPaywall() when goToPaywall != null:
return goToPaywall(_that);case _ClosePaywall() when closePaywall != null:
return closePaywall(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GoToNextPage value)  goToNextPage,required TResult Function( _GoToPage value)  goToPage,required TResult Function( _OnboardingPageChanged value)  onboardingPageChanged,required TResult Function( _SelectSubscriptionPlan value)  selectSubscriptionPlan,required TResult Function( _CompleteOnboarding value)  completeOnboarding,required TResult Function( _GoToPaywall value)  goToPaywall,required TResult Function( _ClosePaywall value)  closePaywall,}){
final _that = this;
switch (_that) {
case _GoToNextPage():
return goToNextPage(_that);case _GoToPage():
return goToPage(_that);case _OnboardingPageChanged():
return onboardingPageChanged(_that);case _SelectSubscriptionPlan():
return selectSubscriptionPlan(_that);case _CompleteOnboarding():
return completeOnboarding(_that);case _GoToPaywall():
return goToPaywall(_that);case _ClosePaywall():
return closePaywall(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GoToNextPage value)?  goToNextPage,TResult? Function( _GoToPage value)?  goToPage,TResult? Function( _OnboardingPageChanged value)?  onboardingPageChanged,TResult? Function( _SelectSubscriptionPlan value)?  selectSubscriptionPlan,TResult? Function( _CompleteOnboarding value)?  completeOnboarding,TResult? Function( _GoToPaywall value)?  goToPaywall,TResult? Function( _ClosePaywall value)?  closePaywall,}){
final _that = this;
switch (_that) {
case _GoToNextPage() when goToNextPage != null:
return goToNextPage(_that);case _GoToPage() when goToPage != null:
return goToPage(_that);case _OnboardingPageChanged() when onboardingPageChanged != null:
return onboardingPageChanged(_that);case _SelectSubscriptionPlan() when selectSubscriptionPlan != null:
return selectSubscriptionPlan(_that);case _CompleteOnboarding() when completeOnboarding != null:
return completeOnboarding(_that);case _GoToPaywall() when goToPaywall != null:
return goToPaywall(_that);case _ClosePaywall() when closePaywall != null:
return closePaywall(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  goToNextPage,TResult Function( int pageIndex)?  goToPage,TResult Function( int pageIndex)?  onboardingPageChanged,TResult Function( String planId)?  selectSubscriptionPlan,TResult Function()?  completeOnboarding,TResult Function()?  goToPaywall,TResult Function()?  closePaywall,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoToNextPage() when goToNextPage != null:
return goToNextPage();case _GoToPage() when goToPage != null:
return goToPage(_that.pageIndex);case _OnboardingPageChanged() when onboardingPageChanged != null:
return onboardingPageChanged(_that.pageIndex);case _SelectSubscriptionPlan() when selectSubscriptionPlan != null:
return selectSubscriptionPlan(_that.planId);case _CompleteOnboarding() when completeOnboarding != null:
return completeOnboarding();case _GoToPaywall() when goToPaywall != null:
return goToPaywall();case _ClosePaywall() when closePaywall != null:
return closePaywall();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  goToNextPage,required TResult Function( int pageIndex)  goToPage,required TResult Function( int pageIndex)  onboardingPageChanged,required TResult Function( String planId)  selectSubscriptionPlan,required TResult Function()  completeOnboarding,required TResult Function()  goToPaywall,required TResult Function()  closePaywall,}) {final _that = this;
switch (_that) {
case _GoToNextPage():
return goToNextPage();case _GoToPage():
return goToPage(_that.pageIndex);case _OnboardingPageChanged():
return onboardingPageChanged(_that.pageIndex);case _SelectSubscriptionPlan():
return selectSubscriptionPlan(_that.planId);case _CompleteOnboarding():
return completeOnboarding();case _GoToPaywall():
return goToPaywall();case _ClosePaywall():
return closePaywall();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  goToNextPage,TResult? Function( int pageIndex)?  goToPage,TResult? Function( int pageIndex)?  onboardingPageChanged,TResult? Function( String planId)?  selectSubscriptionPlan,TResult? Function()?  completeOnboarding,TResult? Function()?  goToPaywall,TResult? Function()?  closePaywall,}) {final _that = this;
switch (_that) {
case _GoToNextPage() when goToNextPage != null:
return goToNextPage();case _GoToPage() when goToPage != null:
return goToPage(_that.pageIndex);case _OnboardingPageChanged() when onboardingPageChanged != null:
return onboardingPageChanged(_that.pageIndex);case _SelectSubscriptionPlan() when selectSubscriptionPlan != null:
return selectSubscriptionPlan(_that.planId);case _CompleteOnboarding() when completeOnboarding != null:
return completeOnboarding();case _GoToPaywall() when goToPaywall != null:
return goToPaywall();case _ClosePaywall() when closePaywall != null:
return closePaywall();case _:
  return null;

}
}

}

/// @nodoc


class _GoToNextPage implements OnboardingEvent {
  const _GoToNextPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToNextPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.goToNextPage()';
}


}




/// @nodoc


class _GoToPage implements OnboardingEvent {
  const _GoToPage(this.pageIndex);
  

 final  int pageIndex;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoToPageCopyWith<_GoToPage> get copyWith => __$GoToPageCopyWithImpl<_GoToPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToPage&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex));
}


@override
int get hashCode => Object.hash(runtimeType,pageIndex);

@override
String toString() {
  return 'OnboardingEvent.goToPage(pageIndex: $pageIndex)';
}


}

/// @nodoc
abstract mixin class _$GoToPageCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$GoToPageCopyWith(_GoToPage value, $Res Function(_GoToPage) _then) = __$GoToPageCopyWithImpl;
@useResult
$Res call({
 int pageIndex
});




}
/// @nodoc
class __$GoToPageCopyWithImpl<$Res>
    implements _$GoToPageCopyWith<$Res> {
  __$GoToPageCopyWithImpl(this._self, this._then);

  final _GoToPage _self;
  final $Res Function(_GoToPage) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pageIndex = null,}) {
  return _then(_GoToPage(
null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _OnboardingPageChanged implements OnboardingEvent {
  const _OnboardingPageChanged(this.pageIndex);
  

 final  int pageIndex;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingPageChangedCopyWith<_OnboardingPageChanged> get copyWith => __$OnboardingPageChangedCopyWithImpl<_OnboardingPageChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingPageChanged&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex));
}


@override
int get hashCode => Object.hash(runtimeType,pageIndex);

@override
String toString() {
  return 'OnboardingEvent.onboardingPageChanged(pageIndex: $pageIndex)';
}


}

/// @nodoc
abstract mixin class _$OnboardingPageChangedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$OnboardingPageChangedCopyWith(_OnboardingPageChanged value, $Res Function(_OnboardingPageChanged) _then) = __$OnboardingPageChangedCopyWithImpl;
@useResult
$Res call({
 int pageIndex
});




}
/// @nodoc
class __$OnboardingPageChangedCopyWithImpl<$Res>
    implements _$OnboardingPageChangedCopyWith<$Res> {
  __$OnboardingPageChangedCopyWithImpl(this._self, this._then);

  final _OnboardingPageChanged _self;
  final $Res Function(_OnboardingPageChanged) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pageIndex = null,}) {
  return _then(_OnboardingPageChanged(
null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SelectSubscriptionPlan implements OnboardingEvent {
  const _SelectSubscriptionPlan(this.planId);
  

 final  String planId;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectSubscriptionPlanCopyWith<_SelectSubscriptionPlan> get copyWith => __$SelectSubscriptionPlanCopyWithImpl<_SelectSubscriptionPlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectSubscriptionPlan&&(identical(other.planId, planId) || other.planId == planId));
}


@override
int get hashCode => Object.hash(runtimeType,planId);

@override
String toString() {
  return 'OnboardingEvent.selectSubscriptionPlan(planId: $planId)';
}


}

/// @nodoc
abstract mixin class _$SelectSubscriptionPlanCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$SelectSubscriptionPlanCopyWith(_SelectSubscriptionPlan value, $Res Function(_SelectSubscriptionPlan) _then) = __$SelectSubscriptionPlanCopyWithImpl;
@useResult
$Res call({
 String planId
});




}
/// @nodoc
class __$SelectSubscriptionPlanCopyWithImpl<$Res>
    implements _$SelectSubscriptionPlanCopyWith<$Res> {
  __$SelectSubscriptionPlanCopyWithImpl(this._self, this._then);

  final _SelectSubscriptionPlan _self;
  final $Res Function(_SelectSubscriptionPlan) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? planId = null,}) {
  return _then(_SelectSubscriptionPlan(
null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CompleteOnboarding implements OnboardingEvent {
  const _CompleteOnboarding();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompleteOnboarding);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.completeOnboarding()';
}


}




/// @nodoc


class _GoToPaywall implements OnboardingEvent {
  const _GoToPaywall();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToPaywall);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.goToPaywall()';
}


}




/// @nodoc


class _ClosePaywall implements OnboardingEvent {
  const _ClosePaywall();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClosePaywall);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.closePaywall()';
}


}




/// @nodoc
mixin _$OnboardingState {

 int get currentScreenIndex; int get onboardingPageIndex; String get selectedSubscriptionPlanId; bool get isOnboardingCompleted; bool get isLoading; String? get error;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.currentScreenIndex, currentScreenIndex) || other.currentScreenIndex == currentScreenIndex)&&(identical(other.onboardingPageIndex, onboardingPageIndex) || other.onboardingPageIndex == onboardingPageIndex)&&(identical(other.selectedSubscriptionPlanId, selectedSubscriptionPlanId) || other.selectedSubscriptionPlanId == selectedSubscriptionPlanId)&&(identical(other.isOnboardingCompleted, isOnboardingCompleted) || other.isOnboardingCompleted == isOnboardingCompleted)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,currentScreenIndex,onboardingPageIndex,selectedSubscriptionPlanId,isOnboardingCompleted,isLoading,error);

@override
String toString() {
  return 'OnboardingState(currentScreenIndex: $currentScreenIndex, onboardingPageIndex: $onboardingPageIndex, selectedSubscriptionPlanId: $selectedSubscriptionPlanId, isOnboardingCompleted: $isOnboardingCompleted, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 int currentScreenIndex, int onboardingPageIndex, String selectedSubscriptionPlanId, bool isOnboardingCompleted, bool isLoading, String? error
});




}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentScreenIndex = null,Object? onboardingPageIndex = null,Object? selectedSubscriptionPlanId = null,Object? isOnboardingCompleted = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
currentScreenIndex: null == currentScreenIndex ? _self.currentScreenIndex : currentScreenIndex // ignore: cast_nullable_to_non_nullable
as int,onboardingPageIndex: null == onboardingPageIndex ? _self.onboardingPageIndex : onboardingPageIndex // ignore: cast_nullable_to_non_nullable
as int,selectedSubscriptionPlanId: null == selectedSubscriptionPlanId ? _self.selectedSubscriptionPlanId : selectedSubscriptionPlanId // ignore: cast_nullable_to_non_nullable
as String,isOnboardingCompleted: null == isOnboardingCompleted ? _self.isOnboardingCompleted : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentScreenIndex,  int onboardingPageIndex,  String selectedSubscriptionPlanId,  bool isOnboardingCompleted,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.currentScreenIndex,_that.onboardingPageIndex,_that.selectedSubscriptionPlanId,_that.isOnboardingCompleted,_that.isLoading,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentScreenIndex,  int onboardingPageIndex,  String selectedSubscriptionPlanId,  bool isOnboardingCompleted,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.currentScreenIndex,_that.onboardingPageIndex,_that.selectedSubscriptionPlanId,_that.isOnboardingCompleted,_that.isLoading,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentScreenIndex,  int onboardingPageIndex,  String selectedSubscriptionPlanId,  bool isOnboardingCompleted,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.currentScreenIndex,_that.onboardingPageIndex,_that.selectedSubscriptionPlanId,_that.isOnboardingCompleted,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingState implements OnboardingState {
  const _OnboardingState({this.currentScreenIndex = 0, this.onboardingPageIndex = 0, this.selectedSubscriptionPlanId = 'yearly', this.isOnboardingCompleted = false, this.isLoading = false, this.error});
  

@override@JsonKey() final  int currentScreenIndex;
@override@JsonKey() final  int onboardingPageIndex;
@override@JsonKey() final  String selectedSubscriptionPlanId;
@override@JsonKey() final  bool isOnboardingCompleted;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.currentScreenIndex, currentScreenIndex) || other.currentScreenIndex == currentScreenIndex)&&(identical(other.onboardingPageIndex, onboardingPageIndex) || other.onboardingPageIndex == onboardingPageIndex)&&(identical(other.selectedSubscriptionPlanId, selectedSubscriptionPlanId) || other.selectedSubscriptionPlanId == selectedSubscriptionPlanId)&&(identical(other.isOnboardingCompleted, isOnboardingCompleted) || other.isOnboardingCompleted == isOnboardingCompleted)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,currentScreenIndex,onboardingPageIndex,selectedSubscriptionPlanId,isOnboardingCompleted,isLoading,error);

@override
String toString() {
  return 'OnboardingState(currentScreenIndex: $currentScreenIndex, onboardingPageIndex: $onboardingPageIndex, selectedSubscriptionPlanId: $selectedSubscriptionPlanId, isOnboardingCompleted: $isOnboardingCompleted, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 int currentScreenIndex, int onboardingPageIndex, String selectedSubscriptionPlanId, bool isOnboardingCompleted, bool isLoading, String? error
});




}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentScreenIndex = null,Object? onboardingPageIndex = null,Object? selectedSubscriptionPlanId = null,Object? isOnboardingCompleted = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_OnboardingState(
currentScreenIndex: null == currentScreenIndex ? _self.currentScreenIndex : currentScreenIndex // ignore: cast_nullable_to_non_nullable
as int,onboardingPageIndex: null == onboardingPageIndex ? _self.onboardingPageIndex : onboardingPageIndex // ignore: cast_nullable_to_non_nullable
as int,selectedSubscriptionPlanId: null == selectedSubscriptionPlanId ? _self.selectedSubscriptionPlanId : selectedSubscriptionPlanId // ignore: cast_nullable_to_non_nullable
as String,isOnboardingCompleted: null == isOnboardingCompleted ? _self.isOnboardingCompleted : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
