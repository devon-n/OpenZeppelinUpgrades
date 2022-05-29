import hre from "hardhat"
import assert from "assert"

describe("Testing ERC20", function () {
  before("Deploy", async function () {
    this.Mars = await hre.ethers.getContractFactory("Mars")
    this.MarsV2 = await hre.ethers.getContractFactory("MarsV2")
    this.MarsV3 = await hre.ethers.getContractFactory("MarsV3")
  })

  it('Deploys the right contract', async function () {
    // const mars = await hre.upgrades.deployProxy(this.Mars) // Transparent Proxy
    const mars = await hre.upgrades.deployProxy(this.Mars, { kind: 'uups' }) // UUPS Proxy
    assert(await mars.name() == "Mars")

    const marsv2 = await hre.upgrades.upgradeProxy(mars, this.MarsV2)
    assert(await marsv2.version() == "v2")
    
    const marsv3 = await hre.upgrades.upgradeProxy(mars, this.MarsV3)
    assert(await marsv3.version() == "v2")
  })
})


