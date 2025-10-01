import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Simple product card that displays a title and a formatted cost.
// Use this widget anywhere you want a compact, read-only product summary.
class ProductCard extends StatelessWidget {
  final String title;
  final double cost;

  const ProductCard({super.key, required this.title, required this.cost});

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text("\$${cost.toStringAsFixed(2)}"),
        ),
      );
}

// Non-interactive like button that only reflects current "liked" state.
// This version is useful to show a state without handling input gestures here.
class LikeButton extends StatefulWidget {
  const LikeButton({super.key});
  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _liked = false;
  @override
  Widget build(BuildContext context) =>
      Icon(_liked ? Icons.favorite : Icons.favorite_border);
}

// Interactive like button that toggles between liked and unliked when tapped.
// Tapping the icon updates internal state and re-renders the icon accordingly.
class InteractiveLikeButton extends StatefulWidget {
  const InteractiveLikeButton({super.key});
  @override
  State<InteractiveLikeButton> createState() => _InteractiveLikeButtonState();
}

class _InteractiveLikeButtonState extends State<InteractiveLikeButton> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => setState(() => _liked = !_liked),
        child: Icon(_liked ? Icons.favorite : Icons.favorite_border),
      );
}

// Username form that echoes the current input below the field in real-time.
// Demonstrates basic text handling with setState.
class UsernameForm extends StatefulWidget {
  const UsernameForm({super.key});
  @override
  State<UsernameForm> createState() => _UsernameFormState();
}

class _UsernameFormState extends State<UsernameForm> {
  String _name = "";
  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextField(onChanged: (val) => setState(() => _name = val)),
          const SizedBox(height: 10),
          Text("Username: $_name"),
        ],
      );
}

// Counter: Basic counter screen with increment and decrement floating buttons.
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Counter")),
        body: Center(child: Text("$_count", style: const TextStyle(fontSize: 40))),
        floatingActionButton: Wrap(
          spacing: 10,
          children: [
            FloatingActionButton(
                onPressed: () => setState(() => _count++),
                child: const Icon(Icons.add)),
            FloatingActionButton(
                onPressed: () => setState(() => _count--),
                child: const Icon(Icons.remove)),
          ],
        ),
      );
}

// Visibility: Toggle showing/hiding a text widget using the Visibility widget.
class VisibilityPage extends StatefulWidget {
  const VisibilityPage({super.key});
  @override
  State<VisibilityPage> createState() => _VisibilityPageState();
}

class _VisibilityPageState extends State<VisibilityPage> {
  bool _show = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Toggle Visibility")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: _show,
                  child: const Text("Hello World", style: TextStyle(fontSize: 30))),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => setState(() => _show = !_show),
                  child: const Text("Toggle")),
            ],
          ),
        ),
      );
}

// List Page: Simple list builder with an input to add new list items.
class ListPage extends StatefulWidget {
  const ListPage({super.key});
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final items = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("List App")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(controller: controller),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () =>
                      setState(() => {items.add(controller.text), controller.clear()}),
                  child: const Text("Add")),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (_, i) => ListTile(title: Text(items[i])),
                ),
              ),
            ],
          ),
        ),
      );
}

// Color Box: Square that changes color when selecting one of the provided options.
class ColorBoxPage extends StatefulWidget {
  const ColorBoxPage({super.key});
  @override
  State<ColorBoxPage> createState() => _ColorBoxPageState();
}

class _ColorBoxPageState extends State<ColorBoxPage> {
  Color _color = Colors.grey;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Color Box")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 200, height: 200, color: _color),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                      onPressed: () => setState(() => _color = Colors.red),
                      child: const Text("Red")),
                  ElevatedButton(
                      onPressed: () => setState(() => _color = Colors.green),
                      child: const Text("Green")),
                  ElevatedButton(
                      onPressed: () => setState(() => _color = Colors.blue),
                      child: const Text("Blue")),
                ],
              ),
            ],
          ),
        ),
      );
}

// Greeting: Parent stateful widget that holds the name and renders a greeting.
class NameManager extends StatefulWidget {
  const NameManager({super.key});
  @override
  State<NameManager> createState() => _NameManagerState();
}

class _NameManagerState extends State<NameManager> {
  String _name = "Guest";
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Greeting")),
        body: Center(child: Greeting(name: _name)),
      );
}

class Greeting extends StatelessWidget {
  final String name;
  const Greeting({required this.name, super.key});
  @override
  Widget build(BuildContext context) =>
      Text("Hello, $name", style: const TextStyle(fontSize: 30));
}

// Temperature: Convert Celsius input into Fahrenheit and display the result.
class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});
  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double _celsius = 0.0;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Temperature Converter")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Celsius"),
                onChanged: (v) =>
                    setState(() => _celsius = double.tryParse(v) ?? 0.0),
              ),
              const SizedBox(height: 20),
              Text(
                "Fahrenheit: ${(_celsius * 9 / 5 + 32).toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      );
}

// Survey: Slider-based satisfaction score with a derived message for quick feedback.
class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});
  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  double _score = 5.0;
  // Derived feedback text based on the numeric score for user readability.
  String get message => _score < 3
      ? "Awful"
      : _score < 7
          ? "Okay"
          : "Great!";
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Survey")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Slider(
                  value: _score,
                  min: 0,
                  max: 10,
                  onChanged: (v) => setState(() => _score = v)),
              Text(message, style: const TextStyle(fontSize: 24)),
            ],
          ),
        ),
      );
}

// Prop Drilling: Demonstrates passing callbacks through multiple widget layers.
class Grandparent extends StatefulWidget {
  const Grandparent({super.key});
  @override
  State<Grandparent> createState() => _GrandparentState();
}

class _GrandparentState extends State<Grandparent> {
  int _count = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Prop Drilling")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter: $_count", style: const TextStyle(fontSize: 30)),
            Parent(counter: _count, onIncrement: () => setState(() => _count++)),
          ],
        ),
      );
}

class Parent extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;
  const Parent({super.key, required this.counter, required this.onIncrement});
  @override
  Widget build(BuildContext context) => Child(onIncrement: onIncrement);
}

class Child extends StatelessWidget {
  final VoidCallback onIncrement;
  const Child({super.key, required this.onIncrement});
  @override
  Widget build(BuildContext context) =>
      ElevatedButton(onPressed: onIncrement, child: const Text("Increment"));
}

// Provider Models: Example change notifier tracking a username role.
// Callers listen to changes and rebuild when the name updates.
class UserModel extends ChangeNotifier {
  String _username = "Guest";
  String get username => _username;
  void promoteUserToAdmin() {
    _username = "Admin";
    notifyListeners();
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("User")),
        body: Center(
          child: Selector<UserModel, String>(
            selector: (_, m) => m.username,
            builder: (_, username, __) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Username: $username",
                    style: const TextStyle(fontSize: 24)),
                ElevatedButton(
                    onPressed: () =>
                        context.read<UserModel>().promoteUserToAdmin(),
                    child: const Text("Make Admin")),
              ],
            ),
          ),
        ),
      );
}

class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  // Increments the internal counter by one and notifies listeners.
  void incrementCounter() {
    _count++;
    notifyListeners();
  }

  // Decrements the internal counter by one and notifies listeners.
  void decrementCounter() {
    _count--;
    notifyListeners();
  }

  // Resets the internal counter to zero and notifies listeners.
  void resetCounter() {
    _count = 0;
    notifyListeners();
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterModel>();
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
          child: Text("${counter.count}", style: const TextStyle(fontSize: 40))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: counter.incrementCounter, child: const Icon(Icons.add)),
          const SizedBox(height: 10),
          FloatingActionButton(onPressed: counter.decrementCounter, child: const Icon(Icons.remove)),
          const SizedBox(height: 10),
          FloatingActionButton(onPressed: counter.resetCounter, child: const Icon(Icons.refresh)),
        ],
      ),
    );
  }
}

class ThemeModel extends ChangeNotifier {
  bool dark = false;
  // Toggles dark theme on or off and notifies listeners so UI can update.
  void toggleTheme() {
    dark = !dark;
    notifyListeners();
  }
}

class ThemeSwitcherApp extends StatelessWidget {
  const ThemeSwitcherApp({super.key});
  @override
  Widget build(BuildContext context) => Consumer<ThemeModel>(
        builder: (_, model, __) => MaterialApp(
          theme: model.dark ? ThemeData.dark() : ThemeData.light(),
          home: const ThemeScreen(),
        ),
      );
}

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeModel>();
    return Scaffold(
      appBar: AppBar(title: const Text("Theme Switcher")),
      body: Center(
        child: Switch(value: theme.dark, onChanged: (_) => theme.toggleTheme()),
      ),
    );
  }
}

class TodoListModel extends ChangeNotifier {
  final tasks = <String>[];
  // Adds a new task to the list and notifies listeners to refresh UI.
  void addTask(String task) {
    tasks.add(task);
    notifyListeners();
  }

  // Removes a task at the given index and notifies listeners.
  void removeTask(int i) {
    tasks.removeAt(i);
    notifyListeners();
  }
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: controller),
            ElevatedButton(
                onPressed: () {
                  context.read<TodoListModel>().addTask(controller.text);
                  controller.clear();
                },
                child: const Text("Add Task")),
            Expanded(
              child: Consumer<TodoListModel>(
                builder: (_, model, __) => ListView.builder(
                  itemCount: model.tasks.length,
                  itemBuilder: (_, i) => ListTile(
                    title: Text(model.tasks[i]),
                    trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => model.removeTask(i)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
