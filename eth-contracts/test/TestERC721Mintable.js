var ERC721MintableComplete = artifacts.require('HomeERC721Token');

contract('TestERC721Mintable', accounts => {

    const account_one = accounts[0];
    const account_two = accounts[1];
    const account_three = accounts[2];

    describe('match erc721 spec', function () {
        beforeEach(async function () { 
            this.contract = await ERC721MintableComplete.new({from: account_one});

            // mint multiple tokens
            await this.contract.mint(account_two, 200);
            await this.contract.mint(account_two, 201);
            await this.contract.mint(account_two, 202);
            await this.contract.mint(account_two, 203);
            await this.contract.mint(account_two, 204);
            await this.contract.mint(account_two, 205);           
            await this.contract.mint(account_three, 300);
            await this.contract.mint(account_three, 301);
            await this.contract.mint(account_three, 302);   
            await this.contract.mint(account_three, 303);   
        })

        it('should return total supply', async function () { 
            let supply = await this.contract.totalSupply();
            assert.equal(supply, 10, "Incorrect total suppy");
        })


        it('should get token balance', async function () { 
            let balance = await this.contract.balanceOf(account_two)

            assert.equal(balance, 6, 'Incorrect Balance')
        })

        // token uri should be complete i.e: https://s3-us-west-2.amazonaws.com/udacity-blockchain/capstone/1
        it('should return token uri', async function () { 
            let tokenURI = await this.contract.tokenURI(201);
            assert.equal(tokenURI, 'https://s3-us-west-2.amazonaws.com/udacity-blockchain/capstone/201', 'Incorrect tokenURI')
        })

        it('should transfer token from one owner to another', async function () { 
            await this.contract.transferFrom(account_two, account_three, 204, {from:account_two});
            let newOwner = await this.contract.ownerOf(204);

            assert.equal(newOwner, account_three, 'Incorrect new owner');
        })
    });

    describe('have ownership properties', function () {
        beforeEach(async function () { 
            this.contract = await ERC721MintableComplete.new({from: account_one});
        })

        it('should fail when minting when address is not contract owner', async function () {
            await expectThrow(this.contract.mint(account_two, 200, { from: account_two }))
        })
  

        it('should return contract owner', async function () { 
            let contractOwner = await this.contract.getOwner();
            assert.equal(contractOwner, account_one, 'Incorrect contract owner');
        })

    });  
})

var expectThrow = async function(promise) { 
    try { 
        await promise
    } catch (error) { 
        assert.exists(error)
        return
    }

    assert.fail('Expected an error but didnt see one!')
}