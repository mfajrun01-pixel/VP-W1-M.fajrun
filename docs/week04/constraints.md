# Constraint Diagnosis — Week 04

Understanding Flutter constraint rules is key to diagnosing and fixing overflow issues (`A RenderFlex overflowed by... pixels`).

---

## 1. Unconstrained Horizontal Text in Row (`RenderFlex` Overflow)

### Constraint Rule Violated
> *A `Row` gives its children unbounded width; an unconstrained `Text` widget with a long string will exceed the parent screen bounds instead of wrapping.*

### Fix
Wrap the `Text` widget inside `Expanded` or `Flexible`, and apply `maxLines` with `TextOverflow.ellipsis`:
```dart
Row(
  children: [
    Expanded(
      child: Text(
        'Long title text...',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  ],
);
```

---

## 2. Unbounded ListView Height inside Column (`Vertical Viewport` Error)

### Constraint Rule Violated
> *A `Column` provides unbounded height constraint to its children, while a `ListView` attempts to expand infinitely unless constrained.*

### Fix
Wrap the `ListView.builder` inside an `Expanded` widget, giving it explicit bounded constraints derived from the remaining `Column` height:
```dart
Column(
  children: [
    const HeaderWidget(),
    Expanded(
      child: ListView.builder(...),
    ),
  ],
);
```

---

## 3. Keyboard Bottom Inset Vertical Overflow (`Yellow Stripes` on Soft Keyboard)

### Constraint Rule Violated
> *Opening the soft keyboard reduces the available vertical viewport height, causing fixed non-scrollable `Column` layouts to exceed the screen bottom bounds.*

### Fix
Wrap static non-scrollable content inside a `SingleChildScrollView` or `CustomScrollView` so the content scrolls smoothly when the keyboard reduces screen height:
```dart
SingleChildScrollView(
  child: Column(
    children: [
      ...
    ],
  ),
);
```
