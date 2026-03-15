# Swift 数组 Demo

## 简介

本示例演示 Swift 中数组（Array）的创建、访问、修改以及常用操作方法，包括添加、删除、遍历和函数式编程操作。

## 基本原理

数组是编程中最基础的数据结构之一，用于存储有序的同类型元素集合。Swift 中的数组具有以下特点：

1. **有序性**：元素按照添加顺序存储，可通过索引访问
2. **类型安全**：Swift 是强类型语言，数组必须指定元素类型
3. **值类型**：Swift 数组是结构体，赋值时会复制一份（值语义）
4. **索引从 0 开始**：第一个元素的索引是 0

Swift 数组的底层实现是一个连续的内存块，提供了 O(1) 的随机访问性能。

## 启动和使用

### 环境要求

- macOS 系统（自带 Swift 5.7+）
- 或安装 Swift 工具链：https://swift.org/download/

### 安装和运行

```bash
cd swift-array-demo
swift run
```

### 预期输出

```
第一个水果: apple
数组长度: 3
添加后: ["apple", "banana", "orange", "grape"]
插入后: ["apple", "mango", "banana", "orange", "grape"]
删除后: ["apple", "mango", "orange", "grape"]

遍历数组:
  - apple
  - mango
  - orange
  - grape

带索引遍历:
  [0] apple
  [1] mango
  [2] orange
  [3] grape

偶数: [2, 4, 6, 8, 10]
翻倍: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
排序后: [1, 1, 2, 3, 4, 5, 6, 9]
```

## 教程

### 什么是数组？

数组是一种线性数据结构，可以存储多个相同类型的元素。在 Swift 中，我们可以这样创建数组：

```swift
// 创建数组
var fruits = ["apple", "banana", "orange"]
let numbers = [1, 2, 3, 4, 5]
```

这里有两点需要注意：
- 使用 `var` 声明可变数组
- 使用 `let` 声明不可变数组（常量数组）

### 访问数组元素

数组元素通过索引访问，索引从 0 开始：

```swift
let first = fruits[0]  // "apple"
let second = fruits[1] // "banana"
```

你也可以使用负数索引，但 Swift 不支持负数索引，这会导致崩溃。安全的方式是先检查索引是否有效：

```swift
if fruits.indices.contains(0) {
    print(fruits[0])
}
```

获取数组长度使用 `count` 属性：

```swift
print(fruits.count)  // 3
```

### 添加元素

Swift 数组提供了多种添加元素的方式：

```swift
// 在末尾添加单个元素
fruits.append("grape")

// 在指定位置插入元素
fruits.insert("mango", at: 1)  // 插入到索引 1 的位置

// 追加另一个数组
fruits.append(contentsOf: ["pear", "peach"])
```

### 删除元素

删除元素的常用方法：

```swift
// 删除指定位置的元素
fruits.remove(at: 2)

// 删除最后一个元素
fruits.removeLast()

// 删除第一个元素
fruits.removeFirst()

// 清空数组
fruits.removeAll()
```

**重要提示**：删除元素时，要确保索引在有效范围内（0 到 count-1），否则会导致运行时错误。

### 遍历数组

Swift 提供了多种遍历数组的方式：

```swift
// 简单遍历
for fruit in fruits {
    print(fruit)
}

// 带索引遍历
for (index, fruit) in fruits.enumerated() {
    print("[\(index)] \(fruit)")
}

// 反向遍历
for fruit in fruits.reversed() {
    print(fruit)
}
```

### 函数式操作

Swift 数组支持函数式编程的高阶函数，这是 Swift 的强大特性：

**filter - 过滤**

```swift
let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let evens = nums.filter { $0 % 2 == 0 }
// 结果: [2, 4, 6, 8, 10]
```

`filter` 方法接收一个闭包，对每个元素执行判断，返回满足条件的元素组成的新数组。`$0` 表示闭包的第一个参数。

**map - 映射**

```swift
let doubled = nums.map { $0 * 2 }
// 结果: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
```

`map` 方法对数组中的每个元素进行转换，返回转换后的新数组。

**sort - 排序**

```swift
var mutableNums = [3, 1, 4, 1, 5, 9, 2, 6]
mutableNums.sort()  // 原地排序
// 结果: [1, 1, 2, 3, 4, 5, 6, 9]
```

`sort()` 会修改原数组。如果需要返回排序后的新数组，使用 `sorted()`：

```swift
let sorted = nums.sorted()  // 返回新数组，原数组不变
```

### 常见问题和注意事项

1. **数组越界**：访问超出范围的索引会导致崩溃，务必检查索引有效性
2. **类型一致性**：数组只能存储同类型元素，混会导致编译错误
3. **可选类型数组**：如果需要存储可选值，声明为 `[String?]`
4. **性能考虑**：在数组头部插入/删除是 O(n) 操作，尾部是 O(1)

## 关键代码详解

### main.swift 完整代码

```swift
// swift-array-demo.swift

// 创建数组
var fruits = ["apple", "banana", "orange"]
let numbers = [1, 2, 3, 4, 5]

// 访问元素
print("第一个水果: \(fruits[0])")
print("数组长度: \(fruits.count)")

// 添加元素
fruits.append("grape")
print("添加后: \(fruits)")

// 插入元素
fruits.insert("mango", at: 1)
print("插入后: \(fruits)")

// 删除元素
fruits.remove(at: 2)
print("删除后: \(fruits)")

// 遍历数组
print("\n遍历数组:")
for fruit in fruits {
    print("  - \(fruit)")
}

// 使用索引遍历
print("\n带索引遍历:")
for (index, fruit) in fruits.enumerated() {
    print("  [\(index)] \(fruit)")
}

// 数组过滤
let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let evens = nums.filter { $0 % 2 == 0 }
print("偶数: \(evens)")

// 数组映射
let doubled = nums.map { $0 * 2 }
print("翻倍: \(doubled)")

// 数组排序
var mutableNums = [3, 1, 4, 1, 5, 9, 2, 6]
mutableNums.sort()
print("排序后: \(mutableNums)")
```

### 核心代码解析

1. **数组创建**：`var fruits = ["apple", "banana", "orange"]`
   - 使用方括号 `[]` 包裹元素
   - Swift 会自动推断元素类型为 `String`

2. **索引访问**：`fruits[0]`
   - 0 是第一个元素的索引
   - 使用 `??` 运算符提供默认值更安全

3. **enumerated()**：返回 (index, element) 元组的序列
   - 用于同时获取索引和值
   - 适合需要知道位置的场景

4. **filter { }**：闭包语法
   - `$0` 代表当前遍历的元素
   - 返回布尔值表示是否保留该元素

5. **map { }**：转换操作
   - 对每个元素执行变换
   - 返回变换后的新数组

6. **sort()**：原地排序
   - 直接修改原数组
   - 使用快速排序算法
