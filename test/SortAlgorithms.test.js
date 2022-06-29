const { expect } = require("chai");
const { BigNumber } = require("ethers");
const { ethers } = require("hardhat");

describe("SortAlgorithms", function() {
    const amountTests = 2;
    const min = 0;
    const max = 100;
    const sizeArray = 20;
    let sortAlg;
    let count = 0;
    let acc1;
    let sort;
    let values = "";
    
    let expectedResult;
    let input;

    beforeEach(async function() {
        if(count % 5 == 0)
            sortAlg = "Bubble";
        else if(count % 5 == 1)
            sortAlg = "InsertionSort";
        else if(count % 5 == 2)
            sortAlg = "SelectionSort";
        else if(count % 5 == 3)
            sortAlg = "MergeSort";
        else
            sortAlg = "QuickSort";

        if(Math.floor(count / 5) != Math.floor((count-1)/5)){
            expectedResult = generateRandomArray();
            input = Array.from(expectedResult);
            expectedResult.sort((a, b) => a - b);
            values = input.toString() + " => " + expectedResult.toString();
        }

        console.log("Algorithm sort - ", sortAlg);
        acc1 = await ethers.getSigners();
        const Sort = await ethers.getContractFactory(sortAlg, acc1);
        sort = await Sort.deploy();
        await sort.deployed();
        count++;
    })

    for(let i = 0; i != 5 * amountTests; i++){
        it("Algorithm validation", 
        async function(){
            console.log(input.toString() + " => " + expectedResult.toString())
            const result = await sort.sort(input);
            for(let i = 0; i < expectedResult.length; i++){
                expect(result[i]).to.eq(expectedResult[i]);
            }
        })
    }

    function generateRandomArray(){
        let result = [];
        while(result.length < sizeArray)
            result.push(generateRandom());
        return result;
    }

    function generateRandom() {
        let difference = max - min;
        let rand = Math.random();
        rand = Math.floor( rand * difference);
        rand = rand + min;
        return rand;
    }
})