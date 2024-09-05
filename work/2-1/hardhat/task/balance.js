task("balance", "Prints an account's balance")
  .addParam("account", "The account's address")
  .setAction(async (taskArgs) => {
    const balance = await ethers.provider.getBalance(taskArgs.account);

    // 注意这里ethers.js 6版本之上已经不需要utils了,不然报错
    // console.log(ethers.utils.formatEther(balance), "ETH"); 
    console.log(ethers.formatEther(balance), "ETH");

  });