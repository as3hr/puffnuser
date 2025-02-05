import 'package:flutter/material.dart';
import 'package:taxi_booking/components/v2/submission_button.dart';

enum SelectionType {
  radio,
  checkbox,
  chip,
}

class SelectionOption {
  final String id;
  final String label;
  final bool selected;

  SelectionOption({
    required this.id,
    required this.label,
    this.selected = false,
  });

  SelectionOption copyWith({bool? selected}) {
    return SelectionOption(
      id: id,
      label: label,
      selected: selected ?? this.selected,
    );
  }
}

class SelectionScreen extends StatefulWidget {
  final String title;
  final SelectionType selectionType;
  final List<SelectionOption> options;
  final Function(List<SelectionOption>) onSelectionChanged;
  final bool allowMultiple;
  final String continueButtonText;
  final VoidCallback onContinue;

  const SelectionScreen({
    super.key,
    required this.title,
    required this.selectionType,
    required this.options,
    required this.onSelectionChanged,
    required this.onContinue,
    this.allowMultiple = false,
    this.continueButtonText = 'Continue',
  });

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  late List<SelectionOption> _options;

  @override
  void initState() {
    super.initState();
    _options = List.from(widget.options);
  }

  void _handleSelection(int index, bool? value) {
    setState(() {
      if (widget.allowMultiple) {
        _options[index] = _options[index].copyWith(selected: value ?? false);
      } else {
        for (int i = 0; i < _options.length; i++) {
          _options[i] = _options[i].copyWith(selected: i == index);
        }
      }
    });
    widget.onSelectionChanged(_options);
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
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          widget.selectionType == SelectionType.chip
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Wrap(
                      children: [
                        ...List.generate(_options.length, (index) {
                          return _buildChipOption(index);
                        }),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(_options.length, (index) {
                          switch (widget.selectionType) {
                            case SelectionType.radio:
                              return _buildRadioOption(index);
                            case SelectionType.checkbox:
                              return _buildCheckboxOption(index);
                            case SelectionType.chip:
                              return SizedBox();
                          }
                        }),
                      ],
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: SubmissionButton(
                onTap: widget.onContinue, text: widget.continueButtonText),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(int index) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(_options[index].label),
      leading: Radio<bool>(
        value: true,
        groupValue: _options[index].selected ? true : null,
        onChanged: (value) => _handleSelection(index, value),
        activeColor: Color(0xFF122981),
      ),
    );
  }

  Widget _buildCheckboxOption(int index) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(_options[index].label),
      leading: Checkbox(
        value: _options[index].selected,
        onChanged: (value) => _handleSelection(index, value),
        activeColor: Color(0xFF122981),
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
        backgroundColor: Colors.grey[200],
        selectedColor: Color(0xFF122981).withOpacity(0.2),
        labelStyle: TextStyle(
          color: _options[index].selected ? Color(0xFF122981) : Colors.black,
        ),
        checkmarkColor: Color(0xFF122981),
      ),
    );
  }
}
