import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/settings.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: ref.watch(settingsProvider).phoneNumberController,
                decoration: const InputDecoration(
                  // labelText: 'Phone Number',
                  hintText: 'Enter phone number',
                  label: Text('Phone Number'),
                  helperText: 'Please add country code with + sign.',
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 32.0),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Save Settings'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
