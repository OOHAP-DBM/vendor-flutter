import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/add_hoarding/second_hoarding_page/ifsc_finder_bloc/ifsc_finder_event.dart';

import 'ifsc_finder_state.dart';

class IFSCFinderBloc extends Bloc<IFSCFinderEvent, IFSCFinderState> {
  IFSCFinderBloc() : super(IFSCFinderInitialState()) {
    on<DropdownSelectionChanged>((event, emit) {
      if (event.bank != null &&
          event.state != null &&
          event.city != null &&
          event.branch != null) {
        emit(IFSCFinderValidState());
      } else {
        emit(IFSCFinderInitialState());
      }
    });
  }
}
