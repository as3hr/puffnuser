import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../components/selection_screen.dart';
import 'vehicle_selection_screen.dart';

class ChauffuerBookingScreen extends StatefulWidget {
  const ChauffuerBookingScreen({super.key});

  @override
  State<ChauffuerBookingScreen> createState() => _ChauffuerBookingScreenState();
}

class _ChauffuerBookingScreenState extends State<ChauffuerBookingScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int selectedTab = 0;

  List<SelectionOption> _options = [
    SelectionOption(id: '1', label: 'Business Class', selected: true),
    SelectionOption(id: '2', label: 'Economy Class'),
    SelectionOption(id: '3', label: 'Luxury Class'),
  ];

  void _handleSelection(int index, bool? value) {
    setState(() {
      for (int i = 0; i < _options.length; i++) {
        _options[i] = _options[i].copyWith(selected: i == index);
      }
    });
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

  selectButton(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        selectedTab = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title:
            const Text('Book For Later', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Google Maps Image Placeholder
          Positioned.fill(
            top: 100,
            child: Image.asset(
              "images/map.png",
              fit: BoxFit.cover,
              color: Color(0xff122981).withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            ),
          ),

          // Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.45, // Starts at 45% of screen height
            minChildSize: 0.45, // Minimum height when collapsed
            maxChildSize: 0.85, // Expandable up to 85% of screen height
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Trip Type Selector
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () => selectButton(0),
                                child: _buildTripTypeButton(
                                    'One way', selectedTab == 0)),
                            GestureDetector(
                                onTap: () => selectButton(1),
                                child: _buildTripTypeButton(
                                    'Round Trip', selectedTab == 1)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Pickup Location
                      const Text('Pickup Location',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter pickup location',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Drop-off Location
                      const Text('Drop-off Location',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter drop-off location',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Date & Time Selection
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _selectDate(context),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  selectedDate != null
                                      ? DateFormat('dd MMM yyyy')
                                          .format(selectedDate!)
                                      : "Pick a date",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _selectTime(context),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  selectedTime != null
                                      ? selectedTime!.format(context)
                                      : "Pick a time",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Wrap(
                          children: [
                            ...List.generate(_options.length, (index) {
                              return _buildChipOption(index);
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Continue Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const VehicleSelectionScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff462FAB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTripTypeButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildChipOption(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      child: FilterChip(
        label: Text(_options[index].label),
        selected: _options[index].selected,
        onSelected: (value) => _handleSelection(index, value),
        backgroundColor: Colors.white,
        selectedColor: Color(0xFF122981).withOpacity(0.2),
        labelStyle: TextStyle(
          color: _options[index].selected ? Color(0xFF122981) : Colors.black,
        ),
        checkmarkColor: Color(0xFF122981),
      ),
    );
  }
}
