import 'package:flutter/material.dart';
import 'package:radio_test/data/plans_data.dart';
import 'package:radio_test/plan_card.dart';

import 'blocs/select_plan_bloc/select_plan_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final SelectPlanBloc bloc = SelectPlanBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Example'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 24),
        itemCount: plansData.plans.length,
        itemBuilder: (context, index) {
          return PlanCard(plansData.plans[index], bloc);
        },
      ),
    );
  }
}
