
import 'package:get/get.dart';
import 'package:work_compass/features/workforce_compass/data/datasources/worforce_remote_datasource_impl.dart';
import 'package:work_compass/features/workforce_compass/data/repository/workforce_repository.dart';
import 'package:work_compass/features/workforce_compass/data/repository/workforce_repository_impl.dart';

import 'core/utils/app_http_client.dart';
import 'core/utils/shared_preferences_wrapper.dart';
import 'features/authentication/data/datasource/auth_local_data_source.dart';
import 'features/authentication/data/datasource/auth_remote_data_source.dart';
import 'features/authentication/data/datasource/auth_remote_data_source_impl.dart';
import 'features/authentication/data/repositories/auth_repository.dart';
import 'features/authentication/data/repositories/auth_repository_impl.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SharedPreferencesWrapper>(
      SharedPreferencesWrapper(),
    );

    Get.put<AuthLocalDataSource>(
      AuthLocalDataSourceImpl(Get.find()),
    );


    Get.put<AppHTTPClient>(
      AppHTTPClient(Get.find()),
    );

    Get.put<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(client: Get.find()),
    );

    Get.put<AuthRepository>(
      AuthRepositoryImpl(
        authRemoteDataSource: Get.find(),
        authLocalDataSource: Get.find(),
      ),
    );

    Get.put<WorkForceRepository>(
      WorkforceRepositoryImpl(
        workforceRemoteDatasource: WorkforceRemoteDatasourceImpl(client: Get.find()
          
        ),
      ),
    );
  }
}
