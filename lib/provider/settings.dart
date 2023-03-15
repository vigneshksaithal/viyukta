import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings {
  TextEditingController phoneNumberController = TextEditingController();

  Settings({
    required this.phoneNumberController,
  });

  Settings copyWith({
    TextEditingController? phoneNumberController,
  }) {
    return Settings(
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
    );
  }
}

class SettingsNotifier extends StateNotifier<Settings> {
  SettingsNotifier()
      : super(Settings(
          phoneNumberController: TextEditingController(),
        )) {
    // call init function here
  }

  Future<void> updatePhoneNumber(int phoneNumber) async {
    state = state.copyWith(
      phoneNumberController:
          TextEditingController(text: phoneNumber.toString()),
    );
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, Settings>((ref) {
  return SettingsNotifier();
});
