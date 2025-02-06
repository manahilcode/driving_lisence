import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/features/allertness/viewmodel/controller.dart';
import 'package:driving_lisence/features/attitude/viewmodel/attitude_provider.dart';
import 'package:driving_lisence/features/choose_ride/choose_ride.dart';
import 'package:driving_lisence/features/essential_document/viewmodel/controller.dart';
import 'package:driving_lisence/features/motor_way_Driving/viewmodel/controller.dart';
import 'package:driving_lisence/features/motorcycle/hazardAwareness/viewmodel/hazard_awarness1_provider.dart';
import 'package:driving_lisence/features/vehicle_handling/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'core/facebook_ads.dart';
import 'features/Motorcycle_quiz/Alerness_quiz/viewmodel/alernes_provider.dart';
import 'features/Motorcycle_quiz/attitude_quiz/viewmodel/attitude_provider.dart';
import 'features/Motorcycle_quiz/essential_document_quiz/viewmodel/essential_provider.dart';
import 'features/Motorcycle_quiz/hazard_awarness_quiz/viewmodel/hazard_awarness_provider.dart';
import 'features/Motorcycle_quiz/incident_quiz/viewmodel/incident_provider.dart';
import 'features/Motorcycle_quiz/motorcycle_handling_quiz/viewmodel/motorcycle_handling_provider.dart';
import 'features/Motorcycle_quiz/motorway_driving_quiz/viewmodel/motorway_driving_provider.dart';
import 'features/Motorcycle_quiz/other_type_of_vehicle_quiz/viewmodel/othertype_motorcyle_provider.dart';
import 'features/Motorcycle_quiz/road_and_traffic_sign_quiz/viewmodel/road_traffic_Sign_provider.dart';
import 'features/Motorcycle_quiz/rule_of_road_quiz/viewmodel/rule_of_road_provider.dart';
import 'features/Motorcycle_quiz/safety_and_motorcycle_quiz/viewmodel/safety_motorrcyle_provider.dart';
import 'features/Motorcycle_quiz/safety_margin_quiz/viewmodel/safety_margin_provider.dart';
import 'features/Motorcycle_quiz/vehicle_loading_quiz/viewmodel/motorcycle_loading_provider.dart';
import 'features/Motorcycle_quiz/vulnerble_road_user_quiz/viewmodel/vulnerable_road_provider.dart';
import 'features/Quiz/Incident_quiz/viewmodel/controller.dart';
import 'features/Quiz/Rule_of_the_road/viewmodel/controller.dart';
import 'features/Quiz/alertness_quiz/viewmodel/controller.dart';
import 'features/Quiz/all_categories_quiz/viewmodel/controller.dart';
import 'features/Quiz/attitude_quiz/viewmodel/controller.dart';
import 'features/Quiz/essential_document_quiz/viewmodel/controller.dart';
import 'features/Quiz/hazard_awareness_quiz/viewmodel/controller.dart';
import 'features/Quiz/motorway_driving_quiz/viewmodel/controller.dart';
import 'features/Quiz/other_type_vehicle_quiz/viewmodel/controller.dart';
import 'features/Quiz/result/pages/result.dart';
import 'features/Quiz/result/viewmodel/resultController.dart';
import 'features/Quiz/road_traffic_sign_quiz/viewmodel/controller.dart';
import 'features/Quiz/safety_margin_quiz/viewmodel/controller.dart';
import 'features/Quiz/safety_vehicle_quiz/viewmodel/controller.dart';
import 'features/Quiz/vehicle_handling_quiz/viewmodel/controller.dart';
import 'features/Quiz/vehicle_loading_quiz/viewmodel/controller.dart';
import 'features/Quiz/vulnerable_road_user_quiz/viewmodel/controller.dart';
import 'features/auth/viewmodel/controller.dart';
import 'features/auth/viewmodel/user_provider.dart';
import 'features/incident/viewmodel/controller.dart';
import 'features/motorcycle/Rule_of_road/repo/discuss_with_trainer.dart';
import 'features/motorcycle/Rule_of_road/repo/meeting_standard_repo.dart';
import 'features/motorcycle/Rule_of_road/repo/over_taking_crossing.dart';
import 'features/motorcycle/Rule_of_road/repo/rule_of_road.dart';
import 'features/motorcycle/Rule_of_road/repo/speed_limit.dart';
import 'features/motorcycle/Rule_of_road/repo/stop_parking.dart';
import 'features/motorcycle/Rule_of_road/repo/think_about_repo.dart';
import 'features/motorcycle/Rule_of_road/viewmodel/crossroad.dart';
import 'features/motorcycle/Rule_of_road/viewmodel/discuss_with_trainer.dart';
import 'features/motorcycle/Rule_of_road/viewmodel/lane_and_junction.dart';
import 'features/motorcycle/Rule_of_road/viewmodel/level_crossing_repo.dart';
import 'features/motorcycle/Rule_of_road/viewmodel/meeting_standard.dart';
import 'features/motorcycle/Rule_of_road/viewmodel/overtaking_crossing.dart';
import 'features/motorcycle/Rule_of_road/viewmodel/rule_of_road.dart';
import 'features/motorcycle/Rule_of_road/viewmodel/speed_limit.dart';
import 'features/motorcycle/Rule_of_road/viewmodel/stop_parking_provider.dart';
import 'features/motorcycle/Rule_of_road/viewmodel/think_rule.dart';
import 'features/motorcycle/allertness/repo/allertness_repo.dart';
import 'features/motorcycle/allertness/repo/anticipation_repo.dart';
import 'features/motorcycle/allertness/repo/observation_awareness_repo.dart';
import 'features/motorcycle/allertness/viewmodel/alertness_provider.dart';
import 'features/motorcycle/allertness/viewmodel/anticipation_provider.dart';
import 'features/motorcycle/allertness/viewmodel/avoid_tiredness_provider.dart';
import 'features/motorcycle/allertness/viewmodel/being_seen_by_other_provider.dart';
import 'features/motorcycle/allertness/viewmodel/distraction_provider.dart';
import 'features/motorcycle/allertness/viewmodel/keep_warm_provider.dart';
import 'features/motorcycle/allertness/viewmodel/meeting_standard_provider.dart';
import 'features/motorcycle/allertness/viewmodel/observation_awareness_provider.dart';
import 'features/motorcycle/allertness/viewmodel/stay_focus_provider.dart';
import 'features/motorcycle/allertness/viewmodel/things_discusstion_practice_trainer_provider.dart';
import 'features/motorcycle/allertness/viewmodel/think_about_provider.dart';
import 'features/motorcycle/attitude/viewmodel/animal_on_road_provider.dart';
import 'features/motorcycle/attitude/viewmodel/attitude_provider.dart';
import 'features/motorcycle/attitude/viewmodel/discussion_with_trianer_provider.dart';
import 'features/motorcycle/attitude/viewmodel/following_safety_provider.dart';
import 'features/motorcycle/attitude/viewmodel/giving_priority_other_provider.dart';
import 'features/motorcycle/attitude/viewmodel/good_manner_on_road_provider.dart';
import 'features/motorcycle/attitude/viewmodel/helping_other_road_provider.dart';
import 'features/motorcycle/attitude/viewmodel/meeting_standard_repo.dart';
import 'features/motorcycle/attitude/viewmodel/pedestrain_crossing_provider.dart';
import 'features/motorcycle/attitude/viewmodel/priority_for_bus_provider.dart';
import 'features/motorcycle/attitude/viewmodel/think_about_provider.dart';
import 'features/motorcycle/essential_document/repo/essentail_document1.dart';
import 'features/motorcycle/essential_document/repo/essential_document.dart';
import 'features/motorcycle/essential_document/repo/insurance.dart';
import 'features/motorcycle/essential_document/repo/mot_test.dart';
import 'features/motorcycle/essential_document/viewmodel/essentail_document.dart';
import 'features/motorcycle/essential_document/viewmodel/essentail_document1.dart';
import 'features/motorcycle/essential_document/viewmodel/insurance.dart';
import 'features/motorcycle/essential_document/viewmodel/meeting_standard.dart';
import 'features/motorcycle/essential_document/viewmodel/mot_test.dart';
import 'features/motorcycle/essential_document/viewmodel/motor_cycle_licence.dart';
import 'features/motorcycle/essential_document/viewmodel/registor_owning.dart';
import 'features/motorcycle/essential_document/viewmodel/thing_discuss.dart';
import 'features/motorcycle/essential_document/viewmodel/think_about.dart';
import 'features/motorcycle/hazard/viewmodel/clue_provider.dart';
import 'features/motorcycle/hazard/viewmodel/factor_effecting_provider.dart';
import 'features/motorcycle/hazard/viewmodel/hazard_managment_provider.dart';
import 'features/motorcycle/hazard/viewmodel/hazard_provider.dart';
import 'features/motorcycle/hazard/viewmodel/learning_see_provider.dart';
import 'features/motorcycle/hazard/viewmodel/looking_seeing_provider.dart';
import 'features/motorcycle/hazard/viewmodel/responding_hazard_provider.dart';
import 'features/motorcycle/hazard/viewmodel/reviewing_driver_provider.dart';
import 'features/motorcycle/hazard/viewmodel/road_weather_condition_provider.dart';
import 'features/motorcycle/hazard/viewmodel/scanning_provider.dart';
import 'features/motorcycle/hazard/viewmodel/seeing_hazard_provider.dart';
import 'features/motorcycle/hazard/viewmodel/static_hazard_provider.dart';
import 'features/motorcycle/hazard/viewmodel/understanding_hazard_provider.dart';
import 'features/motorcycle/hazard/viewmodel/what_if_provider.dart';
import 'features/motorcycle/hazard/viewmodel/your_provider.dart';
import 'features/motorcycle/hazardAwareness/repo/hazard_awareness1_repo.dart';
import 'features/motorcycle/hazardAwareness/repo/hazard_awareness_repo.dart';
import 'features/motorcycle/hazardAwareness/repo/hazardoius_load.dart';
import 'features/motorcycle/hazardAwareness/repo/meeting_awareness_hazard_repo.dart';
import 'features/motorcycle/hazardAwareness/repo/motorway_dual_carriageway_repo.dart';
import 'features/motorcycle/hazardAwareness/repo/moving_hazard_repo.dart';
import 'features/motorcycle/hazardAwareness/repo/road_condition_hazard_Awareness.dart';
import 'features/motorcycle/hazardAwareness/repo/road_sign_repo.dart';
import 'features/motorcycle/hazardAwareness/repo/static_hazard_Repo.dart';
import 'features/motorcycle/hazardAwareness/repo/things_discuss_trainer_repo.dart';
import 'features/motorcycle/hazardAwareness/repo/think_about_repo.dart';
import 'features/motorcycle/hazardAwareness/repo/yourself_Repo.dart';
import 'features/motorcycle/hazardAwareness/viewmodel/hazard_awareness_provider.dart';
import 'features/motorcycle/hazardAwareness/viewmodel/hazardoius_load_provider.dart';
import 'features/motorcycle/hazardAwareness/viewmodel/meeting_awareness_meeting_hazard_provider.dart';
import 'features/motorcycle/hazardAwareness/viewmodel/motorwat_dual_caariage_provider.dart';
import 'features/motorcycle/hazardAwareness/viewmodel/moving_hazard_provider.dart';
import 'features/motorcycle/hazardAwareness/viewmodel/road_condition_provider.dart';
import 'features/motorcycle/hazardAwareness/viewmodel/road_sign_provider.dart';
import 'features/motorcycle/hazardAwareness/viewmodel/static_hazard_repo.dart';
import 'features/motorcycle/hazardAwareness/viewmodel/things_discuss_trainer.dart';
import 'features/motorcycle/hazardAwareness/viewmodel/think_about_provider.dart';
import 'features/motorcycle/hazardAwareness/viewmodel/yourself_provider.dart';
import 'features/motorcycle/hazard_quiz/viewmodel/hazard_question_provider.dart';
import 'features/motorcycle/hazard_response_clip/viewmodel/video_clip_provider.dart';
import 'features/motorcycle/incident/repo/incident_accident_emergency.dart';
import 'features/motorcycle/incident/repo/meeting_standard.dart';
import 'features/motorcycle/incident/repo/reporting_an_incident.dart';
import 'features/motorcycle/incident/repo/safety_in_tunnel.dart';
import 'features/motorcycle/incident/repo/stoping_an_incident.dart';
import 'features/motorcycle/incident/repo/things_discuss.dart';
import 'features/motorcycle/incident/repo/think_about.dart';
import 'features/motorcycle/incident/repo/warning_other.dart';
import 'features/motorcycle/incident/viewmodel/break_down.dart';
import 'features/motorcycle/incident/viewmodel/helping_other_first_aid.dart';
import 'features/motorcycle/incident/viewmodel/incident_accident_emergency.dart';
import 'features/motorcycle/incident/viewmodel/meeting_standard.dart';
import 'features/motorcycle/incident/viewmodel/reporting_an_incident.dart';
import 'features/motorcycle/incident/viewmodel/safety_in_tunnel.dart';
import 'features/motorcycle/incident/viewmodel/stoping_an_incident.dart';
import 'features/motorcycle/incident/viewmodel/things_discuss.dart';
import 'features/motorcycle/incident/viewmodel/think_about.dart';
import 'features/motorcycle/incident/viewmodel/warning_other.dart';
import 'features/motorcycle/motorcycle_handling/viewmodel/bad_weather.dart';
import 'features/motorcycle/motorcycle_handling/viewmodel/discuss_with_trainer.dart';
import 'features/motorcycle/motorcycle_handling/viewmodel/fog_info.dart';
import 'features/motorcycle/motorcycle_handling/viewmodel/keep_control_motorcycle.dart';
import 'features/motorcycle/motorcycle_handling/viewmodel/meeting_standard.dart';
import 'features/motorcycle/motorcycle_handling/viewmodel/motor_cycle_handling.dart';
import 'features/motorcycle/motorcycle_handling/viewmodel/riding_at_night.dart';
import 'features/motorcycle/motorcycle_handling/viewmodel/think_About_provider.dart';
import 'features/motorcycle/motorcycle_handling/viewmodel/traffic_calming_provider.dart';
import 'features/motorcycle/motorcycle_loading/repo/keep_your_motorcycle_stable.dart';
import 'features/motorcycle/motorcycle_loading/repo/meeting_standard.dart';
import 'features/motorcycle/motorcycle_loading/repo/motorcycle_loading.dart';
import 'features/motorcycle/motorcycle_loading/repo/side_car.dart';
import 'features/motorcycle/motorcycle_loading/repo/things_discuss.dart';
import 'features/motorcycle/motorcycle_loading/repo/think_About.dart';
import 'features/motorcycle/motorcycle_loading/repo/towing_trailer.dart';
import 'features/motorcycle/motorcycle_loading/viewmodel/keep_your_motorcycle_stable.dart';
import 'features/motorcycle/motorcycle_loading/viewmodel/meeting_standard.dart';
import 'features/motorcycle/motorcycle_loading/viewmodel/motorcycle_loading.dart';
import 'features/motorcycle/motorcycle_loading/viewmodel/side_car.dart';
import 'features/motorcycle/motorcycle_loading/viewmodel/things_discuss.dart';
import 'features/motorcycle/motorcycle_loading/viewmodel/think_About.dart';
import 'features/motorcycle/motorcycle_loading/viewmodel/towing_trailer.dart';
import 'features/motorcycle/motorway_Riding/repo/lane_marking_repo.dart';
import 'features/motorcycle/motorway_Riding/repo/meeting_standard.dart';
import 'features/motorcycle/motorway_Riding/repo/motorway_Riding_repo.dart';
import 'features/motorcycle/motorway_Riding/viewmodel/dicuss_with_trainer.dart';
import 'features/motorcycle/motorway_Riding/viewmodel/lane_marking.dart';
import 'features/motorcycle/motorway_Riding/viewmodel/meeting_standard.dart';
import 'features/motorcycle/motorway_Riding/viewmodel/motorway_riding_provider.dart';
import 'features/motorcycle/motorway_Riding/viewmodel/reducing_congestion.dart';
import 'features/motorcycle/motorway_Riding/viewmodel/riding_on_motorway.dart';
import 'features/motorcycle/motorway_Riding/viewmodel/speed_limit.dart';
import 'features/motorcycle/motorway_Riding/viewmodel/stopping_breakdown.dart';
import 'features/motorcycle/motorway_Riding/viewmodel/think_about_provider.dart';
import 'features/motorcycle/other_type_of _vehicle/repo/bus_repo.dart';
import 'features/motorcycle/other_type_of _vehicle/viewmodel/bus_provider.dart';
import 'features/motorcycle/other_type_of _vehicle/viewmodel/discussion_with_trainer.dart';
import 'features/motorcycle/other_type_of _vehicle/viewmodel/large_vehicle_provider.dart';
import 'features/motorcycle/other_type_of _vehicle/viewmodel/meeting_standard_provider.dart';
import 'features/motorcycle/other_type_of _vehicle/viewmodel/motorcycle_info_provider.dart';
import 'features/motorcycle/other_type_of _vehicle/viewmodel/other_type_vehicle_provider.dart';
import 'features/motorcycle/other_type_of _vehicle/viewmodel/power_vehicle_provider.dart';
import 'features/motorcycle/other_type_of _vehicle/viewmodel/think_about.dart';
import 'features/motorcycle/road_and_traffic_sign/repo/meeting_standard.dart';
import 'features/motorcycle/road_and_traffic_sign/repo/raod_lane.dart';
import 'features/motorcycle/road_and_traffic_sign/repo/road_traffic_sign.dart';
import 'features/motorcycle/road_and_traffic_sign/repo/signal_given_by_driver.dart';
import 'features/motorcycle/road_and_traffic_sign/repo/things_discuss.dart';
import 'features/motorcycle/road_and_traffic_sign/repo/think_About.dart';
import 'features/motorcycle/road_and_traffic_sign/repo/traffic_ligths_warning.dart';
import 'features/motorcycle/road_and_traffic_sign/viewmodel/meeting_standard.dart';
import 'features/motorcycle/road_and_traffic_sign/viewmodel/road_lane.dart';
import 'features/motorcycle/road_and_traffic_sign/viewmodel/road_marking.dart';
import 'features/motorcycle/road_and_traffic_sign/viewmodel/road_traffic_sign.dart';
import 'features/motorcycle/road_and_traffic_sign/viewmodel/signal_given_by_driver.dart';
import 'features/motorcycle/road_and_traffic_sign/viewmodel/sing.dart';
import 'features/motorcycle/road_and_traffic_sign/viewmodel/things_discuss.dart';
import 'features/motorcycle/road_and_traffic_sign/viewmodel/think_about.dart';
import 'features/motorcycle/road_and_traffic_sign/viewmodel/traffic_light_warning.dart';
import 'features/motorcycle/safety_and_motorcycle/repo/avoiding_congession_repo.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/avoid_congession_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/being_aware_of_enviroment_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/carry_passenger_load_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/cloth_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/dealing_with_fault_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/discuss_with_trainer_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/fuel_efficient_riding_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/looking_after_motorcycle_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/meeting_standard_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/parking_safetly_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/safetly_your_motorcycle_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/security_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/seeing_is_being_seen_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/think_about.dart';
import 'features/motorcycle/safety_margin/repo/discuss_with_trainer_repo.dart';
import 'features/motorcycle/safety_margin/repo/stopping_distance_repo.dart';
import 'features/motorcycle/safety_margin/repo/think_About_repo.dart';
import 'features/motorcycle/safety_margin/repo/weather_condition_repo.dart';
import 'features/motorcycle/safety_margin/viewmodel/break_system_provider.dart';
import 'features/motorcycle/safety_margin/viewmodel/contraflow_system_provider.dart';
import 'features/motorcycle/safety_margin/viewmodel/discuss_with_trainer.dart';
import 'features/motorcycle/safety_margin/viewmodel/meeting_with_standard_provider.dart';
import 'features/motorcycle/safety_margin/viewmodel/night_riding_provider.dart';
import 'features/motorcycle/safety_margin/viewmodel/safety_margin_provider.dart';
import 'features/motorcycle/safety_margin/viewmodel/safetymargin1_provider.dart';
import 'features/motorcycle/safety_margin/viewmodel/skidding_info_provider.dart';
import 'features/motorcycle/safety_margin/viewmodel/stopping_distance_provider.dart';
import 'features/motorcycle/safety_margin/viewmodel/think_About_provider.dart';
import 'features/motorcycle/safety_margin/viewmodel/weather_condition_provider.dart';
import 'features/motorcycle/vulnurable_road_user/repo/animals_Repo.dart';
import 'features/motorcycle/vulnurable_road_user/repo/cyclist_repo.dart';
import 'features/motorcycle/vulnurable_road_user/repo/discuss_practice_repo.dart';
import 'features/motorcycle/vulnurable_road_user/repo/driver_repo.dart';
import 'features/motorcycle/vulnurable_road_user/repo/meeting_standard_repo.dart';
import 'features/motorcycle/vulnurable_road_user/repo/older_disable_repo.dart';
import 'features/motorcycle/vulnurable_road_user/repo/other_motorcylist_repo.dart';
import 'features/motorcycle/vulnurable_road_user/repo/pedestrain_crossing_repo.dart';
import 'features/motorcycle/vulnurable_road_user/repo/pedestrain_repo.dart';
import 'features/motorcycle/vulnurable_road_user/repo/think_about.dart';
import 'features/motorcycle/vulnurable_road_user/repo/vulnurable_road_user_Repo.dart';
import 'features/motorcycle/vulnurable_road_user/repo/vulnurable_user.dart';
import 'features/motorcycle/vulnurable_road_user/viewmodel/animals_provider.dart';
import 'features/motorcycle/vulnurable_road_user/viewmodel/cyclist_provider.dart';
import 'features/motorcycle/vulnurable_road_user/viewmodel/discusstion_practice_provider.dart';
import 'features/motorcycle/vulnurable_road_user/viewmodel/driver_provider.dart';
import 'features/motorcycle/vulnurable_road_user/viewmodel/meeting_standard_provider.dart';
import 'features/motorcycle/vulnurable_road_user/viewmodel/older_disabled_provider.dart';
import 'features/motorcycle/vulnurable_road_user/viewmodel/other_motorcyclist_provider.dart';
import 'features/motorcycle/vulnurable_road_user/viewmodel/pedestrain_crossing_provider.dart';
import 'features/motorcycle/vulnurable_road_user/viewmodel/pedestrain_provider.dart';
import 'features/motorcycle/vulnurable_road_user/viewmodel/think_about_provider.dart';
import 'features/motorcycle/vulnurable_road_user/viewmodel/vulnerable_user.dart';
import 'features/motorcycle/vulnurable_road_user/viewmodel/vulnurable_road_user_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/Trams_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/bus_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/disabled_people_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/instructor_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/intro_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/large_vehicle_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/large_vehicle_provider2.dart';
import 'features/othertypepfvehilcle/viewmodel/meeting_the_standard_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/motercycle_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/thinkaboutprovider.dart';
import 'features/road_and_traffic_sign/viewmodel/controller.dart';
import 'features/rule_of_road/viewmodel/controller.dart';
import 'features/trafficsign/directiion_sign/viewmodel/direction_provider.dart';
import 'features/trafficsign/history_traffic_sign/viewmodel/history_sign_provider.dart';
import 'features/trafficsign/information_sign/repo/information_sign_repo.dart';
import 'features/trafficsign/information_sign/viewmodel/information_sign_provider.dart';
import 'features/trafficsign/keep_up_to_date/repo/keep_up_date_repo.dart';
import 'features/trafficsign/keep_up_to_date/viewmodel/keep_up_date_provider.dart';
import 'features/trafficsign/responsibility_traffic_sign/repo/responsibilty_sign_repo.dart';
import 'features/trafficsign/responsibility_traffic_sign/viewmodel/responsibilty_sign_provider.dart';
import 'features/trafficsign/road_works_sign/repo/road_work_repo.dart';
import 'features/trafficsign/road_works_sign/view/road_work_screen.dart';
import 'features/trafficsign/road_works_sign/viewmodel/road_work_provider.dart';
import 'features/trafficsign/sign_giving_order/repo/giving_order_repo.dart';
import 'features/trafficsign/sign_giving_order/viewmodel/giving_order_provider.dart';
import 'features/trafficsign/signing_system/repo/sign_system_repo.dart';
import 'features/trafficsign/signing_system/viewmodel/sign_system_provider.dart';
import 'features/trafficsign/warning_sign/repo/warning_sign_repo.dart';
import 'features/trafficsign/warning_sign/viewmodel/warning_sign_provider.dart';
import 'features/trafficsign/you_know_traffic_sign/repo/you_know_traffic_repo.dart';
import 'features/trafficsign/you_know_traffic_sign/viewmodel/you_know_traffic_provider.dart';
import 'features/vehicle_loading/viewmodel/controller.dart';
import 'features/vulnerable_road_user/viewmodel/controller.dart';
import 'highwaycode/animal_being_herded/repo/crossing_the_road_repo.dart';
import 'highwaycode/animal_being_herded/repo/junctions_repo.dart';
import 'highwaycode/animal_being_herded/repo/overview_repo.dart';
import 'highwaycode/animal_being_herded/repo/road_junction_repo.dart';
import 'highwaycode/animal_being_herded/repo/roundabouts_repo.dart';
import 'highwaycode/animal_being_herded/viewmodel/crossing_the_road_controller.dart';
import 'highwaycode/animal_being_herded/viewmodel/junctions_controller.dart';
import 'highwaycode/animal_being_herded/viewmodel/overview_controller.dart';
import 'highwaycode/animal_being_herded/viewmodel/road_junction_controller.dart';
import 'highwaycode/animal_being_herded/viewmodel/roundabouts_controller.dart';
import 'highwaycode/breakdown_and_incident/repo/additional_rules_for_motorways_repo.dart';
import 'highwaycode/breakdown_and_incident/viewmodel/additional_rules_for_motorways_controller.dart';
import 'highwaycode/breakdown_and_incident/viewmodel/breakdown_controller.dart';
import 'highwaycode/breakdown_and_incident/viewmodel/documentation_controller.dart';
import 'highwaycode/breakdown_and_incident/viewmodel/incident_involving_dangrous_goods_controller.dart';
import 'highwaycode/breakdown_and_incident/viewmodel/incidents_controller.dart';
import 'highwaycode/breakdown_and_incident/viewmodel/obstructions_controller.dart';
import 'highwaycode/breakdown_and_incident/viewmodel/place_of_relative_afety_controller.dart';
import 'highwaycode/direction_sign_on_road_and_motorways/viewmodel/information_signs_controller.dart';
import 'highwaycode/direction_sign_on_road_and_motorways/viewmodel/you_and_your_bicycle_controller.dart';
import 'highwaycode/driving_in_adverse_weather_condition/viewmodel/fog_controller.dart';
import 'highwaycode/driving_in_adverse_weather_condition/viewmodel/hot_weather_controller.dart';
import 'highwaycode/driving_in_adverse_weather_condition/viewmodel/icy_and_snowy_waether_controller.dart';
import 'highwaycode/driving_in_adverse_weather_condition/viewmodel/parking_at_controller.dart';
import 'highwaycode/driving_in_adverse_weather_condition/viewmodel/parking_controller.dart';
import 'highwaycode/driving_in_adverse_weather_condition/viewmodel/weating_and_parking_controller.dart';
import 'highwaycode/driving_in_adverse_weather_condition/viewmodel/wet_weather_controller.dart';
import 'highwaycode/driving_in_adverse_weather_condition/viewmodel/windy_weather_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/repo/vehicle_prohibited_using_road_pavement_repo.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/control_the_vehicle_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/country_road_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/driving_in_built_up_areas_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/dual_carriageways_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/flashing_headlight_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/junction_controlled_by_traffic_lights_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/lighting_requirement_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/line_lane_marketing_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/mobile_phone_vehicle_technology_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/multi_lane_carriageway_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/other_stopping_procedure_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/overtaking_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/overview_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/reversing_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/road_junction_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/roundabout_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/signal_carriageway_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/signal_controll_crossing_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/signal_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/speed_limit_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/the_driver_and_enviroment_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/the_road_user_law_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/turning_left_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/turning_right_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/using_the_road_controller.dart';
import 'highwaycode/general_rule_techniques_and_advice_for_all_driver_riders/viewmodel/vehicle_prohibited_using_road_pavement_controller.dart';
import 'highwaycode/introduction/repo/hierarchy_of_road_users_repo.dart';
import 'highwaycode/introduction/viewmodel/hierarchy_of_road_users_controller.dart';
import 'highwaycode/introduction/viewmodel/knowing_and_applying_rules_controller.dart';
import 'highwaycode/introduction/viewmodel/self_driving_vehicle_controller.dart';
import 'highwaycode/introduction/viewmodel/wording_of_highway_code_controller.dart';
import 'highwaycode/motorways/viewmodel/general_controller.dart';
import 'highwaycode/motorways/viewmodel/joining_the_motorway_controller.dart';
import 'highwaycode/motorways/viewmodel/lane_discipline_controller.dart';
import 'highwaycode/motorways/viewmodel/leaving_the_motorway_controller.dart';
import 'highwaycode/motorways/viewmodel/motorway_signal_controller.dart';
import 'highwaycode/motorways/viewmodel/on_the_motorway_controller.dart';
import 'highwaycode/motorways/viewmodel/overtaking_controller.dart';
import 'highwaycode/motorways/viewmodel/stopping_controller.dart';
import 'highwaycode/panelties/viewmodel/new_driver_controller.dart';
import 'highwaycode/panelties/viewmodel/other_consequence_of_offending_controller.dart';
import 'highwaycode/panelties/viewmodel/panalties_and_highway_code_controller.dart';
import 'highwaycode/panelties/viewmodel/panalty_points_disqualification_controller.dart';
import 'highwaycode/road_users_requiring_extra/viewmodel/motorcyclist_cyclist_controller.dart';
import 'highwaycode/road_users_requiring_extra/viewmodel/other_road_user_controller.dart';
import 'highwaycode/road_users_requiring_extra/viewmodel/other_vehicle_controller.dart';
import 'highwaycode/road_users_requiring_extra/viewmodel/overview_controller.dart';
import 'highwaycode/road_users_requiring_extra/viewmodel/padestrian_controller.dart';
import 'highwaycode/road_work_level_crossing_and_tramways/viewmodel/additional_rule_high_speed_road_controller.dart';
import 'highwaycode/road_work_level_crossing_and_tramways/viewmodel/level_crossing_controller.dart';
import 'highwaycode/road_work_level_crossing_and_tramways/viewmodel/overhead_electric_line_controller.dart';
import 'highwaycode/road_work_level_crossing_and_tramways/viewmodel/road_works_controller.dart';
import 'highwaycode/road_work_level_crossing_and_tramways/viewmodel/tramways_controller.dart';
import 'highwaycode/rule_about_animals/viewmodel/horse_drawn_vehicle_controller.dart';
import 'highwaycode/rule_about_animals/viewmodel/horse_rider_controller.dart';
import 'highwaycode/rule_about_animals/viewmodel/other_animal_controller.dart';
import 'highwaycode/rule_about_animals/viewmodel/riding_controller.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/viewmodel/alcohal_drugs_controller.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/viewmodel/before_setting_off_controller.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/viewmodel/fitness_to_drive_controller.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/viewmodel/moped_licence_requirement_controller.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/viewmodel/motorcycle_licence_requirement_controller.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/viewmodel/seat_belts_and_child_restraints_controller.dart';
import 'highwaycode/rule_for_driver_and_motorcyclist/viewmodel/vehicle_towing_and_loading_controller.dart';
import 'highwaycode/rule_for_motorcyclist/viewmodel/documents_controller.dart';
import 'highwaycode/rule_for_motorcyclist/viewmodel/general_guidance_controller.dart';
import 'highwaycode/rule_for_motorcyclist/viewmodel/learner_drivers_controller.dart';
import 'highwaycode/rule_for_motorcyclist/viewmodel/moped_licence_requirement1_controller.dart';
import 'highwaycode/rule_for_motorcyclist/viewmodel/moped_licence_requirement_controller.dart';
import 'highwaycode/rule_for_motorcyclist/viewmodel/motorcycle_licence_requirement1_controller.dart';
import 'highwaycode/rule_for_motorcyclist/viewmodel/motorcycle_licence_requirement_controller.dart';
import 'highwaycode/rule_for_pedestrain/viewmodel/crossing_controller.dart';
import 'highwaycode/rule_for_pedestrain/viewmodel/crossing_the_road_controller.dart';
import 'highwaycode/rule_for_pedestrain/viewmodel/general_guidance_controller.dart';
import 'highwaycode/rule_for_pedestrain/viewmodel/situation_needing_extra_care_controller.dart';
import 'highwaycode/rule_for_user_wheel_chair_scooter/viewmodel/on_pavements_controller.dart';
import 'highwaycode/rule_for_user_wheel_chair_scooter/viewmodel/on_the_road_controller.dart';
import 'highwaycode/rule_for_user_wheel_chair_scooter/viewmodel/powered_wheelchair_mobility_scooter_controller.dart';
import 'highwaycode/using_road/viewmodel/act_regulation_prior_controller.dart';
import 'highwaycode/using_road/viewmodel/the_road_user_and_law_controller.dart';
import 'highwaycode/vehicle_documentation_learner_driving_requirement/viewmodel/document_controller.dart';
import 'highwaycode/vehicle_documentation_learner_driving_requirement/viewmodel/learner_driver_controller.dart';
import 'highwaycode/vehicle_maintenance_safety_security/viewmodel/be_prepared_controller.dart';
import 'highwaycode/vehicle_maintenance_safety_security/viewmodel/bleeding_controller.dart';
import 'highwaycode/vehicle_maintenance_safety_security/viewmodel/burn_controller.dart';
import 'highwaycode/vehicle_maintenance_safety_security/viewmodel/deal_with_danger_controller.dart';
import 'highwaycode/vehicle_maintenance_safety_security/viewmodel/first_aid_on_road_controller.dart';
import 'highwaycode/vehicle_maintenance_safety_security/viewmodel/get_help_controller.dart';
import 'highwaycode/vehicle_maintenance_safety_security/viewmodel/help_those_involved_controller.dart';
import 'highwaycode/vehicle_maintenance_safety_security/viewmodel/provide_emergency_care_controller.dart';
import 'highwaycode/vehicle_maintenance_safety_security/viewmodel/safety_code_for_driver_controller.dart';
import 'highwaycode/vehicle_maintenance_safety_security/viewmodel/vehicle_maintaince_controller.dart';
import 'highwaycode/vehicle_maintenance_safety_security/viewmodel/vehicle_security_controller.dart';
import 'lorry/accident_handling_screen/repo/question_repo.dart';
import 'lorry/accident_handling_screen/viewmodel/question_controller.dart';
import 'lorry/braking_system_screen/repo/question_repo.dart';
import 'lorry/braking_system_screen/viewmodel/question_controller.dart';
import 'lorry/carrying_passenger_Screen/repo/question_repo.dart';
import 'lorry/carrying_passenger_Screen/viewmodel/question_controller.dart';
import 'lorry/document_screen/repo/question_repo.dart';
import 'lorry/document_screen/viewmodel/question_controller.dart';
import 'lorry/driver_hours_rest_peroid_screen/repo/question_repo.dart';
import 'lorry/driver_hours_rest_peroid_screen/viewmodel/question_controller.dart';
import 'lorry/enviromental_issue_screen/repo/question_repo.dart';
import 'lorry/enviromental_issue_screen/viewmodel/question_controller.dart';
import 'lorry/getting_start_Screen/repo/about_theory_repo.dart';
import 'lorry/getting_start_Screen/repo/apply_licence_repo.dart';
import 'lorry/getting_start_Screen/repo/driver_certification_repo.dart';
import 'lorry/getting_start_Screen/repo/medical_requirement_repo.dart';
import 'lorry/getting_start_Screen/repo/on_the_road_repo.dart';
import 'lorry/getting_start_Screen/repo/other_study_repo.dart';
import 'lorry/getting_start_Screen/repo/preparing_for_test_repo.dart';
import 'lorry/getting_start_Screen/viewmodel/about_theory_controller.dart';
import 'lorry/getting_start_Screen/viewmodel/apply_licence.dart';
import 'lorry/getting_start_Screen/viewmodel/driver_certification_controller.dart';
import 'lorry/getting_start_Screen/viewmodel/medical_requirement_controller.dart';
import 'lorry/getting_start_Screen/viewmodel/on_the_road_controller.dart';
import 'lorry/getting_start_Screen/viewmodel/other_study_controller.dart';
import 'lorry/getting_start_Screen/viewmodel/preparing_for_test_controller.dart';
import 'lorry/leaving_vehicle/repo/question_repo.dart';
import 'lorry/leaving_vehicle/viewmodel/question_coontroller.dart';
import 'lorry/other_road_users_Screen/repo/question_repo.dart';
import 'lorry/other_road_users_Screen/viewmodel/question_controller.dart';
import 'lorry/restricted_view/repo/question_repo.dart';
import 'lorry/restricted_view/viewmodel/question_controller.dart';
import 'lorry/the_driver_system/repo/question_repo.dart';
import 'lorry/the_driver_system/viewmodel/question_controller.dart';
import 'lorry/the_road_Screen/repo/question_repo.dart';
import 'lorry/the_road_Screen/viewmodel/question_controller.dart';
import 'lorry/traffic_sign_screen/repo/question_repo.dart';
import 'lorry/traffic_sign_screen/viewmodel/question_controller.dart';
import 'lorry/vehicle_condition_screen/repo/question_repo.dart';
import 'lorry/vehicle_condition_screen/viewmodel/question_controller.dart';
import 'lorry/vehicle_loading_Screen/repo/question_repo.dart';
import 'lorry/vehicle_loading_Screen/viewmodel/question_controller.dart';
import 'lorry/vehicle_weight_dimension_screen/repo/question_repo.dart';
import 'lorry/vehicle_weight_dimension_screen/viewmodel/question_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Attitude>(create: (_) => Attitude()),
        ChangeNotifierProvider<IntroductionController>(
            create: (_) => IntroductionController()),
        ChangeNotifierProvider<Controller>(create: (_) => Controller()),
        ChangeNotifierProvider<RuleRoadController>(
            create: (_) => RuleRoadController()),
        ChangeNotifierProvider<RoadSignController>(
            create: (_) => RoadSignController()),
        ChangeNotifierProvider<EssentialDocumentsController>(
            create: (_) => EssentialDocumentsController()),
        ChangeNotifierProvider<IncidentController>(
            create: (_) => IncidentController()),
        ChangeNotifierProvider<VehicleLoadingProvider>(
            create: (_) => VehicleLoadingProvider()),
        ChangeNotifierProvider<VulnerableController>(
            create: (_) => VulnerableController()),
        ChangeNotifierProvider<BusProvider>(create: (_) => BusProvider()),
        ChangeNotifierProvider<disabledProvider>(
            create: (_) => disabledProvider()),
        ChangeNotifierProvider<instructorProvider>(
            create: (_) => instructorProvider()),
        ChangeNotifierProvider<OtherVehicleIntroProvider>(
            create: (_) => OtherVehicleIntroProvider()),
        ChangeNotifierProvider<LargeVehicleProvider>(
            create: (_) => LargeVehicleProvider()),
        ChangeNotifierProvider<largeVehicleProvider2>(
            create: (_) => largeVehicleProvider2()),
        ChangeNotifierProvider<meetingstandardProvider>(
            create: (_) => meetingstandardProvider()),
        ChangeNotifierProvider<OtherVehicleMotercycleProvider>(
            create: (_) => OtherVehicleMotercycleProvider()),
        ChangeNotifierProvider<ThinkaboutProvider>(
            create: (_) => ThinkaboutProvider()),
        ChangeNotifierProvider<TramsProvider>(create: (_) => TramsProvider()),
        ChangeNotifierProvider<Attitude>(create: (_) => Attitude()),
        ChangeNotifierProvider<AlertController>(
            create: (_) => AlertController()),
        ChangeNotifierProvider<QuizProvider>(create: (_) => QuizProvider()),
        ChangeNotifierProvider<AttitudeQuizProvider>(
            create: (_) => AttitudeQuizProvider()),
        ChangeNotifierProvider<SafetyVehicleQuizProvider>(
            create: (_) => SafetyVehicleQuizProvider()),
        ChangeNotifierProvider<SafetyMarginQuizProvider>(
            create: (_) => SafetyMarginQuizProvider()),
        ChangeNotifierProvider<HazardAwarenessQuizProvider>(
            create: (_) => HazardAwarenessQuizProvider()),
        ChangeNotifierProvider<VulnerableRoadUserQuizProvider>(
            create: (_) => VulnerableRoadUserQuizProvider()),
        ChangeNotifierProvider<OtherTypeVehicleProvider>(
            create: (_) => OtherTypeVehicleProvider()),
        ChangeNotifierProvider<VehicleHandlingQuizProvider>(
            create: (_) => VehicleHandlingQuizProvider()),
        ChangeNotifierProvider<MotoWayDrivingQuizProvider>(
            create: (_) => MotoWayDrivingQuizProvider()),
        ChangeNotifierProvider<RuleOfRoadQuizProvider>(
            create: (_) => RuleOfRoadQuizProvider()),
        ChangeNotifierProvider<VehicleLoadingQuizProvider>(
            create: (_) => VehicleLoadingQuizProvider()),
        ChangeNotifierProvider<IncidentQuizProvider>(
            create: (_) => IncidentQuizProvider()),
        ChangeNotifierProvider<EssentialDocumentQuizProvider>(
            create: (_) => EssentialDocumentQuizProvider()),
        ChangeNotifierProvider<RoadTrafficSignQuizProvider>(
            create: (_) => RoadTrafficSignQuizProvider()),
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<ResultController>(
            create: (_) => ResultController()),
        ChangeNotifierProvider<AllCategoriesQuizProvider>(
            create: (_) => AllCategoriesQuizProvider()),
        ChangeNotifierProvider<CluesProvider>(create: (_) => CluesProvider()),
        ChangeNotifierProvider<FactorEffectingProvider>(
            create: (_) => FactorEffectingProvider()),
        ChangeNotifierProvider<MotorcycleHazardProvider>(
            create: (_) => MotorcycleHazardProvider()),
        ChangeNotifierProvider<LearningSeeProvider>(
            create: (_) => LearningSeeProvider()),
        ChangeNotifierProvider<LookingButNotSeeingProvider>(
            create: (_) => LookingButNotSeeingProvider()),
        ChangeNotifierProvider<MotorcycleRoadWeatherConditionsProvider>(
            create: (_) => MotorcycleRoadWeatherConditionsProvider()),
        ChangeNotifierProvider<ScanningProvider>(
            create: (_) => ScanningProvider()),
        ChangeNotifierProvider<SeeingHazardProvider>(
            create: (_) => SeeingHazardProvider()),
        ChangeNotifierProvider<MotorcycleStaticHazardProvider>(
            create: (_) => MotorcycleStaticHazardProvider()),
        ChangeNotifierProvider<UnderstandingHazardsProvider>(
            create: (_) => UnderstandingHazardsProvider()),
        ChangeNotifierProvider<WhatIfProvider>(create: (_) => WhatIfProvider()),
        ChangeNotifierProvider<MotorcycleYourProvider>(
            create: (_) => MotorcycleYourProvider()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<FactorEffectingProvider>(
            create: (_) => FactorEffectingProvider()),
        //add
        ChangeNotifierProvider<AlertnessNotifier>(
            create: (_) => AlertnessNotifier(AlertnessRepository())),


        ChangeNotifierProvider<HazardManagementProvider>(
            create: (_) => HazardManagementProvider()),

        ChangeNotifierProvider<RespondingToHazardsProvider>(
            create: (_) => RespondingToHazardsProvider()),

        //ReviewingYourDrivingProvider
        ChangeNotifierProvider<ReviewingYourDrivingProvider>(
            create: (_) => ReviewingYourDrivingProvider()),

        //HazardQuizProvider
        ChangeNotifierProvider<HazardQuizProvider>(
            create: (_) => HazardQuizProvider()),

        // m allert
        ChangeNotifierProvider<AnticipationProvider>(
            create: (_) => AnticipationProvider(RoadAwarenessRepository())),
        ChangeNotifierProvider(create: (_) => AvoidingTirednessProvider()),
        ChangeNotifierProvider(create: (_) => BeingSeenProvider()),
        ChangeNotifierProvider(create: (_) => DistractionProvider()),
        ChangeNotifierProvider(create: (_) => KeepingWarmProvider()),
        ChangeNotifierProvider(
            create: (_) => MeetingTheStandardsProviderMotorcycleAllert()),
        ChangeNotifierProvider(
            create: (_) =>
                ObservationAwarenessNotifier(ObservationAwarenessRepository())),
        ChangeNotifierProvider(create: (_) => StayFocusProvider()),
        ChangeNotifierProvider(create: (_) => ThingsToDiscussProviderAllert()),
        ChangeNotifierProvider(create: (_) => ThinkAboutProviderAllert()),

        // m attitude

        ChangeNotifierProvider(
            create: (_) => AnimalsOnTheRoadProviderAttitude()),
        ChangeNotifierProvider(create: (_) => AttitudeProviderAttitude()),
        ChangeNotifierProvider(
            create: (_) => TrainerDiscussionProviderAttitude()),
        ChangeNotifierProvider(
            create: (_) => FollowingSafelyProviderAttitude()),
        ChangeNotifierProvider(
            create: (_) => GivingPriorityToOthersProviderAttitude()),
        ChangeNotifierProvider(create: (_) => GoodMannersProviderAttitude()),
        ChangeNotifierProvider(create: (_) => DazzleProviderAttitude()),
        ChangeNotifierProvider(create: (_) => StandardsProviderAttitude()),
        ChangeNotifierProvider<CrossingProviderAttitudeMotorcycle>(
            create: (_) => CrossingProviderAttitudeMotorcycle()),
        ChangeNotifierProvider(create: (_) => CrossingInfoProviderAttitude()),
        ChangeNotifierProvider(create: (_) => ThinkAboutProviderAttitude()),

        // s safety
        ChangeNotifierProvider(
            create: (_) =>
                AvoidingCongestionNotifier(AvoidingCongestionRepository())),
        ChangeNotifierProvider(
            create: (_) => BeingAwareOfTheEnvironmentProvider()),
        ChangeNotifierProvider(
            create: (_) => CarryingPassengersAndLoadsProvider()),
        ChangeNotifierProvider(create: (_) => ClothNotifier()),
        ChangeNotifierProvider(create: (_) => WheelBalancingProvider()),
        ChangeNotifierProvider(
            create: (_) => TrainerDiscussionNotifierSafety()),
        ChangeNotifierProvider(create: (_) => NoisePollutionProvider()),
        ChangeNotifierProvider(create: (_) => MotorcycleMaintenanceNotifier()),
        ChangeNotifierProvider(create: (_) => MotorcycleSafetyNotifierSafety()),
        ChangeNotifierProvider(create: (_) => ParkingSafelyNotifier()),
        ChangeNotifierProvider(create: (_) => SafetyYourMotorcycleNotifier()),
        ChangeNotifierProvider(create: (_) => SecurityNotifier()),
        ChangeNotifierProvider(create: (_) => SeeingAndBeingSeenNotifier()),
        ChangeNotifierProvider(create: (_) => ThinkAboutNotifierSafety()),

        // s safety margin
        ChangeNotifierProvider(create: (_) => AntiLockBrakingSystemNotifier()),
        ChangeNotifierProvider(create: (_) => ContraflowSystemNotifier()),
        ChangeNotifierProvider(
            create: (_) =>
                SafetyMarginDiscussNotifier(SafetyMarginDiscussRepository())),
        ChangeNotifierProvider(
            create: (_) => MeetingTheStandardsNotifierSafety()),
        ChangeNotifierProvider(create: (_) => NightRidingNotifier()),
        ChangeNotifierProvider(create: (_) => SafetyMarginNotifier()),
        ChangeNotifierProvider(create: (_) => SafetyMargin1Notifier()),
        ChangeNotifierProvider(create: (_) => SkiddingInfoNotifier()),
        ChangeNotifierProvider(
            create: (_) =>
                StoppingDistanceNotifier(StoppingDistanceRepository())),
        ChangeNotifierProvider(
            create: (_) =>
                ThinkAboutProviderMargin(SafetyMarginThinkAboutRepository())),
        ChangeNotifierProvider(
            create: (_) =>
                WeatherConditionNotifier(WeatherConditionRepository())),

        // h hazrad awarness
        //MotorwaysAndDualCarriagewaysProvider11
        ChangeNotifierProvider(
            create: (_) => HazardAwarenessProvider11(
                MotorCycleHazardAwarenessRepository())),
        ChangeNotifierProvider(
            create: (_) => MotorwaysAndDualCarriagewaysProvider11(
                MotorwaysAndDualCarriagewaysRepository())),
        ChangeNotifierProvider(
            create: (_) => MotorcycleHazardProviderAwareness(
                MotorcycleHazardawarenessRepository())),
        ChangeNotifierProvider(
            create: (_) => HazardousLoadProvider(HazardousLoadRepository())),
        ChangeNotifierProvider(
            create: (_) => HazardAwarenessMeetingStandardProvider(
                HazardAwarenessMeetingStandardRepository())),
        ChangeNotifierProvider(
            create: (_) => MovingHazardsProvider(MovingHazardsRepository())),
        ChangeNotifierProvider(
            create: (_) => RoadConditionProvider(RoadConditionRepository())),
        ChangeNotifierProvider(
            create: (_) => RoadSignsProvider(RoadSignsRepository())),
        ChangeNotifierProvider(
            create: (_) => StaticHazardProvider(StaticHazardRepository())),
        ChangeNotifierProvider(
            create: (_) => HazardAwarenessDiscussProvider(
                HazardAwarenessThingsDiscussRepository())),
        ChangeNotifierProvider(
            create: (_) => HazardAwarenessThinkAboutProvider(
                HazardAwarenessThinkAboutRepository())),
        ChangeNotifierProvider(
            create: (_) => YourselfProvider(AwarenessHazardRepository())),

        // v vulnerable
        ChangeNotifierProvider(
            create: (_) =>
                AnimalVulnerableUserProvider(AnimalVulnerableUserRepository())),
        ChangeNotifierProvider(
            create: (_) => CyclistProvider(CyclistRepository())),
        ChangeNotifierProvider(
            create: (_) => DiscussionPracticeProviderVulnerable(
                DiscussionPracticeRepositoryVal())),
        ChangeNotifierProvider(
            create: (_) => DriverProvider(DriverRepository())),
        ChangeNotifierProvider(
            create: (_) => MeetingStandardsProviderVulnerable(
                MeetingStandardsRepositoryVulnurable())),
        ChangeNotifierProvider(
            create: (_) => OlderAndDisabledPedestriansProvider(
                OlderAndDisabledPedestriansRepository())),
        ChangeNotifierProvider(
            create: (_) =>
                OtherMotorcyclistsProvider(OtherMotorcyclistsRepository())),
        ChangeNotifierProvider(
            create: (_) =>
                PedestrianCrossingProvider(PedestrianCrossingRepository())),
        ChangeNotifierProvider(
            create: (_) => PedestrianProvider(PedestrianRepositoryVal())),
        ChangeNotifierProvider(
            create: (_) =>
                ThinkAboutProviderVal(DiscussionQuestionsRepositoryVal())),
        ChangeNotifierProvider(
            create: (_) => VulnerableRoadUsersProvider1(
                VulnerableRoadUsersRepositoryval())),
        ChangeNotifierProvider(
            create: (_) =>
                VulnerableRoadUserProvider(VulnerableRoadUserRepository())),

        // o other type vehicle
        ChangeNotifierProvider(
            create: (_) => BusAndTramInfoProvider(BusAndTramInfoRepository())),
        ChangeNotifierProvider(
            create: (_) => DiscussionPracticeInfoNotifierType()),
        ChangeNotifierProvider(create: (_) => LargeVehicleNotifier()),
        ChangeNotifierProvider(create: (_) => MeetingStandardsNotifierType()),
        ChangeNotifierProvider(create: (_) => MotorcycleInfoNotifier()),
        ChangeNotifierProvider(create: (_) => OtherVehicleNotifier()),
        ChangeNotifierProvider(create: (_) => PoweredVehicleInfoNotifier()),
        ChangeNotifierProvider(create: (_) => ThinkAboutInfoNotifierType()),

        // m motorcycle handling

        ChangeNotifierProvider(create: (_) => WeatherConditionsNotifier()),
        ChangeNotifierProvider(
            create: (_) => TrainerDiscussionPracticeNotifier()),
        ChangeNotifierProvider(create: (_) => FogInfoNotifier()),
        ChangeNotifierProvider(create: (_) => MotorcycleControlInfoNotifier()),
        ChangeNotifierProvider(create: (_) => MeetingStandardsInfoNotifier()),
        ChangeNotifierProvider(create: (_) => MotorcycleHandlingNotifier()),
        ChangeNotifierProvider(create: (_) => RidingAtNightNotifier()),
        ChangeNotifierProvider(
            create: (_) => ThinkAboutNotifierMotorHandling()),
        ChangeNotifierProvider(create: (_) => TrafficCalmingNotifier()),

        // m motorway riding
        ChangeNotifierProvider(create: (_) => TrainerPracticeProviderRiding()),
        ChangeNotifierProvider(
            create: (_) => LaneMarkingNotifier(LaneMarkingRepository())),
        ChangeNotifierProvider(
            create: (_) =>
                MotorwaySafetyNotifier(MotorwaySafetyRepositoryRiding())),
        ChangeNotifierProvider(
            create: (_) => MotorwayRidingNotifier(MotorwayRidingRepository())),
        ChangeNotifierProvider(create: (_) => TrafficManagementProvider()),
        ChangeNotifierProvider(create: (_) => MotorwayRidingProvider()),
        ChangeNotifierProvider(create: (_) => SpeedLimitQuestionProvider()),
        ChangeNotifierProvider(
            create: (_) => EmergencyTelephonePositioningProvider()),
        ChangeNotifierProvider(create: (_) => ThinkAboutProvider()),

        // r rule of road
        ChangeNotifierProvider(create: (_) => RidingGuideProvider()),
        ChangeNotifierProvider(
            create: (_) =>
                SpeedLimitNotifierRule(DiscussWithTrainerRuleRepo())),
        ChangeNotifierProvider(create: (_) => LaneAndJunctionProvider()),
        ChangeNotifierProvider(create: (_) => LevelCrossingProvider()),
        ChangeNotifierProvider(
            create: (_) => MeetingStandardsNotifierRule(
                repository: MeetingStandardsRepository())),
        ChangeNotifierProvider(
            create: (_) => OvertakingCrossingsNotifier(
                OvertakingCrossingsRepository(_firestore))),
        ChangeNotifierProvider(
            create: (_) => RulesOfTheRoadNotifier(RulesOfTheRoadRepository())),
        ChangeNotifierProvider(
            create: (_) => SpeedLimitsNotifier(
                repository: SpeedLimitsRepository(firestore: _firestore))),
        ChangeNotifierProvider(
            create: (_) => StoppingAndParkingNotifier(
                repository:
                    StoppingAndParkingRepository(firestore: _firestore))),
        ChangeNotifierProvider(create: (_) => ThinkRule(ThinkAboutRepoRule())),

        // r road and traffic sign
        ChangeNotifierProvider(
            create: (_) => StandardsProviderRoadTraffic(
                repository: StandardsRepositorySign(firestore: _firestore))),
        ChangeNotifierProvider(
            create: (_) => RoadLanesProvider(
                repository: RoadLanesRepository(firestore: _firestore))),
        ChangeNotifierProvider(create: (_) => RoadMarkingsNotifier()),
        ChangeNotifierProvider(
            create: (_) => RoadSignsProviderRoadTraffic(
                repository: RoadSignsRepositorySing(firestore: _firestore))),
        ChangeNotifierProvider(
            create: (_) => SignalInfoProvider(
                repository: SignalInfoRepository(firestore: _firestore))),
        ChangeNotifierProvider(create: (_) => SignSignProvider()),
        ChangeNotifierProvider(
            create: (_) =>
                TrainerPractiseProvider(TrainerPractiseRepository())),
        ChangeNotifierProvider(
            create: (_) =>
                ThinkAboutNotifierSign(ThinkAboutRepository(_firestore))),
        ChangeNotifierProvider(
            create: (_) => TrafficLightsWarningNotifier(
                TrafficLightsWarningRepository(_firestore))),

        // E essential document
        ChangeNotifierProvider(
            create: (_) => EssentialDocumentsNotifier(
                EssentialDocumentsRepository(_firestore))),
        ChangeNotifierProvider(
            create: (_) => EssentialDocumentsDetailsNotifier(
                EssentialDocumentsDetailsRepository(_firestore))),
        ChangeNotifierProvider(
            create: (_) => InsuranceDetailsNotifier(
                InsuranceDetailsRepository(_firestore))),
        ChangeNotifierProvider(create: (_) => MeetingStandardDocument()),
        ChangeNotifierProvider(
            create: (_) =>
                MotTestDetailsNotifier(MotTestDetailsRepository(_firestore))),
        ChangeNotifierProvider(create: (_) => MotorcycleLicenceProvider()),
        ChangeNotifierProvider(create: (_) => MotorcycleInfoProvider()),
        ChangeNotifierProvider(create: (_) => ThingDiscussProviderDocument()),
        ChangeNotifierProvider(
            create: (_) => ThinkAboutMotorcycleInfoProvider()),

        // i m incident
        ChangeNotifierProvider(create: (_) => BreakdownProvider()),
        ChangeNotifierProvider(create: (_) => FirstAidProvider()),
        ChangeNotifierProvider(
            create: (_) =>
                IncidentNotifier(repository: IncidentRepository(_firestore))),
        ChangeNotifierProvider(
            create: (_) => StandardsNotifier(
                repository: StandardsRepositoryIncident(_firestore))),
        ChangeNotifierProvider(
            create: (_) => IncidentReportNotifier(
                repository: IncidentReportRepository(_firestore))),
        ChangeNotifierProvider(
            create: (_) => TunnelSafetyNotifier(
                repository: TunnelSafetyRepository(_firestore))),
        ChangeNotifierProvider(
            create: (_) => IncidentStopNotifier(
                repository: IncidentRepository1(_firestore))),
        ChangeNotifierProvider(
            create: (_) => TrainerPracticeNotifierIncident(
                repository: TrainerPracticeRepository(_firestore))),
        ChangeNotifierProvider(
            create: (_) => ThinkAboutNotifierIncidentMotorcycle(
                repository: ThinkAboutRepositoryIncident(_firestore))),
        ChangeNotifierProvider(
            create: (_) => WarningIncidentNotifier(
                repository: WarningIncidentRepository(_firestore))),

        // m motorcycle loading

        ChangeNotifierProvider(
            create: (_) => MotorcycleStabilityNotifier(
                repository: MotorcycleStabilityRepository(_firestore))),
        ChangeNotifierProvider(
            create: (_) => MotorcyclePassengerNotifier(
                repository: MotorcyclePassengerRepository(_firestore))),
        ChangeNotifierProvider(
            create: (_) => MotorcycleLoadingNotifier(
                repository: MotorcycleLoadingRepository(_firestore))),
        ChangeNotifierProvider(
            create: (_) => PillionPasSideCarsengerNotifier(
                repository: PillionPassengerRepository(_firestore))),
        ChangeNotifierProvider(
            create: (_) => TrainerDiscussionNotifierLoading(
                repository: TrainerDiscussionRepositoryLoading(_firestore))),
        ChangeNotifierProvider(
            create: (_) => ThinkAboutNotifierLoading(
                repository: ThinkAboutRepositoryLoading(_firestore))),
        ChangeNotifierProvider(
            create: (_) => TowingTrailerNotifier(
                repository: TowingTrailerRepository(_firestore))),

        // motorcycle quiz
        ChangeNotifierProvider(
            create: (_) => MotorcycleVulnerableQuizProvider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleVehicleLoadingQuizProvider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleSafetyMarginQuizProvider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleSafetyMotorcycleQuizProvider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleRuleOfRoadQuizProvider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleRoadTrafficQuizProvider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleOtherTypeQuizProvider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleMotorcycleDrivingQuizProvider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleMotorcycleHandlingQuizProvider()),
        ChangeNotifierProvider(create: (_) => MotorcycleIncidentQuizProvider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleHazardAwarenessQuizProvider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleEssentialQuizProvider()),
        ChangeNotifierProvider(create: (_) => MotorcycleAttitudeQuizProvider()),
        ChangeNotifierProvider(create: (_) => MotorcycleAllertQuizProvider()),

        /// video player provider
        ChangeNotifierProvider(create: (_) => VideoProvider()),

        // lorry
        ChangeNotifierProvider(
          create: (_) => LorryAccidentHandlingProvider(
            repository: LorryAccidentHandlingRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryBrakingSystemProvider(
            repository: LorryBrakingSystemRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryCarryingPassengerProvider(
            repository: LorryCarryingPassengerRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryDocumentProvider(
            repository: LorryDocumentRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryDriverHoursRestProvider(
            repository:
                LorryDriverHourRestPeroidRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryEnviromentalIssueProvider(
            repository: LorryEnviromentalIssueRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryLeavingVehicleProvider(
            repository: LorryLeavingVehicleRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryOtherRoadUsersProvider(
            repository: LorryOtherRoadUserRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryRestrictedProvider(
            repository: LorryRestricedViewRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryTheDriverSystemProvider(
            repository: LorryTheDriverSystemRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryTheRoadScreenProvider(
            repository: LorryTheRoadScreenRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryTrafficSignProvider(
            repository: LorryTrafficSignRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryVehicleConditionProvider(
            repository: LorryVehicleConditionRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryVehicleLoadingProvider(
            repository: LorryVehicleLooadingRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LorryVehicleWeightDimensionProvider(
            repository:
                LorryVehicleWeightDimensionRepository(firestore: _firestore),
          ),
        ),

        ChangeNotifierProvider(
            create: (_) => GettingInfoProvider(GettingInfoRepository())),
        ChangeNotifierProvider(
            create: (_) => ApplyLicenceProvider(ApplyLicenceRepository())),
        ChangeNotifierProvider(
            create: (_) => DriverCertificationControllerProvider(
                driverCertificationRepository())),
        ChangeNotifierProvider(
            create: (_) => MedicalRequirementControllerProvider(
                MedicalRequirementRepository())),
        ChangeNotifierProvider(
            create: (_) => OnTheRoadControllerProvider(OnTheRoadRepository())),
        ChangeNotifierProvider(
            create: (_) =>
                OtherStudyControllerProvider(OtherStudyRepository())),
        ChangeNotifierProvider(
            create: (_) => PreparingForTestControllerProvider(
                PreparingForTestRepository())),
        //  highway code
        ChangeNotifierProvider(
            create: (_) => PointsProvider(CrossingTheRoadRepo())),
        ChangeNotifierProvider(
            create: (_) => JunctionProvider(JunctionRepository())),
        ChangeNotifierProvider(
            create: (_) => OverviewControllerProvider(OverviewRepository11())),
        ChangeNotifierProvider(
            create: (_) => PointsProvider11(RoadJunctionRepository())),
        ChangeNotifierProvider(
            create: (_) => JunctionTextProvider(RoundaboutsRepository())),
        ChangeNotifierProvider(
            create: (_) =>
                MotorwayGuideProvider(AdditionalRulesForMotorwaysRepository())),
        ChangeNotifierProvider(create: (_) => BreakdownPointsProvider()),
        ChangeNotifierProvider(create: (_) => DocumentationProvider()),
        ChangeNotifierProvider(create: (_) => IncidentAdviceProvider()),
        ChangeNotifierProvider(create: (_) => IncidentAdviceProvider11()),
        ChangeNotifierProvider(create: (_) => ObstructionsNotifier()),
        ChangeNotifierProvider(create: (_) => PlaceOfRelativeSafetyProvider()),
        ChangeNotifierProvider(create: (_) => InformationSignProvider()),
        ChangeNotifierProvider(create: (_) => YouAndYourBicycleProvider()),
        ChangeNotifierProvider(create: (_) => FogProvider()),
        ChangeNotifierProvider(create: (_) => HotWeatherProvider()),
        ChangeNotifierProvider(create: (_) => IcySnowyWeatherProvider()),
        ChangeNotifierProvider(create: (_) => ParkingAtNightProvider()),
        ChangeNotifierProvider(create: (_) => HighwayParkingProvider()),
        ChangeNotifierProvider(create: (_) => WaitingAndParkingProvider()),
        ChangeNotifierProvider(create: (_) => HighwayWetWeatherProvider()),
        ChangeNotifierProvider(create: (_) => WindyWeatherProvider()),
        ChangeNotifierProvider(create: (_) => ControlOfTheVehicleProvider()),
        ChangeNotifierProvider(create: (_) => CountryRoadsProvider()),
        ChangeNotifierProvider(create: (_) => DrivingInBuiltUpAreaProvider()),
        ChangeNotifierProvider(create: (_) => DualCarriagewaysProvider()),
        ChangeNotifierProvider(create: (_) => FlashingHeadlightsProvider()),
        ChangeNotifierProvider(
            create: (_) => JunctionsControlledByTrafficLightsProvider()),
        ChangeNotifierProvider(create: (_) => LightingRequirementProvider()),
        ChangeNotifierProvider(create: (_) => LinesAndLaneMarkingsProvider()),
        ChangeNotifierProvider(create: (_) => MobilePhonesProvider()),
        ChangeNotifierProvider(create: (_) => MultiLaneCarriagewaysProvider()),
        ChangeNotifierProvider(
            create: (_) => OtherStoppingProceduresProvider()),
        ChangeNotifierProvider(create: (_) => HighwayOvertakingProvider()),
        ChangeNotifierProvider(create: (_) => HighwayOverviewProvider()),
        ChangeNotifierProvider(create: (_) => HighwayReversingProvider()),
        ChangeNotifierProvider(create: (_) => RoadJunctionsProvider()),
        ChangeNotifierProvider(create: (_) => HighwayRoundaboutsProvider()),
        ChangeNotifierProvider(create: (_) => SignalCarriagewayProvider()),
        ChangeNotifierProvider(
            create: (_) => SignalControlledCrossingsProvider()),
        ChangeNotifierProvider(create: (_) => HighwaySignalsProvider()),
        ChangeNotifierProvider(create: (_) => HighwaySpeedLimitsProvider()),
        ChangeNotifierProvider(
            create: (_) => TheDriverAndEnvironmentProvider()),
        ChangeNotifierProvider(create: (_) => TheRoadUserAndTheLawProvider()),
        ChangeNotifierProvider(create: (_) => HighwayTurningLeftProvider()),
        ChangeNotifierProvider(create: (_) => HighwayTurningRightProvider()),
        ChangeNotifierProvider(create: (_) => HighwayUsingRoadProvider()),
        ChangeNotifierProvider(
            create: (_) =>
                ProhibitedVehicleProvider(ProhibitedVehicleRepository())),

        ChangeNotifierProvider(
            create: (_) => HierarchyProvider(HierarchyRepository())),
        ChangeNotifierProvider(
            create: (_) => KnowingAndApplyingRulesController()),
        ChangeNotifierProvider(create: (_) => SelfDrivingProvider()),
        ChangeNotifierProvider(create: (_) => HighwayCodeProvider123()),
        ChangeNotifierProvider(create: (_) => HighwayGeneralProvider()),
        ChangeNotifierProvider(create: (_) => JoiningMotorwayProvider()),
        ChangeNotifierProvider(create: (_) => HighwayLaneDisciplineProvider()),
        ChangeNotifierProvider(create: (_) => LeavingMotorwayProvider()),
        ChangeNotifierProvider(create: (_) => HighwayMotorwaySignalsProvider()),
        ChangeNotifierProvider(create: (_) => HighwayMotorwayProvider()),
        ChangeNotifierProvider(create: (_) => HighwayOvertakingProvider11()),
        ChangeNotifierProvider(create: (_) => HighwayStoppingProvider()),
        ChangeNotifierProvider(create: (_) => HighwayNewDriversProvider()),
        ChangeNotifierProvider(
            create: (_) => OtherConsequencesOfOffendingProvider()),
        ChangeNotifierProvider(
            create: (_) => PenaltiesAndHighwayCodeProvider()),
        ChangeNotifierProvider(
            create: (_) => PenaltyPointsAndDisqualificationProvider()),
        ChangeNotifierProvider(
            create: (_) => MotorcyclistsAndCyclistsProvider()),
        ChangeNotifierProvider(create: (_) => HighwayOtherRoadUsersProvider()),
        ChangeNotifierProvider(create: (_) => HighwayOtherVehiclesProvider()),
        ChangeNotifierProvider(create: (_) => HighwayCodeOverviewProvider()),
        ChangeNotifierProvider(create: (_) => HighwayPedestriansProvider()),
        ChangeNotifierProvider(
            create: (_) => AdditionalRulesHighSpeedRoadsProvider()),
        ChangeNotifierProvider(create: (_) => HighwayLevelCrossingsProvider()),
        ChangeNotifierProvider(create: (_) => OverheadElectricLinesProvider()),
        ChangeNotifierProvider(create: (_) => HighwaycodeRoadWorksProvider()),
        ChangeNotifierProvider(create: (_) => HighwaycodeTramwaysProvider()),
        ChangeNotifierProvider(create: (_) => HorseDrawnVehiclesProvider()),
        ChangeNotifierProvider(create: (_) => HighwayHorseRidersProvider()),
        ChangeNotifierProvider(
            create: (_) => HighwayCodeOtherAnimalsProvider()),
        ChangeNotifierProvider(create: (_) => HighwayCodeRidingProvider()),
        ChangeNotifierProvider(
            create: (_) => HighwayCodeAlcoholDrugsProvider()),
        ChangeNotifierProvider(create: (_) => BeforeSettingOffProvider()),
        ChangeNotifierProvider(create: (_) => FitnessToDriveProvider()),
        ChangeNotifierProvider(
            create: (_) => MopedLicenceRequirementsProvider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleLicenceRequirementsProvider()),
        ChangeNotifierProvider(
            create: (_) => SeatBeltsAndChildRestraintsProvider()),
        ChangeNotifierProvider(
            create: (_) => VehicleTowingAndLoadingProvider()),
        ChangeNotifierProvider(create: (_) => HighwayDocumentProvider11()),
        ChangeNotifierProvider(
            create: (_) => HighwayCodeGeneralGuidanceProvider()),
        ChangeNotifierProvider(
            create: (_) => HighwayCodeLearnerDriversProvider()),
        ChangeNotifierProvider(
            create: (_) => MopedLicenseRequirementsProvider()),
        ChangeNotifierProvider(
            create: (_) => MopedLicenceRequirements11Provider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleLicenceRequirements22Provider()),
        ChangeNotifierProvider(
            create: (_) => MotorcycleLicenceRequirements33Provider()),
        ChangeNotifierProvider(create: (_) => HighwayCrossingProvider()),
        ChangeNotifierProvider(create: (_) => HighwayCrossingRoadProvider()),
        ChangeNotifierProvider(create: (_) => HighwayCodeProvider1245()),
        ChangeNotifierProvider(
            create: (_) => SituationsNeedingExtraCareProvider()),
        ChangeNotifierProvider(create: (_) => OnPavementsProvider()),
        ChangeNotifierProvider(create: (_) => HighwayCode11Provider()),
        ChangeNotifierProvider(
            create: (_) => PoweredWheelchairsAndMobilityScootersProvider()),
        ChangeNotifierProvider(
            create: (_) => ActsAndRegulationsPriorTo1988Provider()),
        ChangeNotifierProvider(create: (_) => RoadUserAndTheLawProvider()),
        ChangeNotifierProvider(create: (_) => HighwayCodeProvider2211()),
        ChangeNotifierProvider(create: (_) => HighwayLearnerDriverProvider()),
        ChangeNotifierProvider(create: (_) => HighwayBePreparedProvider()),
        ChangeNotifierProvider(create: (_) => HighwayBleedingProvider()),
        ChangeNotifierProvider(create: (_) => HighwayBurnsProvider()),
        ChangeNotifierProvider(
            create: (_) => HighwayCodeDealWithDangerProvider()),
        ChangeNotifierProvider(
            create: (_) => HighwayFirstAidOnTheRoadProvider()),
        ChangeNotifierProvider(create: (_) => HighwayGetHelpProvider()),
        ChangeNotifierProvider(
            create: (_) => HighwayCodeHelpInvolvedProvider()),
        ChangeNotifierProvider(create: (_) => ProvideEmergencyCareProvider()),
        ChangeNotifierProvider(create: (_) => SafetyCodeProvider()),
        ChangeNotifierProvider(create: (_) => VehicleMaintenanceProvider()),
        ChangeNotifierProvider(create: (_) => VehicleSecurityProvider()),

        //sign traffic module
        ChangeNotifierProvider(create: (_) => SignProvider()),
        ChangeNotifierProvider(create: (_) => TrafficSignProvider123()),
        ChangeNotifierProvider(
            create: (_) => KeepUpToDateProvider(
                  repository: KeepUpToDateRepository(firestore: _firestore),
                )),

        ChangeNotifierProvider(
            create: (_) => SignInformationSignProvider(
                repository:
                    SignInformationSignRepository(firestore: _firestore))),

        ChangeNotifierProvider(
            create: (_) => ResponsibilityForTrafficSignsProvider(
                repository: ResponsibilityForTrafficSignsRepository(
                    firestore: _firestore))),
        ChangeNotifierProvider(
          create: (_) => SignGivingOrdersProvider(
            repository: SignGivingOrdersRepository(firestore: _firestore),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SignSystemProvider124(
            repository: SignSystemRepository432(firestore: _firestore),
          ),
        ),

        ChangeNotifierProvider(
            create: (_) => SignWarningSignProvider(
                repository: SignWarningSignRepository(firestore: _firestore))),

        ChangeNotifierProvider(
            create: (_) => TrafficSignInfoProvider(
                repository: TrafficSignInfoRepository(firestore: _firestore))),
        ChangeNotifierProvider(
            create: (_) => RoadWorkSignProvider(
                repository: RoadWorkSignRepository(firestore: _firestore))),
        ChangeNotifierProvider(create: (_) => FacebookAdsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return ConnectivityWrapper(
            child: child ?? const SizedBox.shrink(),
          );
        },
        home: const chooseride(),
      ),
    );
  }
}

class ConnectivityWrapper extends StatelessWidget {
  final Widget child;

  const ConnectivityWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          StreamBuilder<List<ConnectivityResult>>(
            // Changed to List<ConnectivityResult>
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              // Check if we have no data or if the connection is none
              final hasNoConnection = !snapshot.hasData ||
                  snapshot.data?.isEmpty == true ||
                  snapshot.data?.contains(ConnectivityResult.none) == true;

              if (hasNoConnection) {
                return Positioned.fill(
                  child: Container(
                    color: Colors.black87,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.wifi_off,
                          size: 50,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'No Internet Connection',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            final result =
                                await Connectivity().checkConnectivity();
                            if (result != ConnectivityResult.none) {
                              // Optional: Add any refresh logic here
                            }
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
