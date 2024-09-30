import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;


//mb - 192.168.108.217
const String ip =  '192.168.100.12';
const String socketUrlLocal = kIsWeb ? 'http://localhost:3000/':'http://$ip:3000/';
const String socketUrlLive = 'https://rollkall.onrender.com';
const String baseUrlLocal = kIsWeb ? 'http://localhost:3000/api/':'http://$ip:3000/api/';
const String baseUrl = 'http://$ip:3000/api/';// 'https://rollkall.onrender.com/api/';
enum Environment { development, production }

bool isTesting = kIsWeb? false:Platform.environment.containsKey('FLUTTER_TEST');

const String _env =
    String.fromEnvironment('env.mode', defaultValue: 'dev');

Environment get environment {
  const Map<String, Environment> _envs = <String, Environment>{
    'dev': Environment.development,
    'prod': Environment.production,
  };

  if (!_envs.containsKey(_env)) {
    throw Exception(
        "Invalid runtime environment: '$_env'. Available environments: ${_envs.keys.join(', ')}");
  }

  return _envs[_env]!;
}

extension EnvironmentX on Environment {

  bool get isDev => this == Environment.development;

  bool get isProduction => this == Environment.production;

  bool get isDebugging {
    bool condition = false;
    assert(() {
      condition = true;
      return condition;
    }());
    return condition;
  }

  String get value {
    return <Environment, String>{
      Environment.development: 'DEV',
      Environment.production: 'PROD',
    }[this]!;
  }



  String get socketUrl {
    return <Environment, String>{
      Environment.development: socketUrlLocal,
      Environment.production: socketUrlLive,
    }[this]!;
  }

  String get url {
    return <Environment, String>{
      Environment.development: baseUrlLocal,
      Environment.production: baseUrl,
    }[this]!;
  }
}


