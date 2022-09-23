library xcm_models;

import 'dart:typed_data';
import 'package:substrate_metadata/exceptions/unexpected_exception.dart';
import 'package:substrate_metadata/utils/common_utils.dart';

///
/// versioned xcm models containing refs to designated versions
part 'versioned_multi_asset.dart';
part 'versioned_multi_assets.dart';
part 'versioned_multi_location.dart';
part 'versioned_response.dart';
part 'versioned_xcm.dart';

///
/// v0 xcm models
part 'v0/multi_asset_v0.dart';
part 'v0/multi_location_v0.dart';
part 'v0/xcm_asset_instance_v0.dart';
part 'v0/xcm_body_id_v0.dart';
part 'v0/xcm_body_part_v0.dart';
part 'v0/xcm_error_v0.dart';
part 'v0/xcm_junction_v0.dart';
part 'v0/xcm_network_id_v0.dart';
part 'v0/xcm_order_v0.dart';
part 'v0/xcm_origin_kind_v0.dart';
part 'v0/xcm_outcome_v0.dart';
part 'v0/xcm_response_v0.dart';
part 'v0/xcm_v0.dart';

///
/// v1 xcm models
part 'v1/multi_asset_filter_v1.dart';
part 'v1/multi_asset_v1.dart';
part 'v1/multi_location_v1.dart';
part 'v1/xcm_asset_id_v1.dart';
part 'v1/xcm_asset_instance_v1.dart';
part 'v1/xcm_error_v1.dart';
part 'v1/xcm_fungibility_v1.dart';
part 'v1/xcm_junction_v1.dart';
part 'v1/xcm_multiple_junctions_v1.dart';
part 'v1/xcm_order_v1.dart';
part 'v1/xcm_outcome_v1.dart';
part 'v1/xcm_response_v1.dart';
part 'v1/xcm_v1.dart';
part 'v1/xcm_wild_fungibility_v1.dart';
part 'v1/xcm_wild_multi_asset_v1.dart';

///
/// v2 xcm models
part 'v2/xcm_error_v2.dart';
part 'v2/xcm_instruction_v2.dart';
part 'v2/xcm_response_v2.dart';
part 'v2/xcm_weight_limit_v2.dart';
