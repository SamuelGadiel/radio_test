import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_test/blocs/select_plan_bloc/events/select_plan_event.dart';
import 'package:radio_test/blocs/select_plan_bloc/states/select_plan_states.dart';
import 'package:radio_test/data/plan.dart';

import 'blocs/select_plan_bloc/select_plan_bloc.dart';

class PlanCard extends StatelessWidget {
  final Plan plan;
  final SelectPlanBloc bloc;

  const PlanCard(this.plan, this.bloc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bloc.add(SelectPlanEvent(plan));
      },
      child: BlocBuilder<SelectPlanBloc, SelectPlanStates>(
        bloc: bloc,
        builder: (context, state) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(color: bloc.selectedPlan == plan ? Theme.of(context).primaryColor : Colors.transparent),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Radio<Plan>(
                    value: plan,
                    activeColor: Theme.of(context).primaryColor,
                    groupValue: bloc.selectedPlan,
                    onChanged: (planToSelect) {
                      if (planToSelect != null) {
                        bloc.add(SelectPlanEvent(planToSelect));
                      }
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(plan.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'R\$${(double.tryParse(plan.price.replaceAll(',', '.'))?.toStringAsFixed(2) ?? '0,00').replaceAll('.', ',')}',
                          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
