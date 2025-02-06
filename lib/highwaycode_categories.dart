import 'package:driving_lisence/core/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/list_highway_code.dart';
import 'highwaycode/animal_being_herded/view/crossing_the_road_screen.dart';
import 'highwaycode/animal_being_herded/view/junctions_screen.dart';
import 'highwaycode/animal_being_herded/view/overview_screen.dart';
import 'highwaycode/animal_being_herded/view/road_junction_screen.dart';
import 'highwaycode/animal_being_herded/view/roundabouts_screen.dart';
import 'highwaycode/breakdown_and_incident/view/additional_rules_for_motorways_screen.dart';
import 'highwaycode/breakdown_and_incident/view/breakdown_screen.dart';
import 'highwaycode/breakdown_and_incident/view/documentation_screen.dart';
import 'highwaycode/breakdown_and_incident/view/incident_involving_dangrous_goods_screen.dart';
import 'highwaycode/breakdown_and_incident/view/incidents_screen.dart';
import 'highwaycode/breakdown_and_incident/view/obstructions_screen.dart';
import 'highwaycode/breakdown_and_incident/view/place_of_relative_afety_screen.dart';
import 'highwaycode/direction_sign_on_road_and_motorways/view/information_signs_screen.dart';
import 'highwaycode/direction_sign_on_road_and_motorways/view/you_and_your_bicycle_screen.dart';
import 'highwaycode/driving_in_adverse_weather_condition/view/fog_screen.dart';
import 'highwaycode/driving_in_adverse_weather_condition/view/hot_weather_screen.dart';
import 'highwaycode/driving_in_adverse_weather_condition/view/icy_and_snowy_waether_screen.dart';
import 'highwaycode/driving_in_adverse_weather_condition/view/parking_at_night_screen.dart';
import 'highwaycode/driving_in_adverse_weather_condition/view/weating_and_parking_screen.dart';
import 'highwaycode/driving_in_adverse_weather_condition/view/wet_weather_screen.dart';
import 'highwaycode/driving_in_adverse_weather_condition/view/windy_weather_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/control_the_vehicle_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/country_road_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/driving_in_built_up_areas_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/dual_carriageways_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/flashing_headlight_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/junction_controlled_by_traffic_lights_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/lighting_requirement_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/line_lane_marketing_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/mobile_phone_vehicle_technology_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/multi_lane_carriageway_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/other_stopping_procedure_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/overtaking_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/overview_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/reversing_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/road_junction_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/roundabout_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/signal_carriageway_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/signal_controll_crossing_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/signal_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/speed_limit_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/the_driver_and_enviroment_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/the_road_user_law_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/turning_left_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/turning_right_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/using_the_road_screen.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/view/vehicle_prohibited_using_road_pavement_screen.dart';
import 'highwaycode/introduction/view/hierarchy_of_road_users_screen.dart';
import 'highwaycode/introduction/view/knowing_and_applying_rules_screen.dart';
import 'highwaycode/introduction/view/self_driving_vehicle_screen.dart';
import 'highwaycode/introduction/view/wording_of_highway_code_screen.dart';
import 'highwaycode/motorways/view/general_screen.dart';
import 'highwaycode/motorways/view/joining_the_motorway_screen.dart';
import 'highwaycode/motorways/view/lane_discipline_screen.dart';
import 'highwaycode/motorways/view/leaving_the_motorway_screen.dart';
import 'highwaycode/motorways/view/motorway_signal_screen.dart';
import 'highwaycode/motorways/view/on_the_motorway_screen.dart';
import 'highwaycode/motorways/view/overtaking_screen.dart';
import 'highwaycode/motorways/view/stopping_screen.dart';
import 'highwaycode/panelties/view/new_driver_screen.dart';
import 'highwaycode/panelties/view/other_consequence_of_offending_screen.dart';
import 'highwaycode/panelties/view/panalties_and_highway_code_screen.dart';
import 'highwaycode/panelties/view/panalty_points_disqualification_screen.dart';
import 'highwaycode/road_users_requiring_extra/view/motorcyclist_cyclist_screen.dart';
import 'highwaycode/road_users_requiring_extra/view/other_road_user_screen.dart';
import 'highwaycode/road_users_requiring_extra/view/other_vehicle_screen.dart';
import 'highwaycode/road_users_requiring_extra/view/overview_screen.dart';
import 'highwaycode/road_users_requiring_extra/view/padestrian_screen.dart';
import 'highwaycode/road_work_level_crossing_and_tramways/view/additional_rule_high_speed_road_screen.dart';
import 'highwaycode/road_work_level_crossing_and_tramways/view/level_crossing_screen.dart';
import 'highwaycode/road_work_level_crossing_and_tramways/view/overhead_electric_line_screen.dart';
import 'highwaycode/road_work_level_crossing_and_tramways/view/road_works_screen.dart';
import 'highwaycode/road_work_level_crossing_and_tramways/view/tramways_screen.dart';
import 'highwaycode/rule_about_animals/view/horse_drawn_vehicle_screen.dart';
import 'highwaycode/rule_about_animals/view/horse_rider_screen.dart';
import 'highwaycode/rule_about_animals/view/other_animal_screen.dart';
import 'highwaycode/rule_about_animals/view/riding_screen.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/view/alcohal_drugs_screen.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/view/before_setting_off_screen.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/view/fitness_to_drive_screen.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/view/moped_licence_requirement_screen.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/view/motorcycle_licence_requirement_screen.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/view/seat_belts_and_child_restraints_screen.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/view/vehicle_towing_and_loading_screen.dart';
import 'highwaycode/rule_for_motorcyclist/view/documents_screen.dart';
import 'highwaycode/rule_for_motorcyclist/view/general_guidance_screen.dart';
import 'highwaycode/rule_for_motorcyclist/view/learner_drivers_screen.dart';
import 'highwaycode/rule_for_motorcyclist/view/moped_licence_requirement1_screen.dart';
import 'highwaycode/rule_for_motorcyclist/view/moped_licence_requirement_screen.dart';
import 'highwaycode/rule_for_motorcyclist/view/motorcycle_licence_requirement1_screen.dart';
import 'highwaycode/rule_for_motorcyclist/view/motorcycle_licence_requirement_screen.dart';
import 'highwaycode/rule_for_pedestrain/view/crossing_screen.dart';
import 'highwaycode/rule_for_pedestrain/view/crossing_the_road_screen.dart';
import 'highwaycode/rule_for_pedestrain/view/general_guidance_screen.dart';
import 'highwaycode/rule_for_pedestrain/view/situation_needing_extra_care_screen.dart';
import 'highwaycode/rule_for_user_wheel_chair_scooter/view/on_pavements_screen.dart';
import 'highwaycode/rule_for_user_wheel_chair_scooter/view/on_the_road_screen.dart';
import 'highwaycode/rule_for_user_wheel_chair_scooter/view/powered_wheelchair_mobility_scooter_screen.dart';
import 'highwaycode/using_road/view/act_regulation_prior_screen.dart';
import 'highwaycode/using_road/view/the_road_user_and_law_screen.dart';
import 'highwaycode/vehicle_documentation_learner_driving_requirement/view/document_screen.dart';
import 'highwaycode/vehicle_documentation_learner_driving_requirement/view/learner_driver_screen.dart';
import 'highwaycode/vehicle_maintenance_safety_security/view/be_prepared_screen.dart';
import 'highwaycode/vehicle_maintenance_safety_security/view/bleeding_screen.dart';
import 'highwaycode/vehicle_maintenance_safety_security/view/burn_screen.dart';
import 'highwaycode/vehicle_maintenance_safety_security/view/deal_with_danger_screen.dart';
import 'highwaycode/vehicle_maintenance_safety_security/view/first_aid_on_road_screen.dart';
import 'highwaycode/vehicle_maintenance_safety_security/view/get_help_screen.dart';
import 'highwaycode/vehicle_maintenance_safety_security/view/help_those_involved_screen.dart';
import 'highwaycode/vehicle_maintenance_safety_security/view/provide_emergency_care_screen.dart';
import 'highwaycode/vehicle_maintenance_safety_security/view/safety_code_for_driver_screen.dart';
import 'highwaycode/vehicle_maintenance_safety_security/view/vehicle_maintaince_screen.dart';
import 'highwaycode/vehicle_maintenance_safety_security/view/vehicle_security_screen.dart';
import 'menu_screen.dart';

class HighwaycodeCategories extends StatefulWidget {
  const HighwaycodeCategories({super.key});

  @override
  State<HighwaycodeCategories> createState() => _HighwaycodeCategoriesState();
}

class _HighwaycodeCategoriesState extends State<HighwaycodeCategories> {
  final List<bool> _selectedCategories = List.generate(115, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Highway code",
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return MenuScreen();
          }));
        },
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) => HighwayCodeCategoryItem(
          title: topics[index],
          progress: 0, // Replace with actual progress value
          isSelected: _selectedCategories[index],
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    _getCategoryScreen(index)),
          ),
        ),
      ),
    );
  }
  Widget _getCategoryScreen(int index) {
    switch (index) {
      case 0:
        return CrossingTheRoadScreenHighway();
      case 1:
        return JunctionsScreenHighway();
      case 2:
        return OverviewScreenHighway();
      case 3:
        return RoadJunctionScreenHighway();
      case 4:
        return RoundaboutsScreenHighway();
      case 5:
        return AdditionalRulesForMotorwaysScreenHighway();
      case 6:
        return BreakdownScreenHighway();
      case 7:
        return DocumentationScreenHighway();
      case 8:
        return IncidentInvolvingDangrousGoodsScreenHighway();
      case 9:
        return IncidentsScreenHighway();
      case 10:
        return ObstructionsScreenHighway();
      case 11:
        return PlaceOfRelativeAfetyScreenHighway();
      case 12:
        return InformationSignsScreenHighway();
      case 13:
        return YouAndYourBicycleScreenHighway();
      case 14:
        return FogScreenHighway();
      case 15:
        return HotWeatherScreenHighway();
      case 16:
        return IcyAndSnowyWaetherScreenHighway();
      case 17:
        return ParkingAtNightScreenHighway();
      case 18:
        return WeatingAndParkingScreenHighway();
      case 19:
        return WetWeatherScreenHighway();
      case 20:
        return WindyWeatherScreenHighway();
      case 21:
        return ControlTheVehicleScreenHighway();
      case 22:
        return CountryRoadScreenHighway();
      case 23:
        return DrivingInBuiltUpAreasScreenHighway();
      case 24:
        return DualCarriagewaysScreenHighway();
      case 25:
        return FlashingHeadlightScreenHighway();
      case 26:
        return JunctionControlledByTrafficLightsScreenHighway();
      case 27:
        return LightingRequirementScreenHighway();
      case 28:
        return LineLaneMarketingScreen();
      case 29:
        return MobilePhoneVehicleTechnologyScreenHighway();
      case 30:
        return MultiLaneCarriagewayScreenHighway();
      case 31:
        return OtherStoppingProcedureScreenHighway();
      case 32:
        return OvertakingScreenHighway();
      case 33:
        return ReversingScreen();
      case 34:
        return OverviewScreenHighway11();
  /*    case 35:
        return ReversingScreenHighway1();*/
      case 36:
        return RoadJunctionScreenHighway11();
      case 37:
        return RoundaboutScreenHighway();
      case 38:
        return SignalCarriagewayScreenHighway();
      case 39:
        return SignalControllCrossingScreenHighway();
      case 40:
        return SignalScreenHighway11();
      case 41:
        return SpeedLimitScreenHighway();
      case 42:
        return TheDriverAndEnviromentScreenHighway();
      case 43:
        return TheRoadUserLawScreenHighway();
      case 44:
        return TurningLeftScreenHighway();
      case 45:
        return TurningRightScreenHighway();
      case 46:
        return UsingTheRoadScreenHighway();
      case 47:
        return VehicleProhibitedUsingRoadPavementScreenHighway();
      case 48:
        return HierarchyOfRoadUsersScreenHighway();
      case 49:
        return KnowingAndApplyingRulesScreenHighway();
      case 50:
        return SelfDrivingVehicleScreenHighway();
      case 51:
        return WordingOfHighwayCodeScreenHighway();
      case 52:
        return GeneralScreenHighway();
      case 53:
        return JoiningTheMotorwayScreenHighway();
      case 54:
        return LaneDisciplineScreenHighway();
      case 55:
        return LeavingTheMotorwayScreenHighway();
      case 56:
        return MotorwaySignalScreenHighway();
      case 57:
        return OnTheMotorwayScreenHighway();
      case 58:
        return OvertakingScreenHighway11();
      case 59:
        return StoppingScreenHighway();
      case 60:
        return NewDriverScreenHighway();
      case 61:
        return OtherConsequenceOfOffendingScreenHighway();
      case 62:
        return PanaltiesAndHighwayCodeScreenHighway();
      case 63:
        return PanaltyPointsDisqualificationScreenHighway();
      case 64:
        return MotorcyclistCyclistScreenHighway();
      case 65:
        return OtherRoadUserScreenHighway();
      case 66:
        return OtherVehicleScreenHighway();
      case 67:
        return OverviewScreenHighway1122();
      case 68:
        return PadestrianScreenHighway();
      case 69:
        return AdditionalRuleHighSpeedRoadScreenHighway();
      case 70:
        return LevelCrossingScreenHighway();
      case 71:
        return OverheadElectricLineScreenHighway();
      case 72:
        return RoadWorksScreenHighway();
      case 73:
        return TramwaysScreenHighway();
      case 74:
        return HorseDrawnVehicleScreenHighway();
      case 75:
        return HorseRiderScreenHighway();
      case 76:
        return OtherAnimalScreenHighway();
      case 77:
        return RidingScreenHighway();
      case 78:
        return AlcohalDrugsScreenHighway();
      case 79:
        return BeforeSettingOffScreenHighway();
      case 80:
        return FitnessToDriveScreenHighway();
      case 81:
        return MopedLicenceRequirementScreenHighway();
      case 82:
        return MotorcycleLicenceRequirementScreenHighway();
      case 83:
        return SeatBeltsAndChildRestraintsScreenHighway();
      case 84:
        return VehicleTowingAndLoadingScreenHighway();
      case 85:
        return DocumentsScreenHighway11();
      case 86:
        return GeneralGuidanceScreenHighway();
      case 87:
        return LearnerDriversScreenHighway();
      case 88:
        return MopedLicenceRequirement1ScreenHighway();
      case 89:
        return MopedLicenceRequirementScreenHighway12();
      case 90:
        return MotorcycleLicenceRequirement1ScreenHighway();
      case 91:
        return MotorcycleLicenceRequirementScreenHighway123();
      case 92:
        return CrossingScreenHighway();
      case 93:
        return CrossingTheRoadScreenHighway123();
      case 94:
        return GeneralGuidanceScreenHighway123();
      case 95:
        return SituationNeedingExtraCareScreenHighway();
      case 96:
        return OnPavementsScreenHighway();
      case 97:
        return OnTheRoadScreenHighway();
      case 98:
        return PoweredWheelchairMobilityScooterScreenHighway();
      case 99:
        return ActRegulationPriorScreenHighway();
      case 100:
        return TheRoadUserAndLawScreenHighway();
      case 101:
        return DocumentScreen2211();
      case 102:
        return LearnerDriverScreenHighway();
      case 103:
        return BePreparedScreenHighway();
      case 104:
        return BleedingScreenHighway();
      case 105:
        return BurnScreenHighway();
      case 106:
        return DealWithDangerScreenHighway();
      case 107:
        return FirstAidOnRoadScreenHighway();
      case 108:
        return GetHelpScreenHighway();
      case 109:
        return HelpThoseInvolvedScreenHighway();
      case 110:
        return ProvideEmergencyCareScreenHighway();
      case 111:
        return SafetyCodeForDriverScreenHighway();
      case 112:
        return VehicleMaintainceScreenHighway();
      case 113:
        return VehicleSecurityScreenHighway();

      default:
        return const Center(child: Text("Unknown Category"));
    }
  }

}

class HighwayCodeCategoryItem extends StatelessWidget {
  final String title;
  final double progress;
  final bool isSelected;
  final VoidCallback onTap;

  const HighwayCodeCategoryItem({
    super.key,
    required this.title,
    required this.progress,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: const Icon(Icons.notifications_none, color: Colors.green, size: 30),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      subtitle: _buildProgressSubtitle(),
      trailing: GestureDetector(
        onTap: onTap,
        child: Icon(
          isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.green,
        ),
      ),
      hoverColor: Colors.orange,
    );
  }

  Widget _buildProgressSubtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: progress / 100,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(
            progress > 0 ? Colors.green : Colors.orange,
          ),
        ),
        const SizedBox(height: 4),
        _buildStatsRow(),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatText('Answered: ', Colors.orange),
        _buildStatText('Correct: ', Colors.green),
        _buildStatText('Total: ', Colors.grey[600]!),
      ],
    );
  }

  Widget _buildStatText(String label, Color color) {
    return Text(
      label,
      style: GoogleFonts.roboto(color: color, fontSize: 12),
    );
  }
}