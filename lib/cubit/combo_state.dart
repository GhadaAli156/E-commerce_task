import '../model/combo_model.dart';

abstract class ComboState{
  const ComboState();
}
class ComboInitial extends ComboState {}
class ComboLoading extends ComboState {}
class ComboLoaded extends ComboState {
  final List<Combo> combos;
  const ComboLoaded(this.combos);
}
class ComboError extends ComboState {
  final String error;
  const ComboError(this.error);
}
