import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../products/components/appbar/special_appbar.dart';
import '../viewmodel/done_tasks_view_model.dart';

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
        appBar: SpecialAppBar(
          context: context,
          title: "Done Tasks",
          automaticallyImplyLeading: false,
        ),
      ),
    );
  }
}
