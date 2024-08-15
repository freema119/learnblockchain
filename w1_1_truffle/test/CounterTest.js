// 特别注意这里当时踩了一个坑，测试代码编译之后一直报错看代码又没发现什么；
// 后面问题原因是合约代码有修改，所以我们在运行truffle test之前先编译代码 truffle compile

// 引入合约
const Counter = artifacts.require("Counter");
// 构建测试用例
contract("Counter",function(accounts){//使用contract 定义测试用例方法块
    var counterInstance;
    it("Counter",function(){//it方法编写具体的测试用例
        // 获取部署实例
        return Counter.deployed()
        .then(function(instance){
            // 实例赋值
            counterInstance = instance;
            const i = 1;
            // 调用add方法并返回，这个时候没有返回值，所以下面function没有写参数
            return counterInstance.add(i);
        }).then(function(){
            // 调用状态变量的属性方法并返回
            return counterInstance.count();
        }).then(function(count){
            // 断言判断
            assert.equal(count,2);
        });
    });
});