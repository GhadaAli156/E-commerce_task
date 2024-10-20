import 'package:flutter_bloc/flutter_bloc.dart';
import '../database/DatabaseHelper.dart';
import '../model/combo_model.dart';
import '../cubit/combo_state.dart';

class ComboCubit extends Cubit<ComboState> {
  ComboCubit() : super(ComboInitial());

  Future<void> fetchCombos() async {
    try {
      emit(ComboLoading());
      List<Map> fetchedCombos = await DatabaseHelper().getCombo();
      final combos = fetchedCombos.map((combo) => Combo(
        name: combo['name'],
        price: combo['price'],
        image: combo['image'],
      )).toList();
      emit(ComboLoaded(combos));
    } catch (e) {
      emit(const ComboError('Failed to fetch combos'));
    }
  }

  Future<void> insertCombo(String name, String price, String image) async {
    try {
      await DatabaseHelper().insertCombo(name, price, image);
      fetchCombos();
    } catch (e) {
      emit(const ComboError('Failed to insert combo'));
    }
  }
}
