import 'package:agua_coach_app/core/common/build_config.dart';

class ProductionBuildConfig extends BuildConfig {
  @override
  Map<String, dynamic> configs = {
    'app': 'App da água',
    'stage': 'production',
  };
}
