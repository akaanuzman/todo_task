import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/core/base/view/base_view.dart';
import 'package:todo_task/features/home/donetasks/viewmodel/done_tasks_view_model.dart';

import '../../../../core/components/text/headline6_text.dart';

class DoneTasksView extends StatelessWidget {
  const DoneTasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DoneTasksViewModel>(
      viewModel: DoneTasksViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, DoneTasksViewModel viewModel) =>
          Scaffold(
            //TODO: make component
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: FadeInDownBig(
            child: Headline6Text(context: context, data: "Done Tasks"),
          ),
        ),
      ),
    );
  }
}
