import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'numbering_game_event.dart';
part 'numbering_game_state.dart';

class NumberingGameBloc extends Bloc<NumberingGameEvent, NumberingGameState> {
  NumberingGameBloc() : super(NumberingGameInitial()) {
    on<NumberingGameEvent>((event, emit) {});
  }
}
