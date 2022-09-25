dart run test ./test/metadata_test.dart --no-chain-stack-traces --no-run-skipped --coverage=./coverage --concurrency=9
dart run test ./test/type_exp_test.dart --no-chain-stack-traces --no-run-skipped --coverage=./coverage --concurrency=9
dart run test ./test/xcm_test.dart --no-chain-stack-traces --no-run-skipped --coverage=./coverage --concurrency=9
dart pub global run coverage:format_coverage --packages=.dart_tool/package_config.json --report-on=lib --lcov -o ./coverage/lcov.info -i ./coverage
genhtml -o ./coverage/report ./coverage/lcov.info
open ./coverage/report/index.html