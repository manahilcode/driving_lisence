import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/loader.dart'; // Add this package for date formatting

class PassGuaranteeScreen extends StatefulWidget {
  @override
  _PassGuaranteeScreenState createState() => _PassGuaranteeScreenState();
}

class _PassGuaranteeScreenState extends State<PassGuaranteeScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  String _formatDateTime() {
    if (selectedDate == null || selectedTime == null) {
      return 'Select a date and time...';
    }

    final formattedDate = DateFormat('yMMMd').format(selectedDate!);
    final formattedTime = selectedTime!.format(context);

    return '$formattedDate at $formattedTime';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Pass Guarantee', style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFFDAB560),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Text(
                'Welcome to your Pass Guarantee Learner Plan, here we will guide you from start to finish. Pass first time or we will give you your Theory Test fee back if you fail. Terms and Conditions apply.',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTheoryTestCard(),
                  SizedBox(height: 7),
                  _buildLearnerPlanCard(),
                  SizedBox(height: 7),
                  _buildMockTestsCard(),
                  SizedBox(height: 7),
                  _buildPassGuaranteeClaimButton(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Your Offers'),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: 'Share'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }

  Widget _buildTheoryTestCard() {
    return Card(
      child: ListTile(
        leading: Icon(Icons.calendar_today, color: Color(0xFFDAB560)),
        title: Text('Your Theory Test is on'),
        subtitle: Text(_formatDateTime()),
        trailing: TextButton(
          child: Text('Edit', style: TextStyle(color: Color(0xFFDAB560))),
          onPressed: () {
            _showDateTimePicker(context);
          },
        ),
      ),
    );
  }

  Future<void> _showDateTimePicker(BuildContext context) async {
    await _selectDate(context);
    if (selectedDate != null) {
      await _selectTime(context);
    }
  }

  Widget _buildLearnerPlanCard() {
    return Card(
      color: Color(0xFFDAB560),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Stack(
                        children: [
                          LoadingScreen(
                            // value: 0,
                            // backgroundColor: Colors.white.withOpacity(0.3),
                            // valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            // strokeWidth: 8,
                          ),
                          Center(
                            child: Text(
                              '0%',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Overall', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(width: 70),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Learner Plan', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Complete all your goals to be test ready', style: TextStyle(color: Colors.white)),
                    Spacer(),
                    ElevatedButton(
                      child: Text('View Learner Plan'),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(foregroundColor: Color(0xFFDAB560), backgroundColor: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMockTestsCard() {
    return Card(
      color: Color(0xFFDAB560),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recent', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(
                      'Your most recent mock Theory and Hazard Perception test results will show here.',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mock Tests', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Check out your mock test progress', style: TextStyle(color: Colors.white, fontSize: 14)),
                    Spacer(),
                    ElevatedButton(
                      child: Text('View progress'),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(foregroundColor: Color(0xFFDAB560), backgroundColor: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPassGuaranteeClaimButton() {
    return Container(
      height: 60,
      child: ElevatedButton.icon(
        icon: Icon(Icons.currency_pound),
        label: Text('Make a Pass Guarantee claim'),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Color(0xFFDAB560),
          backgroundColor: Colors.white,
          minimumSize: Size(double.infinity, 50),
        ),
      ),
    );
  }
}
