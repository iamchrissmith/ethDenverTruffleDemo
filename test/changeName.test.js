const isEVMException = err => (
  err.toString().includes('revert')
)

const DenverToken = artifacts.require('./DenverToken.sol')

contract('DenverToken', function(accounts) {
  const owner = accounts[0]
  const notOwner = accounts[1]

  let contract = null

  beforeEach( async () => {
    contract = await DenverToken.new({from:owner})
  })

  describe('.changeName', () => {
    it('it should allow the owner to change the token name', async () => {
      const newName = 'New Name'
      await contract.changeName(newName, {from:owner})
      const currentName = await contract.name.call()
      assert.equal(currentName, newName, "name did not successfully change")
    })
    it('it should not allow other accounts to change the token name', async () => {
      const errMsg = "A non-owner was allowed to change the name"
      const newName = 'New Name'
      const originalName = await contract.name.call()
      
      try {
        await contract.changeName(newName, {from:notOwner})
      } catch(err) {
        assert(isEVMException(err), err.toString())

        const currentName = await contract.name.call()

        assert.equal(currentName, originalName, errMsg)
        return
      }

      assert(false, errMsg)
    })
  })
})