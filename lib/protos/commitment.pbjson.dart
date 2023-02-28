///
//  Generated code. Do not modify.
//  source: lib/protos/commitment.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use commitmentProtoDescriptor instead')
const CommitmentProto$json = const {
  '1': 'CommitmentProto',
  '2': const [
    const {'1': 'requestNumber', '3': 1, '4': 1, '5': 9, '10': 'requestNumber'},
    const {'1': 'date', '3': 2, '4': 1, '5': 9, '10': 'date'},
    const {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 9, '10': 'amount'},
    const {'1': 'isContinued', '3': 5, '4': 1, '5': 8, '10': 'isContinued'},
    const {'1': 'isApproved', '3': 6, '4': 1, '5': 8, '10': 'isApproved'},
    const {'1': 'description', '3': 7, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `CommitmentProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commitmentProtoDescriptor = $convert.base64Decode('Cg9Db21taXRtZW50UHJvdG8SJAoNcmVxdWVzdE51bWJlchgBIAEoCVINcmVxdWVzdE51bWJlchISCgRkYXRlGAIgASgJUgRkYXRlEhIKBHR5cGUYAyABKAlSBHR5cGUSFgoGYW1vdW50GAQgASgJUgZhbW91bnQSIAoLaXNDb250aW51ZWQYBSABKAhSC2lzQ29udGludWVkEh4KCmlzQXBwcm92ZWQYBiABKAhSCmlzQXBwcm92ZWQSIAoLZGVzY3JpcHRpb24YByABKAlSC2Rlc2NyaXB0aW9u');
