# Runtime

此demo主要用于Runtime演示

具体可以参考我的博客

[Runtime常见应用举例](http://www.jianshu.com/p/febfd06bebe8)



### 注意

1. ​

```
class_copyIvarList() 返回一个指向类成员变量数组的指针
class_copyPropertyList() 返回一个指向类的属性的数组指针
```

以上两个方法返回的指针，在使用完毕后必须free()

1. ​

```
ivar_getName() 获取成员变量-->C类型的字符串
property_getName() 获取属性名-->C类型的字符串
```



### 改动如下：

- v1.1增加了`class_copyIvarList()`产生指针的释放代码



### 版本说明

- v1.1改进部分功能
- v1.0 初始工程