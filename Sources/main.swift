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
