function allLongestStrings(inputArray){
    var n = inputArray[0].length;
    re = [];
    for(let i of inputArray){
        if(n < i.length) n = i.length;
        else continue;
    }
    for(let i of inputArray){
        if (i.length==n) re.push(i);
    }
    return re;
}
console.log(allLongestStrings(["BINH", "HUNG", "PHUOC", "CAO", "KHANH"]))