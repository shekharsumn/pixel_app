import 'package:equatable/equatable.dart';

class TimelineItem extends Equatable {
  final String label;
  final String title;
  final String description1;
  final String description2;

  const TimelineItem({
    required this.label,
    required this.title,
    required this.description1,
    required this.description2,
  });

  @override
  List<Object?> get props => [label, title, description1, description2];
}