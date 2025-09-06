### 原型链继承

### 构造函数继承

### 组合继承

```js
function SuperType() {
  this.name = "Parent";
  this.arr = [1, 2, 3];
}

SuperType.prototype.say = function () {
  console.log("this is parent");
};

function SubType() {
  SuperType.call(this); // 2
}

SubType.prototype = new SuperType(); // 1
```

### 原型式继承

```js
function object(o) {
  function F() {}
  F.prototype = o;
  return new F();
}

const person = {
  name: "cxk",
  friends: [1, 2, 3],
};

const otherPerson = object(person);
otherPerson.name = "cxk2";
otherPerson.friends.push("Robot");

```

### 寄生式继承

```js
function createAnthor(original) {
  const clone = Object.create(original);
  clone.sayHi = function () {
    console.log("hi");
  };
  return clone;
}

const person = {
  name: "cxk",
  friends: [1, 2, 3],
};

const anthorPerson = createAnthor(person);
anthorPerson.sayHi();

```

### 寄生组合继承

```js
function inheritPrototype(subType, superType) {
  let prototype = Object.create(superType.prototype); // 创建了父类原型的浅复制
  prototype.constructor = subType; // 修正原型的构造函数
  subType.prototype = prototype; // 将子类的原型替换为这个原型
}

function SuperType(name) {
  this.name = name;
  this.colors = ["red", "blue", "green"];
}

SuperType.prototype.sayName = function () {
  alert(this.name);
};

function SubType(name, age) {
  SuperType.call(this, name);
  this.age = age;
}
// 核心：因为是对父类原型的复制，所以不包含父类的构造函数，也就不会调用两次父类的构造函数造成浪费
inheritPrototype(SubType, SuperType);
SubType.prototype.sayAge = function () {
  alert(this.age);
};
```
