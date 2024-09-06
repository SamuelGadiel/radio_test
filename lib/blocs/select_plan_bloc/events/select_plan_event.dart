import 'package:radio_test/blocs/select_plan_bloc/events/select_plan_events.dart';
import 'package:radio_test/data/plan.dart';

class SelectPlanEvent implements SelectPlanEvents {
  final Plan planToSelect;

  SelectPlanEvent(this.planToSelect);
}
