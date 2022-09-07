const TYPES_0_4 = <String, dynamic>{
  'AccountId': 'EthereumAccountId',
  'Address': 'AccountId',
  'Balance': 'U128',
  'RefCount': 'U8',
  'LookupSource': 'AccountId',
  'Account': {
    'nonce': 'U256',
    'balance': 'U128',
  }
};

final TYPES_5_5 = Map<String, dynamic>.from(TYPES_0_4)..remove('RefCount');

final TYPES_6_19 = <String, dynamic>{
  ...TYPES_5_5,
  'ExtrinsicSignature': 'EthereumSignature',
  'RoundIndex': 'u32',
  'Candidate': {
    'id': 'AccountId',
    'fee': 'Perbill',
    'bond': 'Balance',
    'nominators': 'Vec<Bond>',
    'total': 'Balance',
    'state': 'ValidatorStatus',
  },
  'Nominator': {
    'nominations': 'Vec<Bond>',
    'total': 'Balance',
  },
  'Bond': {
    'owner': 'AccountId',
    'amount': 'Balance',
  },
  'ValidatorStatus': {
    '_enum': {'Active': 'Null', 'Idle': 'Null', 'Leaving': 'RoundIndex'},
  },
  'TxPoolResultContent': {
    'pending': 'HashMap<H160, HashMap<U256, PoolTransaction>>',
    'queued': 'HashMap<H160, HashMap<U256, PoolTransaction>>',
  },
  'TxPoolResultInspect': {
    'pending': 'HashMap<H160, HashMap<U256, Summary>>',
    'queued': 'HashMap<H160, HashMap<U256, Summary>>',
  },
  'TxPoolResultStatus': {
    'pending': 'U256',
    'queued': 'U256',
  },
  'Summary': 'Bytes',
  'PoolTransaction': {
    'hash': 'H256',
    'nonce': 'U256',
    'blockHash': 'Option<H256>',
    'blockNumber': 'Option<U256>',
    'from': 'H160',
    'to': 'Option<H160>',
    'value': 'U256',
    'gasPrice': 'U256',
    'gas': 'U256',
    'input': 'Bytes',
  }
};

final omitFields = Map<String, dynamic>.from(TYPES_6_19)
  ..remove('ValidatorStatus');

final TYPES_19_35 = <String, dynamic>{
  ...omitFields,
  'AccountInfo': 'AccountInfoWithTripleRefCount',
  'Candidate': {
    'id': 'AccountId',
    'fee': 'Perbill',
    'bond': 'Balance',
    'nominators': 'Vec<Bond>',
    'total': 'Balance',
    'state': 'CollatorStatus',
  },
  'CollatorStatus': {
    '_enum': {'Active': 'Null', 'Idle': 'Null', 'Leaving': 'RoundIndex'},
  },
  // Staking inflation
  'Range': 'RangeBalance',
  'RangeBalance': {
    'min': 'Balance',
    'ideal': 'Balance',
    'max': 'Balance',
  },
  'RangePerbill': {
    'min': 'Perbill',
    'ideal': 'Perbill',
    'max': 'Perbill',
  },
  'InflationInfo': {
    'expect': 'RangeBalance',
    'annual': 'RangePerbill',
    'round': 'RangePerbill',
  },
  'OrderedSet': 'Vec<Bond>',
  'Collator': {
    'id': 'AccountId',
    'bond': 'Balance',
    'nominators': 'Vec<Bond>',
    'total': 'Balance',
    'state': 'CollatorStatus',
  },
  'CollatorSnapshot': {
    'bond': 'Balance',
    'nominators': 'Vec<Bond>',
    'total': 'Balance',
  },
  'SystemInherentData': {
    'validationData': 'PersistedValidationData',
    'relayChain_state': 'StorageProof',
    'downwardMessages': 'Vec<InboundDownwardMessage>',
    'horizontalMessages': 'BTreeMap<ParaId, Vec<InboundHrmpMessage>>',
  },
  'RoundInfo': {
    'current': 'RoundIndex',
    'first': 'BlockNumber',
    'length': 'u32',
  }
};

final TYPES_36_36 = <String, dynamic>{
  ...TYPES_19_35,
  'AuthorId': 'AccountId',
};

final TYPES_37_42 = <String, dynamic>{
  ...TYPES_36_36,
  'AccountId32': 'H256',
  'AuthorId': 'AccountId32',
  'ProxyType': {
    '_enum': [
      'Any',
      'NonTransfer',
      'Governance',
      'Staking',
      'CancelProxy',
      'Balances',
      'AuthorMapping',
    ],
  },
  'RelayChainAccountId': 'AccountId32',
  'RewardInfo': {
    'totalReward': 'Balance',
    'claimedReward': 'Balance',
  }
};

final TYPES_43_154 = <String, dynamic>{
  ...TYPES_37_42,
  'Collator2': {
    'id': 'AccountId',
    'bond': 'Balance',
    'nominators': 'Vec<AccountId>',
    'topNominators': 'Vec<Bond>',
    'bottomNominators': 'Vec<Bond>',
    'totalCounted': 'Balance',
    'totalBacking': 'Balance',
    'state': 'CollatorStatus',
  },
  'NominatorAdded': {
    '_enum': {'AddedToBottom': 'Null', 'AddedToTop': 'Balance'},
  },
  'RegistrationInfo': {
    'account': 'AccountId',
    'deposit': 'Balance',
  },
  'ParachainBondConfig': {
    'account': 'AccountId',
    'percent': 'Percent',
  }
};

final TYPES_155_199 = <String, dynamic>{
  ...TYPES_43_154,
  'EthereumSignature': {
    'r': 'H256',
    's': 'H256',
    'v': 'U8',
  },
  'NominatorAdded': {
    '_enum': {'AddedToTop': 'Balance', 'AddedToBottom': 'Null'},
  }
};

final TYPES_200_399 = <String, dynamic>{
  ...TYPES_155_199,
  'NominatorStatus': {
    '_enum': {'Active': 'Null', 'Leaving': 'RoundIndex'},
  },
  'Nominator2': {
    'nominations': 'Vec<Bond>',
    'revocations': 'Vec<AccountId>',
    'total': 'Balance',
    'scheduledRevocationsCount': 'u32',
    'scheduledRevocationsTotal': 'Balance',
    'status': 'NominatorStatus',
  },
  'ExitQ': {
    'candidates': 'Vec<AccountId>',
    'nominatorsLeaving': 'Vec<AccountId>',
    'candidateSchedule': 'Vec<(AccountId, RoundIndex)>',
    'nominatorSchedule': 'Vec<(AccountId, Option<AccountId>, RoundIndex)>',
  }
};

final TYPES_400_599 = <String, dynamic>{
  ...TYPES_200_399,
  'RewardInfo': {
    'totalReward': 'Balance',
    'claimedReward': 'Balance',
    'contributedRelayAddresses': 'Vec<RelayChainAccountId>',
  }
};

final TYPES_600_799 = <String, dynamic>{
  ...TYPES_400_599,
  'AssetType': {
    '_enum': {
      'Xcm': 'MultiLocation',
    },
  },
  'AssetId': 'u128',
  'TAssetBalance': 'u128',
  'ENUM_AccountId32': {
    'network': 'NetworkId',
    'id': '[u8; 32]',
  },
  'ENUM_AccountKey20': {
    'network': 'NetworkId',
    'key': '[u8; 20]',
  },
  'ENUM_AccountIndex64': {
    'network': 'NetworkId',
    'index': 'Compact<u64>',
  },
  'ENUM_Plurality': {
    'id': 'BodyId',
    'part': 'BodyPart',
  },
  'JunctionV0': {
    '_enum': {
      'Parent': 'Null',
      'Parachain': 'Compact<u32>',
      'AccountId32': 'ENUM_AccountId32',
      'AccountIndex64': 'ENUM_AccountIndex64',
      'AccountKey20': 'ENUM_AccountKey20',
      'PalletInstance': 'u8',
      'GeneralIndex': 'Compact<u128>',
      'GeneralKey': 'Vec<u8>',
      'OnlyChild': 'Null',
      'Plurality': 'ENUM_Plurality',
    },
  },
  'CurrencyId': {
    '_enum': {
      'SelfReserve': 'Null',
      'OtherReserve': 'u128',
    },
  },
  'AssetRegistrarMetadata': {
    'name': 'Vec<u8>',
    'symbol': 'Vec<u8>',
    'decimals': 'u8',
    'isFrozen': 'bool',
  },
  'VestingBlockNumber': 'u32',
  'MultiLocation': 'MultiLocationV0'
};

final TYPES_800_899 = <String, dynamic>{
  ...TYPES_600_799,
  'JunctionV1': {
    '_enum': {
      'Parachain': 'Compact<u32>',
      'AccountId32': 'ENUM_AccountId32',
      'AccountIndex64': 'ENUM_AccountIndex64',
      'AccountKey20': 'ENUM_AccountKey20',
      'PalletInstance': 'u8',
      'GeneralIndex': 'Compact<u128>',
      'GeneralKey': 'Vec<u8>',
      'OnlyChild': 'Null',
      'Plurality': 'ENUM_Plurality',
    },
  },
  'MultiLocation': 'MultiLocationV1'
};

final TYPES_900_undefined_deprecated = <String, dynamic>{
  ...TYPES_800_899,
  'MoonbaseRuntimeAssetRegistrarMetadata': {
    'name': 'Vec<u8>',
    'symbol': 'Vec<u8>',
    'decimals': 'u8',
    'is_frozen': 'bool',
  },
  'PalletCrowdloanRewardsRewardInfo': {
    'total_reward': 'Balance',
    'claimed_reward': 'Balance',
    'contributed_relay_addresses': 'Vec<RelayChainAccountId>',
  },
  'ParachainStakingNominator2': {
    'nominations': 'Vec<Bond>',
    'revocations': 'Vec<AccountId>',
    'total': 'Balance',
    'scheduled_revocations_count': 'u32',
    'scheduled_revocations_total': 'Balance',
    'status': 'NominatorStatus',
  },
  'ParachainStakingExitQ': {
    'candidates': 'Vec<AccountId>',
    'nominators_leaving': 'Vec<AccountId>',
    'candidate_schedule': 'Vec<(AccountId, RoundIndex)>',
    'nominator_schedule': 'Vec<(AccountId, Option<AccountId>, RoundIndex)>',
  },
  'ParachainStakingCollator2': {
    'id': 'AccountId',
    'bond': 'Balance',
    'nominators': 'Vec<AccountId>',
    'top_nominators': 'Vec<Bond>',
    'bottom_nominators': 'Vec<Bond>',
    'total_counted': 'Balance',
    'total_backing': 'Balance',
    'state': 'CollatorStatus',
  }
};

const TYPES_POST_900 = <String, dynamic>{
  'ProxyType': {
    '_enum': [
      'Any',
      'NonTransfer',
      'Governance',
      'Staking',
      'CancelProxy',
      'Balances',
      'AuthorMapping',
    ],
  },
};

final bundle = <String, dynamic>{
  'types': {'GenericEthereumAccountId': '[u8; 20]'},
  'typesAlias': {
    'assetManager': {'Balance': 'TAssetBalance'},
    'xTokens': {'Balance': 'TAssetBalance'}
  },
  'versions': [
    {
      'minmax': [0, 4],
      'types': TYPES_0_4,
    },
    {
      'minmax': [5, 5],
      'types': TYPES_5_5,
    },
    {
      'minmax': [6, 19],
      'types': TYPES_6_19,
    },
    {
      'minmax': [19, 35],
      'types': TYPES_19_35,
    },
    {
      'minmax': [36, 36],
      'types': TYPES_36_36,
    },
    {
      'minmax': [37, 42],
      'types': TYPES_37_42,
    },
    {
      'minmax': [43, 154],
      'types': TYPES_43_154,
    },
    {
      'minmax': [155, 199],
      'types': TYPES_155_199,
    },
    {
      'minmax': [200, 399],
      'types': TYPES_200_399,
    },
    {
      'minmax': [400, 599],
      'types': TYPES_400_599,
    },
    {
      'minmax': [600, 799],
      'types': TYPES_600_799,
    },
    {
      'minmax': [800, 899],
      'types': TYPES_800_899
    },
    {
      'minmax': [900, null],
      'types': TYPES_POST_900
    }
  ]
};