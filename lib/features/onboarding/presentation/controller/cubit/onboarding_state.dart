part of 'onboarding_cubit.dart';


sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}
final class OnboardingUpdateIndicator extends OnboardingState {}
final class OnboardingUpdateText extends OnboardingState {}
