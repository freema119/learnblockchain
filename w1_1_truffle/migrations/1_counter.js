
// 1、导入Counter合约
const Counter = artifacts.require("Counter");
// 2、使用部署器部署合约，有点像面向对象编程里面的 类实例化
module.exports = function(deployer){
    deployer.deploy(Counter,1);
}
