import 'package:bloc/bloc.dart';

class CharacterCountCubit extends Cubit<int> {
  CharacterCountCubit() : super(0);

  void updateCharacterCount(int count) {
    emit(count);
  }
}
