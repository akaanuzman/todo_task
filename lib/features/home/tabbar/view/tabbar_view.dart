import 'package:flutter/material.dart';
import 'package:todo_task/features/home/tasks/view/tasks_view.dart';

import '../../../../core/extensions/app_extensions.dart';
import '../model/tabbar_model.dart';

class TabbarView extends StatelessWidget {
  final String token;
  const TabbarView({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TabbarModel> _tabItems = [
      TabbarModel(icon: Icons.assignment, child: TasksView(token: token)),
      TabbarModel(icon: Icons.task_alt, child: const Scaffold()),
      TabbarModel(icon: Icons.notifications, child: const Scaffold()),
    ];
    return DefaultTabController(
      length: _tabItems.length,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: _buildTabBar(context, _tabItems),
        ),
        body: _buildTabBarView(_tabItems),
      ),
    );
  }





  Widget _buildTabBar(BuildContext context, List<TabbarModel> _items) =>
      Container(
        padding: EdgeInsets.only(bottom: context.lowValue),
        color: context.blueChalk,
        child: TabBar(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            context.highValue,
            context.lowValue,
            context.highValue,
            0,
          ),
          labelPadding: EdgeInsets.zero,
          unselectedLabelColor: context.textColor,
          labelColor: context.royalPurple,
          indicatorColor: Colors.transparent,
          indicator: BoxDecoration(
              border: Border.all(color: context.royalPurple),
              borderRadius: context.extraLowBorderRadius,
              color: Colors.white),
          indicatorSize: TabBarIndicatorSize.label,
          tabs: _buildTabs(_items, context),
        ),
      );

  List<Widget> _buildTabs(List<TabbarModel> _items, BuildContext context) =>
      List.generate(
        _items.length,
        (index) => Container(
          margin: context.horizontalPaddingLow,
          child: Tab(
            icon: Icon(_items[index].icon),
          ),
        ),
      );

  Widget _buildTabBarView(List<TabbarModel> models) =>
      TabBarView(children: models.map((e) => e.child).toList());
}
