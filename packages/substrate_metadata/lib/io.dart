import 'dart:convert';
import 'dart:io';
import 'exceptions/old_types_bundle_exception.dart';
import 'old/types.dart';

import '/old/definitions/altair.dart' as altair;
import '/old/definitions/bifrost.dart' as bifrost;
import '/old/definitions/khala.dart' as khala;
import '/old/definitions/kusama.dart' as kusama;
import '/old/definitions/moonsama.dart' as moonsama;
import '/old/definitions/polkadot.dart' as polkadot;
import '/old/definitions/acala.dart' as acala;
import '/old/definitions/astar.dart' as astar;
import '/old/definitions/shiden.dart' as shiden;
import '/old/definitions/shibuya.dart' as shibuya;
import '/old/definitions/crust.dart' as crust;
import '/old/definitions/shell.dart' as shell;
import '/old/definitions/statemint.dart' as statemint;
import '/old/definitions/subsocial.dart' as subsocial;
import '/old/definitions/kilt.dart' as kilt;
import '/old/definitions/hydradx.dart' as hydradx;
import '/old/definitions/pioneer.dart' as pioneer;
import '/old/definitions/parallel.dart' as parallel;
import '/old/definitions/clover.dart' as clover;
import '/old/definitions/manta.dart' as manta;
import '/old/definitions/calamari.dart' as calamari;
import '/old/definitions/basilisk.dart' as basilisk;
import '/old/definitions/unique.dart' as unique;
import '/old/definitions/darwinia.dart' as darwinia;
import '/old/definitions/kintsugi.dart' as kintsugi;

OldTypesBundle? getOldTypesBundle(String chain) {
  switch (chain) {
    case 'altair':
      return OldTypesBundle.fromMap(altair.bundle);
    case 'bifrost':
      return OldTypesBundle.fromMap(bifrost.bundle);
    case 'khala':
      return OldTypesBundle.fromMap(khala.bundle);
    case 'kusama':
      return OldTypesBundle.fromMap(kusama.bundle);
    case 'moonbeam':
    case 'moonbase':
    case 'moonriver':
      return OldTypesBundle.fromMap(moonsama.bundle);
    case 'polkadot':
      return OldTypesBundle.fromMap(polkadot.bundle);
    case 'acala':
    case 'karura':
      return OldTypesBundle.fromMap(acala.bundle);
    case 'astar':
      return OldTypesBundle.fromMap(astar.bundle);
    case 'shiden':
      return OldTypesBundle.fromMap(shiden.bundle);
    case 'shibuya':
      return OldTypesBundle.fromMap(shibuya.bundle);
    case 'crust':
      return OldTypesBundle.fromMap(crust.bundle);
    case 'shell':
      return OldTypesBundle.fromMap(shell.bundle);
    case 'statemint':
    case 'statemine':
      return OldTypesBundle.fromMap(statemint.bundle);
    case 'subsocial':
      return OldTypesBundle.fromMap(subsocial.bundle);
    case 'kilt':
    case 'kilt-spiritnet': // real spec name
      return OldTypesBundle.fromMap(kilt.bundle);
    case 'hydradx':
    case 'hydra-dx': // real spec name
      return OldTypesBundle.fromMap(hydradx.bundle);
    case 'pioneer':
      return OldTypesBundle.fromMap(pioneer.bundle);
    case 'parallel':
    case 'heiko':
      return OldTypesBundle.fromMap(parallel.bundle);
    case 'clover':
      return OldTypesBundle.fromMap(clover.bundle);
    case 'manta':
      return OldTypesBundle.fromMap(manta.bundle);
    case 'calamari':
      return OldTypesBundle.fromMap(calamari.bundle);
    case 'basilisk':
      return OldTypesBundle.fromMap(basilisk.bundle);
    case 'unique':
    case 'quartz':
      return OldTypesBundle.fromMap(unique.bundle);
    case 'darwinia':
    case 'Darwinia': // real spec name
      return OldTypesBundle.fromMap(darwinia.bundle);
    case 'kintsugi':
    case 'kintsugi-parachain': // real spec name
      return OldTypesBundle.fromMap(kintsugi.bundle);
    default:
      return null;
  }
}

OldTypesBundle readOldTypesBundle(String file) {
  late String content;
  try {
    content = File(file).readAsStringSync();
  } catch (e) {
    throw OldTypesBundleException(file, e);
  }
  late OldTypesBundle json;
  try {
    json = OldTypesBundle.fromMap(jsonDecode(content));
  } catch (e) {
    throw OldTypesBundleException(file, e);
  }
  return json;
}
