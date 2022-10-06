part of 'button.cubit.dart';

@immutable
abstract class ButtonState {}

// Initial state
class ButtonInitial extends ButtonState {}

class FloatingButtonActive extends ButtonState {}

class FloatingButtonInActive extends ButtonState {}
