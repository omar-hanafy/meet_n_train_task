part of 'scheduled_events_bloc.dart';

abstract class ScheduledEventsEvent {}

class LoadEvents extends ScheduledEventsEvent {
  bool isRefresh;

  LoadEvents({this.isRefresh = false});
}
