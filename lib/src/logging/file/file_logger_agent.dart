part of minerva_logging;

class FileLoggerAgent extends Agent {
  late final File _file;

  final Queue<String> _queue = Queue();

  bool _isRecording = false;

  @override
  Future<void> initialize(Map<String, dynamic> data) async {
    String logPath = data['logPath'] ?? '~/log/log.log';

    _file = File.fromUri(Uri.file(FilePathParser.parse(logPath)));
  }

  @override
  void cast(String action, Map<String, dynamic> data) {
    var log = data['log'] as String;

    _queue.add(log);

    _handleQueue();
  }

  void _handleQueue() {
    if (!_isRecording && _queue.isNotEmpty) {
      var log = _queue.removeFirst();

      _isRecording = true;

      _writeToFile(log).then((value) {
        _isRecording = false;

        _handleQueue();
      });
    }
  }

  Future<void> _writeToFile(String log) async {
    if (!await _file.exists()) {
      await _file.create(recursive: true);
    }

    await _file.addLine(log);
  }
}
