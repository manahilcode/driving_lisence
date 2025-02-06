import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/traffic_sign_list.dart';
import 'features/trafficsign/directiion_sign/view/direction_screen.dart';
import 'features/trafficsign/history_traffic_sign/view/history_sign_screen.dart';
import 'features/trafficsign/information_sign/view/information_sign_screen.dart';
import 'features/trafficsign/keep_up_to_date/view/keep_up_date_screen.dart';
import 'features/trafficsign/responsibility_traffic_sign/view/responsibilty_sign_screen.dart';
import 'features/trafficsign/road_works_sign/view/road_work_screen.dart';
import 'features/trafficsign/sign_giving_order/view/giving_order_screen.dart';
import 'features/trafficsign/signing_system/view/sign_system_screen.dart';
import 'features/trafficsign/warning_sign/view/warning_sign_screen.dart';
import 'features/trafficsign/you_know_traffic_sign/view/you_know_traffic_screen.dart';
import 'menu_screen.dart';

class TrafficSignScreenMain extends StatefulWidget {
  const TrafficSignScreenMain({super.key});

  @override
  State<TrafficSignScreenMain> createState() => _TrafficSignScreenMainState();
}

class _TrafficSignScreenMainState extends State<TrafficSignScreenMain> {
  final List<bool> _isSelect = List.generate(10, (index) => false);

  void _onSelect(int index, bool select) {
    _isSelect[index] = select;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Traffic sign screen",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) {
              return MenuScreen();
            }), (route) => false);
            //MenuScreen()
          }),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: trafficSignNames.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.info, color: Colors.green),
                            Gap(10),
                            Expanded(
                              child: AutoSizeText(
                                trafficSignNames[index],
                                style: GoogleFonts.poppins(
                                  fontSize: 12
                                                      
                                ),
                              ),
                            ),
                        
                        
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _isSelect[index],
                            onChanged: (value) {
                              if (value != null && value) {
                                _onSelect(index, value);
                                Future.delayed(Duration(milliseconds:500 ), () {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                    return NavigateTo(index);
                                  }));
                                });
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),



                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
//RoadWorkSignScreen
Widget NavigateTo(index) {
  switch (index) {
    case 0:
      return DirectionScreen321();
    case 1:
      return HistorySignScreen();
    case 2:
      return SignInformationSignScreen();
    case 3:
      return KeepUpDateScreen();
    case 4:
      return RoadWorkSignScreen();
    case 5:
      return ResponsibilityForTrafficSignsScreen();
    case 6:
      return SignGivingOrdersScreen();
    case 7:
      return SignSystemScreen23();
    case 8:
      return SignWarningSignScreen();
    case 9:
      return TrafficSignInfoScreen();
    default:
      return SizedBox.shrink();
  }
}
