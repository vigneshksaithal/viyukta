///
//  Generated code. Do not modify.
//  source: lib/protos/commitment.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CommitmentProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CommitmentProto', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestNumber', protoName: 'requestNumber')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isContinued', protoName: 'isContinued')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isApproved', protoName: 'isApproved')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  CommitmentProto._() : super();
  factory CommitmentProto({
    $core.String? requestNumber,
    $core.String? date,
    $core.String? type,
    $core.String? amount,
    $core.bool? isContinued,
    $core.bool? isApproved,
    $core.String? description,
  }) {
    final _result = create();
    if (requestNumber != null) {
      _result.requestNumber = requestNumber;
    }
    if (date != null) {
      _result.date = date;
    }
    if (type != null) {
      _result.type = type;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (isContinued != null) {
      _result.isContinued = isContinued;
    }
    if (isApproved != null) {
      _result.isApproved = isApproved;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory CommitmentProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommitmentProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommitmentProto clone() => CommitmentProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommitmentProto copyWith(void Function(CommitmentProto) updates) => super.copyWith((message) => updates(message as CommitmentProto)) as CommitmentProto; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommitmentProto create() => CommitmentProto._();
  CommitmentProto createEmptyInstance() => create();
  static $pb.PbList<CommitmentProto> createRepeated() => $pb.PbList<CommitmentProto>();
  @$core.pragma('dart2js:noInline')
  static CommitmentProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommitmentProto>(create);
  static CommitmentProto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get date => $_getSZ(1);
  @$pb.TagNumber(2)
  set date($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearDate() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get amount => $_getSZ(3);
  @$pb.TagNumber(4)
  set amount($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isContinued => $_getBF(4);
  @$pb.TagNumber(5)
  set isContinued($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsContinued() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsContinued() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isApproved => $_getBF(5);
  @$pb.TagNumber(6)
  set isApproved($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsApproved() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsApproved() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get description => $_getSZ(6);
  @$pb.TagNumber(7)
  set description($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearDescription() => clearField(7);
}

