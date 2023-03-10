import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viyukta/provider/commitment.dart';

import '../../../theme/theme.dart';

class CodingBlockCard extends ConsumerWidget {
  const CodingBlockCard({super.key});

  static const chapterCodes = [
    'A1 - Compensation Of Employees',
    'A2 - Acquisition of Fixed Assets',
  ];

  static const partCodes = [
    'A11 - Salaries In Cash',
    'A21 - Acquisition of Tangible Fixed Assets',
  ];

  static const typeCodes = [
    'A111 - Salaries in Cash for Teachers',
    'A211 - Acquisition of ICT Equipment and Software',
  ];

  static const itemCodes = [
    'A1111 - Teachers Basic Salary',
    'A2111 - Acquisition of Laptops',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? chapterCode = ref.watch(commitmentProvider).chapterCode;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coding Block',
              style: textTheme().titleMedium,
            ),
            const SizedBox(height: 48.0),
            Text(
              'Chapter Code',
              style: textTheme().labelMedium,
            ),
            const SizedBox(height: 16.0),
            chapterCodeDropdownField(chapterCode, ref),
            const SizedBox(height: 32.0),
            Text(
              'Part Code',
              style: textTheme().labelMedium,
            ),
            const SizedBox(height: 16.0),
            partCodeDropdownField(chapterCode, ref),
            // const Divider(),
            const SizedBox(height: 32.0),
            Text(
              'Type Code',
              style: textTheme().labelMedium,
            ),
            const SizedBox(height: 16.0),
            typeCodeDropdownField(chapterCode, ref),
            const SizedBox(height: 32.0),
            Text(
              'Item Code',
              style: textTheme().labelMedium,
            ),
            const SizedBox(height: 16.0),
            itemCodeDropdownField(chapterCode, ref),
          ],
        ),
      ),
    );
  }

  DropdownButtonFormField<String> itemCodeDropdownField(
      String? chapterCode, WidgetRef ref) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusColor: Colors.grey[400],
      ),
      value: chapterCode,
      isExpanded: true,
      borderRadius: BorderRadius.circular(16.0),
      elevation: 1,
      hint: Text(
        'Select Item Code',
        style: textTheme().labelMedium,
      ),
      items: chapterCodes.map(buildMenuItem).toList(),
      onChanged: (value) {
        chapterCode = value;

        ref.read(commitmentProvider.notifier).setChapterCode(chapterCode!);

        print(chapterCode);
      },
    );
  }

  DropdownButtonFormField<String> typeCodeDropdownField(
      String? chapterCode, WidgetRef ref) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusColor: Colors.grey[400],
      ),
      value: chapterCode,
      isExpanded: true,
      borderRadius: BorderRadius.circular(16.0),
      elevation: 1,
      hint: Text(
        'Select Type Code',
        style: textTheme().labelMedium,
      ),
      items: chapterCodes.map(buildMenuItem).toList(),
      onChanged: (value) {
        chapterCode = value;

        ref.read(commitmentProvider.notifier).setChapterCode(chapterCode!);

        print(chapterCode);
      },
    );
  }

  DropdownButtonFormField<String> partCodeDropdownField(
      String? chapterCode, WidgetRef ref) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusColor: Colors.grey[400],
      ),
      value: chapterCode,
      isExpanded: true,
      borderRadius: BorderRadius.circular(16.0),
      elevation: 1,
      hint: Text(
        'Select Part Code',
        style: textTheme().labelMedium,
      ),
      items: chapterCodes.map(buildMenuItem).toList(),
      onChanged: (value) {
        chapterCode = value;

        ref.read(commitmentProvider.notifier).setChapterCode(chapterCode!);

        print(chapterCode);
      },
    );
  }

  DropdownButtonFormField<String> chapterCodeDropdownField(
      String? chapterCode, WidgetRef ref) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusColor: Colors.grey[400],
      ),
      value: chapterCode,
      isExpanded: true,
      borderRadius: BorderRadius.circular(16.0),
      elevation: 1,
      hint: Text(
        'Select Chapter Code',
        style: textTheme().labelMedium,
      ),
      items: chapterCodes.map(buildMenuItem).toList(),
      onChanged: (value) {
        chapterCode = value;

        ref.read(commitmentProvider.notifier).setChapterCode(chapterCode!);

        print(chapterCode);
      },
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem<String>(
      value: item,
      child: Text(
        item,
        style: textTheme().bodyMedium,
      ),
    );
  }
}
