import 'package:equatable/equatable.dart';
import 'package:ibaapp/models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState() : super();
  @override
  List<Object> get props => [];
}

class UserEmpty extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<ProductModel> user;

  const UserLoaded({required this.user}) : super();
}

class UserError extends UserState {
  final String? errorMsg;
  const UserError({this.errorMsg});
}
