import 'package:flutter/material.dart';

import '../../../../../components/v2/ride_booking_dialog.dart';

class PaymentV2Screen extends StatefulWidget {
  const PaymentV2Screen({super.key});

  @override
  State<PaymentV2Screen> createState() => _PaymentV2ScreenState();
}

class _PaymentV2ScreenState extends State<PaymentV2Screen> {
  String _selectedPaymentMethod = 'Card';
  bool _saveCard = false;
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropoffController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expirationController.dispose();
    _cvvController.dispose();
    _pickupController.dispose();
    _dropoffController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Details
            Text(
              'BMW 840i',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'View car details',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _buildTag('All Wheel'),
                SizedBox(width: 8),
                _buildTag('Automatic'),
              ],
            ),

            SizedBox(height: 24),

            // Payment Method Selection
            Text(
              'Pay With:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _buildPaymentOption('Card'),
                SizedBox(width: 16),
                _buildPaymentOption('Bank'),
                SizedBox(width: 16),
                _buildPaymentOption('Transfer'),
              ],
            ),

            SizedBox(height: 24),

            // Card Details
            Text(
              'Card Number',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            _buildTextField(
              controller: _cardNumberController,
              hint: '1234 5678 9101 1121',
            ),

            SizedBox(height: 16),

            // Expiration and CVV
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expiration Date',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      _buildTextField(
                        controller: _expirationController,
                        hint: 'MM/YY',
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CVV',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      _buildTextField(
                        controller: _cvvController,
                        hint: '123',
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Save Card Checkbox
            Row(
              children: [
                Checkbox(
                  value: _saveCard,
                  onChanged: (value) {
                    setState(() {
                      _saveCard = value ?? false;
                    });
                  },
                  activeColor: Color(0xFF122981),
                ),
                Text('Save card details'),
              ],
            ),

            SizedBox(height: 24),

            // Location Fields
            _buildTextField(
              controller: _pickupController,
              hint: '123 Elmwood Street, Springfield, IL 62701, USA',
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _dropoffController,
              hint: '456 Maple Avenue, Rivertown, NY 12121, USA',
            ),

            SizedBox(height: 24),

            // Fare Details
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildFareRow('Base Price', '45\$', 'Time', '2:52 AM'),
                  SizedBox(height: 8),
                  _buildFareRow(
                      'Distance', '50 Miles', 'Estimate Price', '65\$'),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Pay Now Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => RideBookedDialog(
                        title: "Ride Booked",
                        message: "Your ride has been Booked Successfully"),
                  ).then((_) =>
                      Navigator.popUntil(context, (route) => route.isFirst));
                },
                child: Text(
                  'Pay Now',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF122981),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xFF122981).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF122981),
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String method) {
    final bool isSelected = _selectedPaymentMethod == method;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = method;
        });
      },
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.green : Colors.grey,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  )
                : null,
          ),
          SizedBox(width: 8),
          Text(
            method,
            style: TextStyle(
              color: isSelected ? Color(0xFF122981) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildFareRow(
      String label1, String value1, String label2, String value2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label1,
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                value1,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(width: 24),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label2,
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                value2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
