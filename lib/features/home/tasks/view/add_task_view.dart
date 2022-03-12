// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/core/base/view/base_view.dart';
import 'package:todo_task/core/extensions/app_extensions.dart';
import 'package:todo_task/features/home/tasks/viewmodel/task_view_model.dart';
import 'package:todo_task/products/components/appbar/special_appbar.dart';

import '../../../../core/components/textformfield/bordered_text_form_field.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../products/components/button/special_button.dart';

class AddTaskView extends StatelessWidget {
  var titleController = TextEditingController();
  var iconController = TextEditingController();
  var colorController = TextEditingController();
  final String token;
  AddTaskView({Key? key, required this.token}) : super(key: key);

  Future<void> _addTask(
    BuildContext context,
    TasksViewModel viewModel,
    String title,
    String icon,
    String color,
  ) async {
    color = viewModel.appValidator.colorCheck(color);
    debugPrint("Color Hex Code: $color");
    await viewModel.addTask(token, title, false, icon, color);
    ScaffoldMessenger.of(context)
        .showSnackBar(viewModel.defaultSnackbar("Task successfully added !"));
    NavigationService.pop();
  }

  @override
  Widget build(BuildContext context) => BaseView<TasksViewModel>(
        viewModel: TasksViewModel(),
        onModelReady: (model) {
          model.init();
          model.setContext(context);
        },
        onPageBuilder: (BuildContext context, TasksViewModel viewModel) =>
            Scaffold(
          appBar: _appBar(context),
          body: _body(
            context,
            titleController,
            iconController,
            colorController,
            viewModel,
          ),
        ),
      );

  SpecialAppBar _appBar(BuildContext context) => SpecialAppBar(
        context: context,
        title: "Add Task",
        centerTitle: false,
        iconThemeColor: context.textColor,
      );

  FadeInUpBig _body(
    BuildContext context,
    TextEditingController titleController,
    TextEditingController iconController,
    TextEditingController colorController,
    TasksViewModel viewModel,
  ) =>
      FadeInUpBig(
        child: ListView(
          padding: context.paddingNormal,
          physics: const BouncingScrollPhysics(),
          children: [
            context.emptySizedHeightBoxLow3x,
            _titleField(titleController, context),
            context.emptySizedHeightBoxLow3x,
            _iconField(iconController, context),
            context.emptySizedHeightBoxLow3x,
            _colorField(colorController, context),
            context.emptySizedHeightBoxNormal,
            _addTaskButton(context, viewModel, titleController, iconController,
                colorController)
          ],
        ),
      );

  BorderedTextFormField _titleField(
          TextEditingController titleController, BuildContext context) =>
      BorderedTextFormField(
        controller: titleController,
        context: context,
        hintText: "Enter todo title.",
        labelText: "Todo title",
        prefixIcon: Icons.text_snippet_rounded,
        filled: true,
      );

  BorderedTextFormField _iconField(
          TextEditingController iconController, BuildContext context) =>
      BorderedTextFormField(
        controller: iconController,
        context: context,
        hintText: "Enter icon number.",
        labelText: "Icon number",
        prefixIcon: Icons.content_paste,
        filled: true,
      );

  BorderedTextFormField _colorField(
          TextEditingController colorController, BuildContext context) =>
      BorderedTextFormField(
        controller: colorController,
        context: context,
        hintText: "Enter color code (hex).",
        labelText: "Color",
        prefixIcon: Icons.color_lens,
        filled: true,
      );

  SpecialButton _addTaskButton(
    BuildContext context,
    TasksViewModel viewModel,
    TextEditingController titleController,
    TextEditingController iconController,
    TextEditingController colorController,
  ) =>
      SpecialButton(
        context: context,
        data: "Ok",
        onTap: () => _addTask(context, viewModel, titleController.text,
            iconController.text, colorController.text),
      );
}
