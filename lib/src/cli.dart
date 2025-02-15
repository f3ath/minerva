library minerva_cli;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:path/path.dart';

import 'core.dart';

part 'cli/exception/cli_command_exception.dart';
part 'cli/exception/app_setting_parser_exception.dart';
part 'cli/exception/build_setting_parser_exception.dart';

part 'cli/runner.dart';
part 'cli/command/get_dependencies_cli_command.dart';

part 'cli/util/app_setting/app_setting_parser/app_setting_parser.dart';
part 'cli/util/app_setting/app_setting_parser/app_setting_parse_result.dart';
part 'cli/util/app_setting/build_app_setting_builder.dart';
part 'cli/util/app_setting/asset/app_setting_assets_parser.dart';
part 'cli/util/app_setting/asset/assets_files_parser.dart';
part 'cli/util/app_setting/asset/file_log_creater.dart';

part 'cli/util/build_setting_parser.dart';

part 'cli/command/create/create_command.dart';
part 'cli/command/create/create_docker_ignore_cli_command.dart';
part 'cli/command/create/project_clear_cli_command.dart';
part 'cli/command/create/project_create_cli_command.dart';
part 'cli/command/create/configure/configure_project_cli_command.dart';
part 'cli/command/create/configure/configure_app_setting_cli_command.dart';
part 'cli/command/create/configure/configure_git_ignore_cli_command.dart';
part 'cli/command/create/configure/configure_pubspec_cli_command.dart';
part 'cli/command/create/configure/create_example/create_example_cli_command.dart';
part 'cli/command/create/configure/create_example/create_example_test_cli_command.dart';

part 'cli/command/run/run_command.dart';
part 'cli/command/run/run_application_cli_command.dart';

part 'cli/command/clear/clear_command.dart';
part 'cli/command/clear/clear_directory_cli_command.dart';

part 'cli/cli_command.dart';
part 'cli/cli_pipeline.dart';

part 'cli/command/build/build_command.dart';
part 'cli/command/build/create_build_app_setting_cli_command.dart';
part 'cli/command/build/compile_cli_command.dart';
part 'cli/command/build/details/file_log.dart';
part 'cli/command/build/details/file_log_type.dart';
part 'cli/command/build/generate_test_app_setting_cli_command.dart';
part 'cli/command/build/clone_assets_cli_command.dart';
part 'cli/command/build/rebuild_cli_command.dart';
part 'cli/command/build/build_cli_command.dart';

part 'cli/command/docker/docker_command.dart';
part 'cli/command/docker/create_docker_file_cli_command.dart';

part 'cli/command/test/test_command.dart';

part 'cli/command/debug/debug_command.dart';
