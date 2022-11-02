import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'in_view_event_state.dart';

class InViewDateCubit extends Cubit<DateTime?> {
  InViewDateCubit() : super(null);

  changeDate(DateTime date) {
    if (state != null) {
      if (state!.difference(date).inDays == 0) {
        return;
      }
    }
    emit(date);
  }
}
