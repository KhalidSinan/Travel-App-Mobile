import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';

class CancelOrganizedGroupTrip extends StatelessWidget {
  const CancelOrganizedGroupTrip(
      {super.key,
      required this.organizerName,
      required this.startDate,
      required this.source,
      required this.des});
  final String organizerName;
  final String startDate;
  final String source;
  final List<dynamic> des;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 16 , bottom: 16),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, bottom: 8, top: 24),
                child: Text(
                  'Sorry !',
                  style: Styles.heading
                      .copyWith(color: Themes.third, fontSize: 48),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text(
                  'The organizer has canceled the group trip :',
                  style: Styles.heading2.copyWith(color: Themes.primary),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text('organizer name :',
                  style: Styles.content
                      .copyWith(color: Colors.black, fontSize: 24)),
              const SizedBox(
                height: 8,
              ),
              Text(organizerName,
                  style: Styles.subtitle
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              Text('Start Date :',
                  style: Styles.content
                      .copyWith(color: Colors.black, fontSize: 24)),
              const SizedBox(
                height: 8,
              ),
              Text(startDate,
                  style: Styles.subtitle
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              Text('The Source :',
                  style: Styles.content
                      .copyWith(color: Colors.black, fontSize: 24)),
              const SizedBox(
                height: 8,
              ),
              Text(source,
                  style: Styles.subtitle
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              Text('The Destinations :',
                  style: Styles.content
                      .copyWith(color: Colors.black, fontSize: 24)),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                children: des
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e,
                                  style: Styles.subtitle.copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
