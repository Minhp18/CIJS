const x = document.getElementById("box-hex")
const y = document.getElementById("text-hex")
const colorInput1 = document.getElementById("color1")
const hexCode1 = document.getElementById("hex1")
const colorInput2 = document.getElementById("color2")
const hexCode2 = document.getElementById("hex2")
const selec = document.getElementById("selection")
function randomInteger(max) {
    return Math.floor(Math.random()*(max + 1));
}
function randomRgbColor() {
    let r = randomInteger(255);
    let g = randomInteger(255);
    let b = randomInteger(255);
    return [r,g,b];
}
function randomHexColor() {
    let [r,g,b] =randomRgbColor();
 
    let hr = r.toString(16).padStart(2, '0');
    let hg = g.toString(16).padStart(2, '0');
    let hb = b.toString(16).padStart(2, '0');
 
    return "#" + hr + hg + hb;
}
function generateHex() {
    x.style.backgroundColor = randomHexColor()
    y.innerHTML = randomHexColor()
}
colorInput1.addEventListener("input", ()=>{
    let color = colorInput1.value
    hexCode1.innerHTML = ""+color
})
colorInput2.addEventListener("input", ()=>{
    let color = colorInput2.value
    hexCode2.innerHTML = ""+color
})
function changeBC() {
    let x = document.getElementById("percent1").value
    let y = document.getElementById("percent2").value
    if(x=="") x="50"
    if(y=="") y="50"
    document.getElementById("container").style.background = "linear-gradient(" + selec.value +", " +colorInput1.value + " "+x+"%, "+colorInput2.value + " "+y+"%)"
}