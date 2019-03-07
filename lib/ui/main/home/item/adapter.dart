import 'package:fish_redux/fish_redux.dart';
import 'package:gitbbs/model/GitIssue.dart';
import 'package:gitbbs/ui/main/home/item/component.dart';
import 'package:gitbbs/ui/main/home/item/divide_component.dart';
import 'package:gitbbs/ui/main/home/item/header_component.dart';
import 'package:gitbbs/ui/main/home/page_state.dart';
import 'package:gitbbs/ui/main/home/reducer.dart';

const TYPE_HEADER = 'header';
const TYPE_ISSUE = 'issue';
const TYPE_DIVIDE = 'divide';

class IssueListAdapter extends DynamicFlowAdapter<PageState> {
  IssueListAdapter()
      : super(
          pool: <String, Component<Object>>{
            TYPE_ISSUE: IssueComponent(),
            TYPE_DIVIDE: DivideComponent(),
            TYPE_HEADER: HeaderComponent()
          },
          connector: _IssueConnector(),
          reducer: buildReducer(),
        );
}

class _IssueConnector implements Connector<PageState, List<ItemBean>> {
  @override
  List<ItemBean> get(PageState state) {
    if (state.list?.isNotEmpty == true) {
      List<ItemBean> list = List();
      state.list.forEach((issue) {
        list.add(ItemBean(TYPE_DIVIDE, null));
        list.add(ItemBean(TYPE_ISSUE, issue));
      });
      list.removeAt(0);
      list.insert(0, ItemBean(TYPE_HEADER, null));
      return list;
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(PageState state, List<ItemBean> substate) {
    if (substate?.isNotEmpty == true) {
      List<GitIssue> list = List();
      substate.forEach((item) {
        if (item.type == TYPE_ISSUE) {
          list.add(item.data);
        }
      });
      state.list = list;
    } else {
      state.list = <GitIssue>[];
    }
  }
}
