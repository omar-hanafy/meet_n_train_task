import 'package:equatable/equatable.dart';
import 'package:event_repository/event_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/src.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = true;
  Bloc.observer = AppBlocObserver();
  return runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    final EventRepository eventRepository = UaeEventRepository(userId: "8357");
    return MaterialApp(
      title: 'MeetNTrain Task',
      theme: UITheme.lightTheme,
      darkTheme: UITheme.darkTheme,

      /// used to access our event repo any where in the app
      /// using the read method
      home: RepositoryProvider(
        create: (context) => eventRepository,
        child: BlocProvider<ScheduledEventsBloc>(
            create: (BuildContext context) =>
                ScheduledEventsBloc(eventRepository: eventRepository)
                  ..add(LoadEvents()),
            child: MultiBlocProvider(providers: [
              BlocProvider<ScheduledEventsBloc>(
                  create: (BuildContext context) =>
                      ScheduledEventsBloc(eventRepository: eventRepository)
                        ..add(LoadEvents())),
              BlocProvider(create: (_) => InViewDateCubit()),
            ], child: const ScheduleView())),
      ),
    );
  }
}
