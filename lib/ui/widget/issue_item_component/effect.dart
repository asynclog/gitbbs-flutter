import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:gitbbs/model/GitIssue.dart';
import 'package:gitbbs/ui/issuedetail/issue_detail_page.dart';
import 'package:gitbbs/ui/widget/issue_item_component/action.dart';

Effect<GitIssue> buildEffect() {
  return combineEffects(<Object, Effect<GitIssue>>{
    Lifecycle.initState: _init,
    IssueItemAction.onGetDetail: _onGetDetail
  });
}

void _init(Action action, Context<GitIssue> ctx) {

}

void _onGetDetail(Action action, Context<GitIssue> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (ct) {
    return IssueDetailPage().buildPage(ctx.state);
  }));
}
