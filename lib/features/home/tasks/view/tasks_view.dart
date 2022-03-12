import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../core/components/skeleton/skeleton_card.dart';
import '../../../../core/components/text/primary_color_text.dart';
import '../../../../core/components/text/subtitle1_text.dart';
import '../../taskdetail/view/task_detail_view.dart';
import 'add_task_view.dart';
import '../../../../products/components/appbar/special_appbar.dart';
import '../../../../products/components/button/special_button.dart';
import '../../../../core/extensions/hex_color_extensions.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../core/utils/app_validators.dart';
import '../viewmodel/task_view_model.dart';

class TasksView extends StatelessWidget {
  final String token;
  AppValidators get appValidator => AppValidators.instance;

  const TasksView({Key? key, required this.token}) : super(key: key);

  void _goToAddTaskPage(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AddTaskView(token: token),
        ),
      );

  void _deleteOperation(
      TasksViewModel viewModel, BuildContext context, int index) {
    viewModel.showAlertDialog(
      context,
      "Are you sure you want to delete the task?",
      () async {
        await viewModel.deleteTask(token, viewModel.items[index].id ?? "");
        NavigationService.pop();
      },
      FlipInY(
        child: SpecialButton(
          context: context,
          data: "Cancel",
          backgroundColor: context.red,
          onTap: () => NavigationService.pop(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => BaseView<TasksViewModel>(
        viewModel: TasksViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
          model.fetchAllTasks(token);
        },
        onPageBuilder: (BuildContext context, TasksViewModel viewModel) =>
            Scaffold(
          appBar: SpecialAppBar(
            context: context,
            title: "My Tasks",
            centerTitle: false,
            automaticallyImplyLeading: false,
            actions: [_addTaskButton(context)],
          ),
          body: viewModel.isLoad
              ? viewModel.items.isEmpty
                  ? _emptyTodoBody(context)
                  : _items(context, viewModel)
              : _skeletonList(context),
        ),
      );

  FadeInDownBig _addTaskButton(BuildContext context) => FadeInDownBig(
        child: Padding(
          padding: context.paddingLow,
          child: SpecialButton(
            context: context,
            backgroundColor: context.blueChalk,
            clickColor: context.royalPurple,
            child: _buttonContent(context),
            onTap: () => _goToAddTaskPage(context),
          ),
        ),
      );

  Wrap _buttonContent(BuildContext context) => Wrap(
        spacing: context.lowValue,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: context.royalPurple,
          ),
          PurpleBoldText(data: "Add todo", context: context)
        ],
      );

  FadeInUpBig _skeletonList(BuildContext context) => FadeInUpBig(
        child: ListView.separated(
          padding: context.paddingNormal,
          itemBuilder: (context, index) => SkeletonCard(context: context),
          separatorBuilder: (context, index) =>
              context.emptySizedHeightBoxLow3x,
          itemCount: 5,
        ),
      );

  Widget _emptyTodoBody(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _emptyTodoIcon(context),
            context.emptySizedHeightBoxLow,
            _emptyTodoTitle(context)
          ],
        ),
      );

  Icon _emptyTodoIcon(BuildContext context) => Icon(
        Icons.assignment,
        color: context.royalPurple,
        size: 50.0,
      );

  Widget _emptyTodoTitle(BuildContext context) => Subtitle1Text(
        data: "You don't have a task yet.\n"
            "Just add it from the top right!",
        context: context,
        color: context.royalPurple,
        textAlign: TextAlign.center,
      );

  Widget _items(BuildContext context, TasksViewModel viewModel) =>
      Consumer<TasksViewModel>(
        builder: (BuildContext context, viewModel, child) => ListView.separated(
          padding: context.paddingNormal,
          itemBuilder: (context, index) => _slidable(context, viewModel, index),
          separatorBuilder: (context, index) =>
              context.emptySizedHeightBoxLow3x,
          itemCount: viewModel.items.length,
        ),
      );

  Widget _slidable(BuildContext context, TasksViewModel viewModel, int index) =>
      Slidable(
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) =>
                    _deleteOperation(viewModel, context, index),
                backgroundColor: context.red,
                foregroundColor: context.secondaryBackground,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: context.primaryColor,
                foregroundColor: context.secondaryBackground,
                icon: Icons.update,
                label: 'Update',
              ),
            ],
          ),
          child: _cardItem(context, viewModel, index));

  Widget _cardItem(BuildContext context, TasksViewModel viewModel, int index) =>
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: context.highBorderRadius,
        ),
        color: HexColorExtension.fromHex(viewModel.items[index].color!),
        elevation: 3,
        child: _listTileItem(context, viewModel, index),
      );

  ListTile _listTileItem(
          BuildContext context, TasksViewModel viewModel, int index) =>
      ListTile(
        leading: _leading(context),
        title: Text(viewModel.items[index].title ?? "NULL_TITLE"),
        subtitle: Text(viewModel.items[index].date ?? "NULL_DATE"),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TaskDetailView(
              model: viewModel.items[index],
            ),
          ),
        ),
      );

  CircleAvatar _leading(BuildContext context) => CircleAvatar(
        backgroundColor: context.royalPurple,
        child: Icon(
          Icons.content_paste,
          color: context.blueChalk,
        ),
      );
}
