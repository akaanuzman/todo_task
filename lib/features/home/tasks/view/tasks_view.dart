import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_task/core/components/text/primary_color_text.dart';
import 'package:todo_task/core/components/text/subtitle1_text.dart';
import 'package:todo_task/features/home/taskdetail/view/task_detail_view.dart';
import 'package:todo_task/features/home/tasks/view/add_task_view.dart';
import 'package:todo_task/products/components/button/special_button.dart';
import 'package:todo_task/core/extensions/hex_color_extensions.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/headline6_text.dart';
import '../../../../core/components/textformfield/bordered_text_form_field.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../core/utils/app_validators.dart';
import '../viewmodel/task_view_model.dart';

class TasksView extends StatelessWidget {
  final String token;
  AppValidators get appValidator => AppValidators.instance;

  const TasksView({Key? key, required this.token}) : super(key: key);

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
          //TODO: make component
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: FadeInDownBig(
              child: Headline6Text(context: context, data: "My Tasks"),
            ),
            actions: [
              FadeInDownBig(
                child: Padding(
                  padding: context.paddingLow,
                  child: SpecialButton(
                    context: context,
                    backgroundColor: context.blueChalk,
                    clickColor: context.royalPurple,
                    child: Wrap(
                      spacing: context.lowValue,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: context.royalPurple,
                        ),
                        PurpleBoldText(data: "Add todo", context: context)
                      ],
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddTaskView(token: token),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: viewModel.items.isEmpty
              ? _emptyTodoBody(context)
              : _items(context, viewModel),
        ),
      );

  FlipInY _emptyTodoBody(BuildContext context) => FlipInY(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _emptyTodoIcon(context),
              context.emptySizedHeightBoxLow,
              _emptyTodoTitle(context)
            ],
          ),
        ),
      );

  Icon _emptyTodoIcon(BuildContext context) => Icon(
        Icons.assignment,
        color: context.royalPurple,
        size: 50.0,
      );

  Subtitle1Text _emptyTodoTitle(BuildContext context) => Subtitle1Text(
        data: "You don't have a task yet.\n"
            "Just add it from the top right!",
        context: context,
        color: context.royalPurple,
        textAlign: TextAlign.center,
      );

  Widget _items(BuildContext context, TasksViewModel viewModel) => FadeInUpBig(
        child: ListView.separated(
          padding: context.paddingNormal,
          itemBuilder: (context, index) => _cardItem(context, viewModel, index),
          separatorBuilder: (context, index) =>
              context.emptySizedHeightBoxLow3x,
          itemCount: viewModel.items.length,
        ),
      );

  Widget _cardItem(BuildContext context, TasksViewModel viewModel, int index) =>
      Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) async => await viewModel.deleteTask(
                  token, viewModel.items[index].id ?? ""),
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
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: context.orange,
              foregroundColor: context.secondaryBackground,
              icon: Icons.notifications,
              label: 'Reminder',
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: context.highBorderRadius,
          ),
          color: HexColorExtension.fromHex(viewModel.items[index].color!),
          elevation: 3,
          child: _listTileItem(context, viewModel, index),
        ),
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

  void _showModalBottomSheet(BuildContext context, TasksViewModel viewModel) {
    var titleController = TextEditingController();
    var iconController = TextEditingController();
    var colorController = TextEditingController();

    showModalBottomSheet(
      context: context,
      backgroundColor: context.secondaryBackground,
      shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
      builder: (context) => StatefulBuilder(
          builder: (context, StateSetter setState) => _bottomSheetBody(
              context,
              titleController,
              iconController,
              colorController,
              viewModel,
              setState)),
    );
  }

  FadeInUpBig _bottomSheetBody(
          BuildContext context,
          TextEditingController titleController,
          TextEditingController iconController,
          TextEditingController colorController,
          TasksViewModel viewModel,
          StateSetter setState) =>
      FadeInUpBig(
        child: ListView(
          padding: context.paddingNormal,
          physics: const BouncingScrollPhysics(),
          children: [
            context.emptySizedHeightBoxLow2x,
            _downContainer(context),
            context.emptySizedHeightBoxLow3x,
            _titleField(titleController, context),
            context.emptySizedHeightBoxLow3x,
            _iconField(iconController, context),
            context.emptySizedHeightBoxLow3x,
            _colorField(colorController, context),
            context.emptySizedHeightBoxLow3x,
            _buttons(context, viewModel, titleController, iconController,
                colorController, setState)
          ],
        ),
      );

  Center _downContainer(BuildContext context) => Center(
        child: Container(
          height: context.dynamicWidth(0.03),
          width: context.dynamicWidth(0.2),
          decoration: BoxDecoration(
            borderRadius: context.lowBorderRadius,
            color: context.grey,
          ),
        ),
      );

  BorderedTextFormField _titleField(
          TextEditingController titleController, BuildContext context) =>
      BorderedTextFormField(
        controller: titleController,
        context: context,
        hintText: "Todo title",
        prefixIcon: Icons.text_snippet_rounded,
        filled: true,
      );

  BorderedTextFormField _iconField(
          TextEditingController iconController, BuildContext context) =>
      BorderedTextFormField(
        controller: iconController,
        context: context,
        hintText: "Icon number",
        prefixIcon: Icons.content_paste,
        filled: true,
      );

  BorderedTextFormField _colorField(
          TextEditingController colorController, BuildContext context) =>
      BorderedTextFormField(
        controller: colorController,
        context: context,
        hintText: "Color",
        prefixIcon: Icons.color_lens,
        filled: true,
      );

  Align _buttons(
          BuildContext context,
          TasksViewModel viewModel,
          TextEditingController titleController,
          TextEditingController iconController,
          TextEditingController colorController,
          StateSetter setState) =>
      Align(
        alignment: Alignment.bottomRight,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: context.lowValue,
          children: [
            _cancelButton(context),
            _addTaskButton(context, viewModel, titleController, iconController,
                colorController, setState),
          ],
        ),
      );

  SpecialButton _cancelButton(BuildContext context) => SpecialButton(
        context: context,
        data: "Cancel",
        backgroundColor: context.red,
        onTap: () => NavigationService.pop(),
      );

  SpecialButton _addTaskButton(
          BuildContext context,
          TasksViewModel viewModel,
          TextEditingController titleController,
          TextEditingController iconController,
          TextEditingController colorController,
          StateSetter setState) =>
      SpecialButton(
          context: context,
          data: "Ok",
          backgroundColor: context.primaryColor,
          onTap: () async {
        
            
          });
}
