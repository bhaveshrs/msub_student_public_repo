import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:msub/config/common_widgets/tost_msg.dart';
import 'package:msub/config/network_services/api_result_service.dart';
import 'package:msub/config/resource/storage_service.dart';
import 'package:msub/features/signup_verify/models/set_user_response.dart';
import 'package:msub/features/signup_verify/repo/sign_up_verify_repository.dart';

part 'sign_up_verify_event.dart';
part 'sign_up_verify_state.dart';

class SignUpVerifyBloc extends Bloc<SignUpVerifyEvent, SignUpVerifyState> {
  final SignUpVerifyRepository _repository = SignUpVerifyRepository();

  SignUpVerifyBloc() : super(const SignUpVerifyState()) {
    on<SendEmailOtpEvent>(_onSendEmailOtp);
    on<VerifyEmailOtpEvent>(_onVerifyEmailOtp);
    on<CreatePasswordEvent>(_onCreatePassword);
    on<SendMobileOtpEvent>(_onSendMobileOtp);
    on<VerifyMobileOtpEvent>(_onVerifyMobileOtp);
  }

  Future<void> _onSendEmailOtp(
      SendEmailOtpEvent event, Emitter<SignUpVerifyState> emit) async {
    emit(state.copyWith(
        sendEmailOtpStatus: FormzSubmissionStatus.inProgress, error: null));

    try {
      final response =
          await _repository.sendEmailOtp(prn: event.prn, email: event.email);

      if (response is RepoSuccess) {
        emit(state.copyWith(
            sendEmailOtpStatus: FormzSubmissionStatus.success,
            startTimerForEmail: true));
        showCustomToast(response.message!, true);
      } else {
        emit(state.copyWith(
            sendEmailOtpStatus: FormzSubmissionStatus.failure,
            error: (response as RepoFailure).error));
        showCustomToast(response.error, false);
      }
    } catch (e) {
      emit(state.copyWith(
          sendEmailOtpStatus: FormzSubmissionStatus.failure,
          error: "Something went wrong"));
      showCustomToast("Something went wrong", false);
    }
  }

  Future<void> _onVerifyEmailOtp(
      VerifyEmailOtpEvent event, Emitter<SignUpVerifyState> emit) async {
    emit(state.copyWith(
        verifyEmailOtpStatus: FormzSubmissionStatus.inProgress, error: null));

    try {
      final response = await _repository.verifyEmailOtp(
          prn: event.prn, email: event.email, otp: event.otp);

      if (response is RepoSuccess) {
        emit(state.copyWith(
          verifyEmailOtpStatus: FormzSubmissionStatus.success,
        ));
        showCustomToast(response.message!, true);
      } else {
        emit(state.copyWith(
            verifyEmailOtpStatus: FormzSubmissionStatus.failure,
            error: (response as RepoFailure).error));
        showCustomToast(response.error, false);
      }
    } catch (e) {
      emit(state.copyWith(
          verifyEmailOtpStatus: FormzSubmissionStatus.failure,
          error: "Something went wrong"));
      showCustomToast("Something went wrong", false);
    }
  }

  Future<void> _onCreatePassword(
      CreatePasswordEvent event, Emitter<SignUpVerifyState> emit) async {
    emit(state.copyWith(
        createPasswordStatus: FormzSubmissionStatus.inProgress, error: null));

    try {
      final response = await _repository.createPassword(
          prn: event.prn, email: event.email, password: event.password);

      if (response is RepoSuccess) {
        SetUserResponse setUserResponse = response.data;
        if (setUserResponse.token != null) {
          print("setUserResponse.token ${setUserResponse.token}");
          await StorageService().setSessionToken(setUserResponse.token ?? "");
        }
        emit(state.copyWith(
            createPasswordStatus: FormzSubmissionStatus.success));
        showCustomToast(response.message!, true);
      } else {
        emit(state.copyWith(
            createPasswordStatus: FormzSubmissionStatus.failure,
            error: (response as RepoFailure).error));
        showCustomToast(response.error, false);
      }
    } catch (e) {
      emit(state.copyWith(
          createPasswordStatus: FormzSubmissionStatus.failure,
          error: "Something went wrong"));
      showCustomToast("Something went wrong", false);
    }
  }

  Future<void> _onSendMobileOtp(
      SendMobileOtpEvent event, Emitter<SignUpVerifyState> emit) async {
    emit(state.copyWith(sendMobileOtpStatus: FormzSubmissionStatus.inProgress));

    final response =
        await _repository.sendMobileOtp(prn: event.prn, mobile: event.mobile);
    if (response is RepoSuccess) {
      emit(state.copyWith(
          sendMobileOtpStatus: FormzSubmissionStatus.success,
          startTimerForMobile: true));
      showCustomToast(response.message!, true);
    } else {
      emit(state.copyWith(
          sendMobileOtpStatus: FormzSubmissionStatus.failure,
          error: (response as RepoFailure).error));
      showCustomToast(response.error, false);
    }
  }

  Future<void> _onVerifyMobileOtp(
      VerifyMobileOtpEvent event, Emitter<SignUpVerifyState> emit) async {
    emit(state.copyWith(
        verifyMobileOtpStatus: FormzSubmissionStatus.inProgress));

    final response = await _repository.verifyMobileOtp(
        prn: event.prn, mobile: event.mobile, otp: event.otp);
    if (response is RepoSuccess) {
      emit(state.copyWith(
        verifyMobileOtpStatus: FormzSubmissionStatus.success,
      ));
      showCustomToast(response.message!, true);
    } else {
      emit(state.copyWith(
          verifyMobileOtpStatus: FormzSubmissionStatus.failure,
          error: (response as RepoFailure).error));
      showCustomToast(response.error, false);
    }
  }
}
