const c_op = ['+', '-', '*', '/', 'C', '='];

class Calculator {
  static List<String> _disp = ['', ''];
  static List<double> _acc = [null, null]; // null: 不確定
  static int _acc_num = 0;
  static String _op = '';
  static double _ans = null;

  static List receive(String str) {
    if (c_op.contains(str)) {
      if (str == 'C') {
        clear();
      } else if (str == '=') {
        if (_acc[0] != null && _acc[1] != null && _op != '') {
          calc();
          _op = '';
          _acc_num = 0;
        }
        _disp[1] = '';
      } else {
        if (_acc[0] == null) {
          _acc_num = 0;
        } else if (_acc[1] == null) {
          _acc_num = 1;
        } else {
          calc();
        }
        _op = str;
      }
    } else {
      if (_acc[0] == null || _acc[1] == null) {
        _disp[0] = '';
      }
      _disp[0] += str;
      _acc[_acc_num] = double.parse(_disp[0]);
    }

    print("_acc: ${_acc}   _op: ${_op}");
    return [_disp[0], _disp[1], _op];
  }

  static void calc() {
    switch (_op) {
      case '+':
        _acc[0] = _acc[0] + _acc[1];
        break;
      case '-':
        _acc[0] = _acc[0] - _acc[1];
        break;
      case '*':
        _acc[0] = _acc[0] * _acc[1];
        break;
      case '/':
        _acc[0] = _acc[0] / _acc[1];
        break;
    }
    _acc[1] = null;
    _disp[0] = _acc[0].round().toString();
    _disp[1] = _acc[0].round().toString();
  }

  static List clear() {
    _disp = ['0', ''];
    _acc = [null, null];
    _acc_num = 0;
    _op = '';
  }
}
