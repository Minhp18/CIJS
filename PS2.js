function alternatingSums(a) {
    re = [0, 0]
    for (let i=0; i<a.length; i=i+1){
        if(i%2==0) re[0] = re[0] + a[i];
        else re[1] = re[1] + a[i];
    }
    return re;
}
console.log(alternatingSums([60, 40, 55, 75, 64]))