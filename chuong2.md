# CHƯƠNG 2: CẤU TRÚC ĐIỀU KIỆN (CONDITIONAL EXECUTION)

## 2.1. Giá trị Boolean và truthiness
- `True` / `False` là `bool` (nên dùng `True` / `False` thay vì `1` / `0` cho biểu diễn boolean).
- Truthiness: giá trị bị chuyển sang boolean theo quy tắc:
  - Falsy: `False`, `None`, `0`, `0.0`, `''`, `[]`, `()`, `{}`, `set()`, `range(0)`
  - Mọi cái khác → `True`.

## 2.2. Toán tử logic và rút gọn
- ``and`` / ``or`` trả về một trong các toán hạng (không bắt buộc là `bool`) theo luật short-circuit:
```python
a and b  # nếu a falsy -> trả a, else trả b
a or b   # nếu a truthy -> trả a, else trả b
```
- Dùng để gán mặc định: ``x = user_input or 'default'``

## 2.3. Cấu trúc if / elif / else & mẫu code
- Chú ý: thụt lề là ngữ pháp.
- Sử dụng biểu thức điều kiện phức tạp với ``and``, ``or``.
- Tránh lồng `if` quá sâu — tách hàm/điều kiện.

## 2.4. Pattern Matching (Python 3.10+)
- `match` / `case` cung cấp cú pháp so khớp cấu trúc (pattern matching).
```python
match obj:
    case {'type': 'error', 'code': code}:
        handle_error(code)
    case [x, y]:
        ...
    case _:
        ...
```
- Dùng khi cần tách cấu trúc dữ liệu phức tạp; không thay thế mọi `if`/`elif`.

## 2.5. Xử lý ngoại lệ (try / except / else / finally)
- Cấu trúc:
```python
try:
    risky()
except SpecificError as e:
    handle(e)
except Exception:
    fallback()
else:
    # chạy nếu không exception
finally:
    # luôn chạy (dùng để đóng file/socket)
```
- Không dùng bare `except`: `except:` sẽ bắt cả `KeyboardInterrupt`, `SystemExit`.
- Bắt exception cụ thể giúp debug.