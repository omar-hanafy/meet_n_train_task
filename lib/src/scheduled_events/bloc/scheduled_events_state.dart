part of 'scheduled_events_bloc.dart';

abstract class ScheduledEventsState extends Equatable {
  final List<EventModel> events;
  final bool hasReachedMax;
  final int nextPageNumber;

  const ScheduledEventsState({
    required this.events,
    this.nextPageNumber = 1,
    this.hasReachedMax = false,
  });
}

class ScheduledEventsInitial extends ScheduledEventsState {
  const ScheduledEventsInitial(
      {required super.events, super.nextPageNumber, super.hasReachedMax});

  @override
  List<Object?> get props => [events, nextPageNumber, hasReachedMax];
}

class ScheduledEventsLoaded extends ScheduledEventsState {
  const ScheduledEventsLoaded(
      {required super.events, super.nextPageNumber, super.hasReachedMax});

  @override
  List<Object?> get props => [events, nextPageNumber, hasReachedMax];
}

class EventsLoadingError extends ScheduledEventsState {
  final String errorMessage;

  const EventsLoadingError(this.errorMessage,
      {required super.events, super.nextPageNumber, super.hasReachedMax});

  @override
  List<Object?> get props =>
      [errorMessage, events, nextPageNumber, hasReachedMax];
}
