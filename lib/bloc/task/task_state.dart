part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}
class TaskStoreLoadingState extends TaskState {}
class TaskStoreSuccessState extends TaskState {}
class TaskStoreErrorState extends TaskState {}

class GetAllTasksLoadingState extends TaskState {}
class GetAllTasksSuccessState extends TaskState {}
class GetAllTasksErrorState extends TaskState {}

class GetTaskByIdLoadingState extends TaskState {}
class GetTaskByIdSuccessState extends TaskState {}
class GetTaskByIdErrorState extends TaskState {}

class EditTaskByIdLoadingState extends TaskState {}
class EditTaskByIdSuccessState extends TaskState {}
class EditTaskByIdErrorState extends TaskState {}

class DeleteTaskByIdLoadingState extends TaskState {}
class DeleteTaskByIdSuccessState extends TaskState {}
class DeleteTaskByIdErrorState extends TaskState {}







