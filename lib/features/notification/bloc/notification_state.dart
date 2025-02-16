// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final FormzSubmissionStatus loadNotificationStatus;
  final FormzSubmissionStatus loadMoreNotificationStatus;
  final List<NotificationData> notifications;
  final NotificationModel? notificationModel;
  final String? errorMsg;
  const NotificationState(
      {this.loadNotificationStatus = FormzSubmissionStatus.initial,
      this.loadMoreNotificationStatus = FormzSubmissionStatus.initial,
      this.notifications = const [],
      this.notificationModel,
      this.errorMsg});

  @override
  List<Object?> get props => [
        loadNotificationStatus,
        loadMoreNotificationStatus,
        notifications,
        notificationModel,
        errorMsg
      ];

  NotificationState copyWith({
    FormzSubmissionStatus? loadNotificationStatus,
    FormzSubmissionStatus? loadMoreNotificationStatus,
    List<NotificationData>? notifications,
    NotificationModel? notificationModel,
    String? errorMsg
  }) {
    return NotificationState(
      loadNotificationStatus:
          loadNotificationStatus ?? this.loadNotificationStatus,
      loadMoreNotificationStatus:
          loadMoreNotificationStatus ?? this.loadMoreNotificationStatus,
      notifications: notifications ?? this.notifications,
      notificationModel: notificationModel ?? this.notificationModel,
      errorMsg: errorMsg ?? this.errorMsg
    );
  }
}
