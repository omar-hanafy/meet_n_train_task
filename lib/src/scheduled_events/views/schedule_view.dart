import 'package:event_repository/event_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';

import '../../src.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  final _scrollController = ScrollController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    // Setup the listener.
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (_scrollController.position.atEdge) {
      bool isTop = _scrollController.position.pixels == 0;
      if (isTop) {
        debugPrint('At the top');
      } else {
        debugPrint('At the bottom');
        context.read<ScheduledEventsBloc>().add(LoadEvents());
      }
    }
  }

  Future<void> _onRefresh() async {
    var bloc = context.read<ScheduledEventsBloc>()
      ..add(LoadEvents(isRefresh: true));
    return await bloc.stream
        .firstWhere((e) => e is! EventsLoadingError)
        .then((state) {});
  }

  bool _condition(double deltaTop, double deltaBottom, double vpHeight) {
    return deltaTop < (0 * vpHeight) && deltaBottom > (0 * vpHeight);
  }

  EventModel inViewEvent = EventModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Schedule",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          iconSize: 40,
          icon: const Icon(Icons.arrow_circle_left_outlined),
          onPressed: () {},
        ),
      ),
      body: BlocBuilder<ScheduledEventsBloc, ScheduledEventsState>(
        builder: (context, state) {
          if (state is EventsLoadingError) {
            return Center(
              child: Text("Events Loading Error: ${state.errorMessage}"),
            );
          }
          if (state is ScheduledEventsLoaded) {
            if (state.events.isEmpty) {
              return const Center(child: Text('no events'));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<InViewDateCubit, DateTime?>(
                  builder: (context, DateTime? date) => DateHeader(
                      date: date ?? DateTime.parse(state.events[0].date!)),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Row(
                        children: const [
                          Spacer(),
                          SizedBox(
                            width: 40,
                            child: VerticalDivider(
                              width: 20,
                              thickness: 1,
                              indent: 20,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(flex: 15),
                        ],
                      ),
                      RefreshIndicator(
                        onRefresh: _onRefresh,
                        key: _refreshIndicatorKey,
                        child: InViewNotifierList(
                          padding: EdgeInsets.zero,
                          controller: _scrollController,
                          initialInViewIds: const ['0'],
                          isInViewPortCondition: _condition,
                          itemCount: state.hasReachedMax
                              ? state.events.length
                              // we are increasing the 1 to the itemCount so the BottomLoader could appear while loading
                              : state.events.length + 1,
                          builder: (BuildContext context, int index) {
                            return index >= state.events.length
                                ? const BottomLoadingIndicator()
                                : InViewNotifierWidget(
                                    id: "$index",
                                    builder: (BuildContext context,
                                        bool isInView, Widget? child) {
                                      final shouldShowDate = index <= 0 ||
                                          DateTime.parse(
                                                      state.events[index].date!)
                                                  .difference(DateTime.parse(
                                                      state.events[index - 1]
                                                          .date!))
                                                  .inDays !=
                                              0;
                                      if (isInView) {
                                        context
                                            .read<InViewDateCubit>()
                                            .changeDate(DateTime.parse(
                                                state.events[index].date!));
                                      }
                                      return EventCard(
                                        event: state.events[index],
                                        shouldShowDate: shouldShowDate,
                                      );
                                    },
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const CenterLoadingIndicator();
          }
        },
      ),
    );
  }
}
