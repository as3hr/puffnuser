import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.onChanged,
    required this.isRequired,
    this.validator,
    this.isPassword = false,
  });
  final String label;
  final bool isRequired;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;

  static final _isPasswordVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        ValueListenableBuilder<bool>(
            valueListenable: _isPasswordVisible,
            builder: (context, value, _) {
              return TextFormField(
                obscureText: isPassword ? value : false,
                onChanged: onChanged,
                validator: validator,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          color: const Color(0xFF717171),
                          fontSize: 14,
                        ),
                      ),
                      if (isRequired)
                        Text(
                          ' *',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  suffixIcon: isPassword
                      ? IconButton(
                          icon: Icon(
                            value ? Icons.visibility : Icons.visibility_off,
                            color: const Color(0xFF717171),
                          ),
                          onPressed: () {
                            _isPasswordVisible.value = !value;
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: const Color(0xFF717171).withOpacity(0.2),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: const Color(0xFF717171).withOpacity(0.2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: const Color(0xFF8555AE),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
