part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthSuccessState extends AuthState {}

final class AuthErrorState extends AuthState {}

final class AuthLoadingState extends AuthState {}
