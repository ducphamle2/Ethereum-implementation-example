const HDWalletProvider = require('truffle-hdwallet-provider');

module.exports ={

    networks: {
        ropsten: {
            //provider: ,
            gasPrice: 25000000,
            network_id: 3
        },
        development: {
            host: "127.0.0.1",
            port: 8545,
            network_id: "*" //Match any network id
        }

    },


    solc: {
        optimizer: {
            enabled: true,
            runs: 200
        }
    }
};