import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/headline6_text.dart';
import '../../../../core/components/text/subtitle1_text.dart';
import '../../../../core/components/text/subtitle2_text.dart';
import '../../../../core/extensions/hex_color_extensions.dart';
import '../viewmodel/task_detail_view_model.dart';
import '../../tasks/model/task_model.dart';
import '../../../../core/extensions/app_extensions.dart';

class TaskDetailView extends StatelessWidget {
  final TasksModel model;
  const TaskDetailView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<TaskDetailViewModel>(
        viewModel: TaskDetailViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, TaskDetailViewModel viewModel) =>
            Scaffold(
          appBar: AppBar(
            title: FadeInDownBig(
              child: Headline6Text(context: context, data: "Task Detail"),
            ),
            iconTheme: IconThemeData(color: context.textColor),
          ),
          body: _body(context),
        ),
      );

  FadeInUpBig _body(BuildContext context) => FadeInUpBig(
        child: Center(
          child: Padding(
            padding: context.paddingMedium,
            child: _outSideCard(context),
          ),
        ),
      );

  Card _outSideCard(BuildContext context) => Card(
        color: context.blueChalk,
        shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              context.emptySizedHeightBoxNormal,
              SvgPicture.asset(
                "assets/images/signup.svg",
                height: context.dynamicHeight(0.25),
              ),
              context.emptySizedHeightBoxNormal,
              _insideCard(context),
            ],
          ),
        ),
      );

  Card _insideCard(BuildContext context) => Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
        child: ListTile(
          contentPadding: context.paddingNormal,
          leading: _leading(context),
          title: Subtitle1Text(context: context, data: "${model.title}"),
          subtitle: _subtitle(context),
          trailing: _buttons(context),
        ),
      );

  Padding _leading(BuildContext context) => Padding(
        padding: context.horizontalPaddingLow,
        child: CircleAvatar(
          backgroundColor: HexColorExtension.fromHex(model.color ?? ""),
          radius: 12.5,
        ),
      );

  Subtitle2Text _subtitle(BuildContext context) => Subtitle2Text(
        context: context,
        data: "${model.date}",
        color: context.grey,
      );

  Wrap _buttons(BuildContext context) => Wrap(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.task_alt,
              color: context.green,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: context.orange,
            ),
          ),
        ],
      );
}
