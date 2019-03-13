import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:gitbbs/model/GitIssue.dart';
import 'package:gitbbs/util/issue_cache_manager.dart';

class IssueDetailState implements Cloneable<IssueDetailState> {
  GitIssue originIssue;
  GitIssue issue;
  String body;
  PersistentBottomSheetController controller;
  GlobalKey<ScaffoldState> scaffoldKey;

  GitIssue getIssue() {
    return issue == null ? originIssue : issue;
  }

  bool isCommentsShown() {
    return controller != null;
  }

  @override
  IssueDetailState clone() {
    return IssueDetailState()
      ..originIssue = originIssue
      ..controller = controller
      ..scaffoldKey = scaffoldKey
      ..body = body
      ..issue = issue;
  }
}

IssueDetailState initState(GitIssue issue) {
  final IssueDetailState state = IssueDetailState();
  state.originIssue = issue;
  state.body = issue.getBody() ?? '';
  state.scaffoldKey = GlobalKey<ScaffoldState>();
  return state;
}