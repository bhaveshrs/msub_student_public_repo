import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:msub/config/network_services/api_result_service.dart';
import 'package:msub/config/resource/storage_service.dart';
import 'package:msub/features/notification/model/notification_data.dart';
import 'package:msub/features/notification/model/notification_model.dart';
import 'package:msub/features/notification/notification_repo.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState()) {
    NotificationRepo notificationRepo = NotificationRepo();
    on<LoadNotifications>((event, emit) async {
      emit(state.copyWith(
          loadNotificationStatus: FormzSubmissionStatus.inProgress));
      try {
        String? token = await StorageService().getSessionToken();
        RepoResult response = await notificationRepo.getNotifications(
            payload: json.encode({"page_number": 1, 'token': token}));

        if (response is RepoSuccess) {
          NotificationModel notificationData = response.data;
          List<NotificationData> allData = List.from(state.notifications)
            ..addAll(notificationData.data ?? []);
          emit(state.copyWith(
              loadNotificationStatus: FormzSubmissionStatus.success,
              notifications: allData));
        } else if (response is RepoFailure) {
          String msg = response.data != null ? (response).data[0] : "";
          emit(state.copyWith(
              loadNotificationStatus: FormzSubmissionStatus.failure,
              errorMsg: msg != "" ? msg : (response).error));
        }
      } catch (e) {
        emit(state.copyWith(
            loadNotificationStatus: FormzSubmissionStatus.failure,
            errorMsg: "something went wrong"));
      }
    });
  }
}
