import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/incident/pages/Reporting_an_incident.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HelpingOtherGivingFirstAid extends StatefulWidget {
  const HelpingOtherGivingFirstAid({super.key});

  @override
  State<HelpingOtherGivingFirstAid> createState() => _HelpingOtherGivingFirstAidState();
}

class _HelpingOtherGivingFirstAidState extends State<HelpingOtherGivingFirstAid> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Helping Other And Giving First Aid"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              createHeadingText("Helping others and giving first aid"),
              const Gap(10),
              createAutoSizeText("Even if you don’t know any first aid, you can help any injured people by"),
              const Gap(10),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    buildBulletText("calling the emergency services on 999 or 112"),
                    buildBulletText("keeping them warm and comfortable"),
                    buildBulletText("keeping them calm by talking to them reassuringly"),
                    buildBulletText("making sure they’re not left alone"),
                  ],
                ),
              ),
              const Gap(10),
              Image.network("https://via.placeholder.com/400"),
              const Gap(10),
              createAutoSizeText("Don’t move an injured person if the area is safe. Only move them if they’re in obvious danger, and then with extreme care. If a motorcyclist is involved, never remove their helmet unless it’s essential in order to keep them alive, because removing the helmet could cause more serious injury. Always get medical help and never offer a casualty any food or drink, or a cigarette to calm them down."),
              const Gap(10),
              createAutoSizeText("If the casualty is unconscious, check that they can breathe normally. If they can, place them in the recovery position until medical help arrives. Keep checking them and make sure their airway remains clear."),
              const Gap(10),
              createAutoSizeText("If you need to provide emergency care, follow the DR ABC code."),
              const Gap(10),
              Image.network("https://via.placeholder.com/400"),
              const Gap(10),
              createHeadingText("Danger"),
              createAutoSizeText("Check that it’s safe to approach."),
              const Gap(10),
              Image.network("https://via.placeholder.com/400"),
              const Gap(10),
              createHeadingText("Response"),
              createAutoSizeText("Try to get a response by gently shaking the casualty’s shoulders and asking loudly ‘Are you all right?’ If they respond, check for injuries."),
              const Gap(10),
              Image.network("https://via.placeholder.com/400"),
              const Gap(10),
              createHeadingText("Airway"),
              createAutoSizeText("If there’s no response, open the casualty’s airway by placing your fingers under their chin and lifting it forward."),
              const Gap(10),
              Image.network("https://via.placeholder.com/400"),
              const Gap(10),
              createHeadingText("Breathing"),
              createAutoSizeText("Check that the casualty is breathing normally. Look for chest movements, look and listen for breathing, and feel for breath on your cheek."),
              createAutoSizeText("If there are no signs of breathing, start CPR. Interlock your fingers, place them in the centre of the casualty’s chest and press down hard and fast - around 5-6 centimetres and about twice a second. You may only need one hand for a child and shouldn’t press down as far. For infants, use two fingers in the middle of the chest and press down about a third of the chest depth. Don’t stop until the casualty starts breathing again or a medical professional takes over."),
              const Gap(10),
              Image.network("Circulation"),
              const Gap(10),
              createAutoSizeText("If the casualty is responsive and breathing, check for signs of bleeding. Protect yourself from exposure to blood and check for anything that may be in the wound, such as glass. Don’t remove anything that’s stuck in the wound. Taking care not to press on the object, build up padding on either side of the object. If nothing is embedded, apply firm pressure over the wound to stem the flow of blood. As soon as practical, fasten a pad to the wound with a bandage or length of cloth. Use the cleanest material available."),
              const Gap(10),
              createAutoSizeText("People at the scene may be suffering from shock: signs include a rapid pulse, sweating and pale grey skin.To help someone suffering from shock"),
              const Gap(10),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    buildBulletText("reassure them confidently"),
                    buildBulletText("keep them warm"),
                    buildBulletText("make them as comfortable as you can"),
                    buildBulletText("avoid moving them unless it’s necessary"),
                    buildBulletText("make sure they’re not left alone"),
                    buildBulletText("talk firmly and quietly to them if they are hysterical."),



                  ],
                ),
              ),





            const Gap(10),
              createAutoSizeText("If someone is suffering from burns"),
              const Gap(10),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
          buildBulletText("douse the burns thoroughly with cool water for at least 20 minutes"),
                    buildBulletText("do not remove anything sticking to the burn."),

                  ],
                ),
              ),

             const Gap(10),
              createHeadingText("Douse"),
              const Gap(10),
              createAutoSizeText("To plunge suddenly into water or to stop a fire or light from burning or shining especially by putting water on it or by covering it with something."),
              const Gap(10),

              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const ReportingAnIncident()),
                  );
                },
                child: Center(
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 30.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
