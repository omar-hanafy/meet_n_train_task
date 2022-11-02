import 'package:event_repository/event_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meet_n_train_task/src/app/app.dart';

class EventCard extends StatelessWidget {
  final double height;
  final EventModel event;
  final bool shouldShowDate;

  const EventCard({
    Key? key,
    this.height = 450.0,
    required this.event,
    required this.shouldShowDate,
  }) : super(key: key);

  static Widget _myChip(
          {required Widget child, required AlignmentGeometry alignment}) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: alignment,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: Container(
                color: Colors.white.withOpacity(0.9),
                child: child,
              ),
            )),
      );

  DateTime get _eventDateTime => DateTime.parse(event.date!);

  Widget _onlinePayment() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          event.price! > 0
              ? event.paymentMethod == "CASH"
                  ? const Icon(
                      size: 15,
                      Icons.paid_outlined,
                      color: UIColors.primaryColor)
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (event.paymentMethod == "CASH_ONLINE")
                          const Icon(
                              size: 15,
                              Icons.paid_outlined,
                              color: UIColors.primaryColor),
                        const Icon(
                            size: 15,
                            Icons.credit_card_outlined,
                            color: UIColors.primaryColor),
                        const Icon(
                            size: 15,
                            Icons.wallet,
                            color: UIColors.primaryColor),
                      ],
                    )
              : const SizedBox(),
          Text(
            event.price! <= 0 ? "FREE" : "AED ${event.price}",
            style: const TextStyle(
              fontSize: 14,
              color: UIColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      );

  Widget _joinedUsers() => SizedBox(
        height: 25,
        // width: 80,
        child: Stack(
            children: List.generate(
          event.users!.length,
          (index) {
            return Positioned(
                left: index * 15,
                child: ImageUrlView(
                  height: 25,
                  width: 25,
                  // todo: get users urls
                  imageKey: event.users![index].profilePicture,
                  circular: true,
                ));
          },
        )),
      );

  @override
  Widget build(BuildContext context) {
    final int spotsLeft = (event.spots ?? 0) - (event.joinedUsersCount ?? 0);
    final DateFormat formatter = DateFormat('EEEE, dd MMM yyyy • KK:mm a');
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: shouldShowDate
                  ? Container(
                      height: 60,
                      width: 40,
                      color: UIColors.primaryColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('dd')
                                .format(DateTime.parse(event.date!)),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('MMM')
                                .format(DateTime.parse(event.date!)),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(
                      width: 40,
                    ),
            ),
          ),
          Expanded(
            flex: 15,
            child: SizedBox(
              height: height,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 2,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: _onlinePayment()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: SizedBox(child: _joinedUsers()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Stack(
                                children: [
                                  ImageUrlView(
                                      // fit: BoxFit.fitHeight,
                                      imageKey: "${event.featuredImage}"),
                                  _myChip(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: ImageUrlView(
                                                  imageKey:
                                                      "${event.tag!.icon}")),
                                          const SizedBox(width: 5),
                                          Text(
                                            "${event.tag!.title}",
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  _myChip(
                                      alignment:
                                          AlignmentDirectional.bottomStart,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          event.spots! <= 0
                                              ? "Unlimited Spots"
                                              : "$spotsLeft Spots Left",
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: UIColors.primaryColor),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      maxLines: 1,
                                      formatter.format(_eventDateTime),
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: UIColors.background),
                                    )),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Flexible(
                                        child: Text(
                                      "${event.title}",
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Flexible(
                                        child: Text(
                                      "${event.placeName}",
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: UIColors.background),
                                    )),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Flexible(
                                        child: Text(
                                      "${_eventDateTime.difference(DateTime.now()).inDays} Days Left",
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: UIColors.primaryColor),
                                    )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
