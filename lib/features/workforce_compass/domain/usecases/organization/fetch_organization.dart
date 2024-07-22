import 'package:dartz/dartz.dart';
import 'package:work_compass/core/errors/failure.dart';
import 'package:work_compass/core/usecase/usecase.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/organization/organization_model.dart';
import 'package:work_compass/features/workforce_compass/data/repository/workforce_repository.dart';

class FetchOrganization implements UseCase<Organization,NoParams>{
  FetchOrganization({required this.workForceRepository});

  final WorkForceRepository workForceRepository;
  @override
  Future<Either<Failure, Organization>> call(NoParams params) {
    return workForceRepository.fetchOrganization();
  }

}