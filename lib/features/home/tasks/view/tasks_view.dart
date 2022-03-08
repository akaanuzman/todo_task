import 'package:flutter/material.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/headline6_text.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../viewmodel/task_view_model.dart';

class TasksView extends StatelessWidget {
  static const path = '/tasks';
  const TasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<TasksViewModel>(
        viewModel: TasksViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, TasksViewModel viewModel) =>
            Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.emptySizedHeightBoxHigh,
              Padding(
                padding: context.horizontalPaddingNormal,
                child: Headline6Text(context: context, data: "Tasks"),
              ),
              Expanded(
                child: ListView.builder(
                  padding: context.paddingNormal,
                  itemBuilder: (context, index) => Card(
                    color: viewModel.isDone
                        ? Colors.green[100]
                        : context.blueChalk,
                    child: CheckboxListTile(
                      value: viewModel.isDone,
                      onChanged: (value) => viewModel.doneTask(),
                    ),
                  ),
                ),
              ),
              context.emptySizedHeightBoxNormal,
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      );
}
