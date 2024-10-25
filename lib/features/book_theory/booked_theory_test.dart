import 'package:driving_lisence/features/auth/pages/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YourTheoryTestScreen extends StatefulWidget {
  @override
  _YourTheoryTestScreenState createState() => _YourTheoryTestScreenState();
}

class _YourTheoryTestScreenState extends State<YourTheoryTestScreen> {
  String selectedOption = '';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Your Theory Test',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Text(
                'Progress Tracker',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Making progress...',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Have you booked your Theory Test?',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            _buildOptionButton('Yes', Icons.check_circle_outline),
            const SizedBox(height: 10),
            _buildOptionButton('No', Icons.close),
            if (selectedOption == 'yes') ...[
              const SizedBox(height: 20),
              _buildDateTimeSelection(),
            ],
            const Spacer(),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(String text, IconData icon) {
    bool isSelected = selectedOption == text.toLowerCase();
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = text.toLowerCase();
          if (selectedOption == 'no') {
            selectedDate = null;
            selectedTime = null;
          }
        });
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
          color: isSelected ? Colors.green : Colors.white,
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Icon(
              icon,
              size: 24,
              color: isSelected ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Please enter your test date',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate != null
                      ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                      : 'Select a date...',
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Please enter your test time',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => _selectTime(context),
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedTime != null
                      ? selectedTime!.format(context)
                      : 'Select a time...',
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(Icons.access_time),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),
       const Center(
         child: Text("I dont know , remind me later",style: TextStyle(
           fontSize: 20,fontWeight: FontWeight.bold
         ),),
       )
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Widget _buildBottomNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back, size: 30),
          Row(
            children: List.generate(5, (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 1 ? Colors.green :
                index == 2 ? Colors.red : Colors.grey,
              ),
            )),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()),
              );
            },
          ),

        ],
      ),
    );
  }
}
