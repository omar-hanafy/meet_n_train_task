import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:event_repository/event_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'scheduled_events_event.dart';
part 'scheduled_events_state.dart';

const _throttleDuration = Duration(milliseconds: 300);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (Stream<E> events, EventMapper<E> mapper) {
    /// Reduces the rate that events are emitted to at most once per [duration].
    /// No events will ever be emitted within [duration] of another event on the
    /// result stream.
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ScheduledEventsBloc
    extends Bloc<ScheduledEventsEvent, ScheduledEventsState> {
  ScheduledEventsBloc({required EventRepository eventRepository})
      : _eventRepository = eventRepository,
        super(const ScheduledEventsInitial(events: [])) {
    on<LoadEvents>(
      _onLoadEvents,

      /// we are using transformer with throttle which
      /// reduces the rate that events are emitted to
      /// at most once per [duration].
      transformer: throttleDroppable(_throttleDuration),
    );
  }

  final EventRepository _eventRepository;

  Future<void> _onLoadEvents(LoadEvents event, emit) async {
    try {
      if (event.isRefresh) {
        final events = await _eventRepository.getScheduledEvents(
            pageNumber: 1, currentDate: DateTime.now());
        emit(ScheduledEventsLoaded(events: events));
      }
      if (state.hasReachedMax) return;
      final events = await _eventRepository.getScheduledEvents(
          pageNumber: state.nextPageNumber, currentDate: DateTime.now());
      if (state is ScheduledEventsInitial) {
        emit(ScheduledEventsLoaded(
            events: events, nextPageNumber: state.nextPageNumber + 1));
      } else {
        events.isEmpty
            ? emit(ScheduledEventsLoaded(
                events: state.events,
                nextPageNumber: state.nextPageNumber,
                hasReachedMax: true))
            : emit(ScheduledEventsLoaded(
                events: state.events..addAll(events),
                nextPageNumber: state.nextPageNumber + 1));
      }
    } catch (e) {
      emit(EventsLoadingError(e.toString(),
          events: state.events, nextPageNumber: state.nextPageNumber));
    }
  }
}
