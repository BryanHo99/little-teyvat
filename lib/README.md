## Motivation
This personal project is initialized as an avenue to learn Flutter alongside other disciplines including animations, state management, architectural patterns, and object-oriented design.

## Architecture
#### Feature-first Folder Structure
- Referenced from [React](https://reactjs.org/docs/faq-structure.html) and [this discussion](https://github.com/brianegan/new_flutter_template/issues/10).
- Feature-first, and within each feature folder, a function first structure.
- The aim is to simplify navigation and ease modification in the project.

#### MVC+S Architecture
- Referenced from [gskinner](https://blog.gskinner.com/archives/2020/09/flutter-state-management-with-mvcs.html).
- I have researched on other architectures including **MVVM** and **DDD** but decided to settle with **MVC** as it enables clearer separation of concerns for my preferences.
- **Models** hold the data classes.
- **Views** display the UI.
- **Controllers** handle the business logic and state management.
- **Services** fetch and update data from external sources.

#### Riverpod for State Management
- [Riverpod](https://pub.dev/packages/riverpod) on pub.dev.
- I tried other state management solutions such as **Provider** and **GetX** but I have issues with the following:
	- **Provider** is dependent on the BuildContext, not compile-safe, and pollutes the widget tree with nested dependencies.
	- **GetX** has global mutable state, encourages bad practices of rebuilding controllers within the build method, and is difficult to test.
	- **Riverpod** addresses these issues and provides other utitilies such as asynchronous data manipulation and error handling with AsyncValue.
- ChangeNotifier is strictly not used in this project to avoid mutable state.

#### Freezed and json_serializable for Code Generation
- [Freezed](https://pub.dev/packages/freezed) and [json_serializable](https://pub.dev/packages/json_serializable) on pub.dev.
- Code generation tools where:
	- **Freezed** generates immutable data classes and sealed unions that enhances Riverpod.
	- **json_serializable** generates code for JSON serialization and deserialization.
	
#### Other Packages
- [fast_immutable_collections](https://pub.dev/packages/fast_immutable_collections) for immutable lists and maps.
- [flutter_hooks](https://pub.dev/packages/flutter_hooks) for code reuse, especially for handling animations.
- [hive](https://pub.dev/packages/hive) for local storage.

## VSCode Extensions
- [Freezed](https://marketplace.visualstudio.com/items?itemName=blaxou.freezed)
- [flutter-stylizer](https://marketplace.visualstudio.com/items?itemName=gmlewis-vscode.flutter-stylizer)
- [Riverpod Snippsets](https://marketplace.visualstudio.com/items?itemName=Pythonhub.riverpodsnippets)
- [Flutter Intl](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl)
