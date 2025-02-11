import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:msub/config/common_widgets/tost_msg.dart';
import 'package:msub/config/network_services/api_result_service.dart';
import 'package:msub/features/signup/models/get_user_model.dart';
import 'package:msub/features/signup/repo/sign_up_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository _signUpRepository = SignUpRepository();

  SignUpBloc() : super(const SignUpState()) {
    on<PRNEnteredEvent>(_onPRNEntered);
    on<UpdateUserNameEvent>(_onUpdateUserName);
  }

  Future<void> _onPRNEntered(
      PRNEnteredEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
        checkUserStatus: FormzSubmissionStatus.inProgress, error: null));

    try {
      RepoResult response =
          await _signUpRepository.checkUserExists(prn: event.prn);
      if (response is RepoSuccess) {
        final GetUserModel getUserModel = response.data;
        emit(state.copyWith(
          getName: true,
          checkUserStatus: FormzSubmissionStatus.success,
          prn: event.prn,
          name: getUserModel.name,
        ));
        showCustomToast(response.message!, true);
      } else {
        emit(state.copyWith(
            checkUserStatus: FormzSubmissionStatus.failure,
            error: (response as RepoFailure).error));
        showCustomToast(response.error, false);
      }
    } catch (e) {
      emit(state.copyWith(
          checkUserStatus: FormzSubmissionStatus.failure,
          error: "Something went wrong"));
      showCustomToast("Something went wrong", false);
    }
  }

  Future<void> _onUpdateUserName(
      UpdateUserNameEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
        updateUserStatus: FormzSubmissionStatus.inProgress, error: null));

    try {
      RepoResult response = await _signUpRepository.updateUserName(
          prn: event.prn, name: event.name);
      if (response is RepoSuccess) {
        emit(state.copyWith(updateUserStatus: FormzSubmissionStatus.success));
        showCustomToast(response.message!, true);
      } else {
        emit(state.copyWith(
            updateUserStatus: FormzSubmissionStatus.failure,
            error: (response as RepoFailure).error));
        showCustomToast(response.error, false);
      }
    } catch (e) {
      emit(state.copyWith(
          updateUserStatus: FormzSubmissionStatus.failure,
          error: "Something went wrong"));
      showCustomToast("Something went wrong", false);
    }
  }
}
