import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/blocs/detailscreen/timeline_cubit.dart';
import 'package:one_cask/model/timeline_model.dart';
import 'package:one_cask/styles/ebgaramond.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimelineCubit(),
      child: BlocBuilder<TimelineCubit, List<TimelineItem>>(
        builder: (context, items) {
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildTimelineItem(items[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildTimelineItem(TimelineItem item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline Indicator
        _buildTimelineIndicator(),

        // Item Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.label, style: ebGaramondTitleStyle(fontSize: 12, color: Colors.white)),
                Text(item.title,
                    style:
                        ebGaramondTitleStyle(fontSize: 18, color: Colors.white)),
                Text(item.description1, style: ebGaramondTitleStyle(fontSize: 14, color: Colors.white)),
                Text(item.description2, style: ebGaramondTitleStyle(fontSize: 14, color: Colors.white)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.attach_file, size: 16, color: Colors.white,),
                    Text('Attachments',style: ebGaramondTitleStyle(fontSize: 16, color: Colors.white),),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: List.generate(
                      3, (index) => _buildAttachmentPlaceholder()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineIndicator() {
    return Column(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
            width: 1,
            height: 100, // Adjust height as needed
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Transform.rotate(
            angle: 45 * 3.1415927 / 180, // Rotate 45 degrees
            child: Container(
              width: 10,
              height: 10,
              color: Colors.amber,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
            width: 1,
            height: 50, // Adjust height as needed
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildAttachmentPlaceholder() {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(right: 8.0),
      color: Colors.grey[300],
    );
  }
}
