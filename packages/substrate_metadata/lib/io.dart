import 'dart:convert';
import 'dart:io';

import '/old/definitions/acala.dart' as acala;
import '/old/definitions/altair.dart' as altair;
import '/old/definitions/astar.dart' as astar;
import '/old/definitions/basilisk.dart' as basilisk;
import '/old/definitions/bifrost.dart' as bifrost;
import '/old/definitions/calamari.dart' as calamari;
import '/old/definitions/clover.dart' as clover;
import '/old/definitions/crust.dart' as crust;
import '/old/definitions/darwinia.dart' as darwinia;
import '/old/definitions/hydradx.dart' as hydradx;
import '/old/definitions/khala.dart' as khala;
import '/old/definitions/kilt.dart' as kilt;
import '/old/definitions/kintsugi.dart' as kintsugi;
import '/old/definitions/kusama.dart' as kusama;
import '/old/definitions/manta.dart' as manta;
import '/old/definitions/moonsama.dart' as moonsama;
import '/old/definitions/parallel.dart' as parallel;
import '/old/definitions/pioneer.dart' as pioneer;
import '/old/definitions/polkadot.dart' as polkadot;
import '/old/definitions/shell.dart' as shell;
import '/old/definitions/shibuya.dart' as shibuya;
import '/old/definitions/shiden.dart' as shiden;
import '/old/definitions/statemint.dart' as statemint;
import '/old/definitions/subsocial.dart' as subsocial;
import '/old/definitions/unique.dart' as unique;
import 'exceptions/old_types_bundle_exception.dart';
import 'old/legacy_types.dart';

LegacyTypesBundle? getLegacyTypesBundle(String chain) {
  switch (chain) {
    case 'altair':
      return LegacyTypesBundle.fromMap(altair.bundle);
    case 'bifrost':
      return LegacyTypesBundle.fromMap(bifrost.bundle);
    case 'khala':
      return LegacyTypesBundle.fromMap(khala.bundle);
    case 'kusama':
      return LegacyTypesBundle.fromMap(kusama.bundle);
    case 'moonbeam':
    case 'moonbase':
    case 'moonriver':
      return LegacyTypesBundle.fromMap(moonsama.bundle);
    case 'polkadot':
      return LegacyTypesBundle.fromMap(polkadot.bundle);
    case 'acala':
    case 'karura':
      return LegacyTypesBundle.fromMap(acala.bundle);
    case 'astar':
      return LegacyTypesBundle.fromMap(astar.bundle);
    case 'shiden':
      return LegacyTypesBundle.fromMap(shiden.bundle);
    case 'shibuya':
      return LegacyTypesBundle.fromMap(shibuya.bundle);
    case 'crust':
      return LegacyTypesBundle.fromMap(crust.bundle);
    case 'shell':
      return LegacyTypesBundle.fromMap(shell.bundle);
    case 'statemint':
    case 'statemine':
      return LegacyTypesBundle.fromMap(statemint.bundle);
    case 'subsocial':
      return LegacyTypesBundle.fromMap(subsocial.bundle);
    case 'kilt':
    case 'kilt-spiritnet': // real spec name
      return LegacyTypesBundle.fromMap(kilt.bundle);
    case 'hydradx':
    case 'hydra-dx': // real spec name
      return LegacyTypesBundle.fromMap(hydradx.bundle);
    case 'pioneer':
      return LegacyTypesBundle.fromMap(pioneer.bundle);
    case 'parallel':
    case 'heiko':
      return LegacyTypesBundle.fromMap(parallel.bundle);
    case 'clover':
      return LegacyTypesBundle.fromMap(clover.bundle);
    case 'manta':
      return LegacyTypesBundle.fromMap(manta.bundle);
    case 'calamari':
      return LegacyTypesBundle.fromMap(calamari.bundle);
    case 'basilisk':
      return LegacyTypesBundle.fromMap(basilisk.bundle);
    case 'unique':
    case 'quartz':
      return LegacyTypesBundle.fromMap(unique.bundle);
    case 'darwinia':
    case 'Darwinia': // real spec name
      return LegacyTypesBundle.fromMap(darwinia.bundle);
    case 'kintsugi':
    case 'kintsugi-parachain': // real spec name
      return LegacyTypesBundle.fromMap(kintsugi.bundle);
    default:
      return null;
  }
}

LegacyTypesBundle readLegacyTypesBundle(String file) {
  late String content;
  try {
    content = File(file).readAsStringSync();
  } catch (e) {
    throw LegacyTypesBundleException(file, e);
  }
  late LegacyTypesBundle json;
  try {
    json = LegacyTypesBundle.fromMap(jsonDecode(content));
  } catch (e) {
    throw LegacyTypesBundleException(file, e);
  }
  return json;
}
