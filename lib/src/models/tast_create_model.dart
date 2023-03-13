import 'sub_task_create.dart';

class TaskCreateModel {
  TaskCreateModel({
    required this.title,
    this.description,
    this.reproSteps,
    this.assignedTo,
  });

  /// ![](https://raw.githubusercontent.com/DoanpPhiHo/azure_create_task/master/assets/title.png)
  final String title;

  ///ex: bug bla bla
  ///     <img src="https://raw.githubusercontent.com/DoanpPhiHo/azure_create_task/master/assets/title.png"/>
  ///     <img src="https://raw.githubusercontent.com/DoanpPhiHo/azure_create_task/master/assets/title.png"/>
  ///     <img src="https://raw.githubusercontent.com/DoanpPhiHo/azure_create_task/master/assets/title.png"/>
  ///    end bug bla bla
  /// ![](https://raw.githubusercontent.com/DoanpPhiHo/azure_create_task/master/assets/Screenshot%202023-03-10%20at%2015.25.49.png)
  final String? description;

  /// ![](https://raw.githubusercontent.com/DoanpPhiHo/azure_create_task/master/assets/Screenshot%202023-03-10%20at%2015.25.28.png)
  final String? reproSteps;

  /// ex: hodp@gmail.com.vn
  /// ![](https://raw.githubusercontent.com/DoanpPhiHo/azure_create_task/master/assets/Screenshot%202023-03-10%20at%2015.25.10.png)
  final String? assignedTo;

  List<SubTaskCreate> toBody() => [
        SubTaskCreate(
          op: 'add',
          path: '/fields/System.Title',
          value: title.isNotEmpty ? title : 'Unknown',
        ),
        if (description != null && description!.isNotEmpty)
          SubTaskCreate(
            op: 'add',
            path: '/fields/System.Description',
            value: description,
          ),
        if (reproSteps != null && reproSteps!.isNotEmpty)
          SubTaskCreate(
            op: 'add',
            path: '/fields/Microsoft.VSTS.TCM.ReproSteps',
            value: reproSteps,
          ),
        if (assignedTo != null && assignedTo!.isNotEmpty)
          SubTaskCreate(
            op: 'add',
            path: '/fields/System.AssignedTo',
            value: assignedTo,
          ),
      ];
}
