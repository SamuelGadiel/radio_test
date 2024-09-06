import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_test/blocs/select_plan_bloc/events/select_plan_events.dart';
import 'package:radio_test/blocs/select_plan_bloc/states/select_plan_initial_state.dart';
import 'package:radio_test/blocs/select_plan_bloc/states/select_plan_loading_state.dart';
import 'package:radio_test/blocs/select_plan_bloc/states/select_plan_states.dart';
import 'package:radio_test/blocs/select_plan_bloc/states/select_plan_success_state.dart';
import 'package:radio_test/data/plan.dart';

import 'events/select_plan_event.dart';

class SelectPlanBloc extends Bloc<SelectPlanEvents, SelectPlanStates> {
  SelectPlanBloc() : super(const SelectPlanInitialState()) {
    on<SelectPlanEvent>(mapSelectPlanEventToState);
  }

  Plan selectedPlan = Plan(title: '', description: '', price: '');

  void mapSelectPlanEventToState(SelectPlanEvent event, Emitter<SelectPlanStates> emit) {
    emit(const SelectPlanLoadingState());

    selectedPlan = event.planToSelect;

    emit(const SelectPlanSuccessState());
  }
}
