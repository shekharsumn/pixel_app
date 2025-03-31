
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/model/timeline_model.dart';


class TimelineCubit extends Cubit<List<TimelineItem>> {
  TimelineCubit() : super(_initialItems);

  static final List<TimelineItem> _initialItems = [
    TimelineItem(
      label: 'Label',
      title: 'Title',
      description1: 'Description',
      description2: 'Description',
    ),
    TimelineItem(
      label: 'Label',
      title: 'Title',
      description1: 'Description',
      description2: 'Description',
    ),
  ];

  // add methods here to modify the list of items if needed
}