import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/bloc/location/location_bloc.dart';
// import 'package:provider/provider.dart';
// import 'scrollbehavior.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
import 'model/location.dart';
// import 'weather.dart';
// import 'routes/route.dart';
import 'routes/route.gr.dart';

@RoutePage()
class LocationWidgetWrapper extends StatelessWidget {
  const LocationWidgetWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LocationBloc(),
      child: const LocationWidget(),
    );
  }
}
class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  List<Location> location = [];
  List<Location> filteredList = [];
  bool flag = false;

  void sortList(String letter, bool flag) {
    if (flag) {
      filteredList =
          location.where((l) => l.displayname().startsWith(letter)).toList();
      flag = false;
    } else {
      filteredList = location;
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(LoadLocationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05),
        child: ExpansionTile(
          title: const Text('Location'),
          initiallyExpanded: true,
          backgroundColor: Colors.grey,
          childrenPadding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
          collapsedBackgroundColor: Colors.grey,
          iconColor: Colors.black,
          collapsedIconColor: Colors.black,
          textColor: Colors.black,
          collapsedTextColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide.none,
          ),
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Filter locations',
                ),
                onChanged: (text){
                  // List<Location>newLocations=filterLocations(text.toLowerCase());
                  context.read<LocationBloc>().add(LocationFilterEvent(text));
                },
              ),
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                    // constraints: const BoxConstraints(maxHeight: 200),
                    color: Colors.white,
                    child: BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, state) {
                    return SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.5,
                        child: ListView.builder(
                          itemCount: state.allcities.length,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Checkbox(
                                checkColor: Colors.grey,
                                value: state.allcities[index].isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    state.allcities[index].isChecked = value!;
                                  });
                                },
                              ),
                              title: Container(
                                color: const Color.fromARGB(0, 88, 88, 186),
                                child: TextButton(
                                  style: ButtonStyle(
                                    foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                  ),
                                  iconAlignment: IconAlignment.end,
                                  onPressed: () => context.router.push(Weather(list: state.allcities[index])),
                                  child: Text(state.allcities[index].displayname()),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                )
                ),
                // SingleChildScrollView(
                //   child: Container(
                //     // constraints: const BoxConstraints(maxHeight: 200),
                //     height: MediaQuery.of(context).size.height*0.5,
                //     child: ScrollConfiguration(
                //       behavior: NoScrollBehavior(),
                //       child: SingleChildScrollView(
                //         child: Column(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: List.generate(26, (index) {
                //               final letter = String.fromCharCode(65 + index);
                //               return TextButton(
                //                 onPressed: () {
                //                   setState(() {
                //                     flag = !flag;
                //                     sortList(letter, flag);
                //                   });
                //                 },
                //                 child: Text(
                //                   letter,
                //                 ),
                //               );
                //             })),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
