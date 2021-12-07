document.getElementById("myText").style.fontSize="50px";


console.log(document.getElementById("myInput").nodeType)


document.getElementById("myText").classList.add("title")

let  a=document.getElementsByClassName("myStatment")[0];

console.log(a.classList)
a.classList.toggle("mystyle");

 a.style.backgroundColor="red";
 



 document.getElementById("task1").style.backgroundColor="red";



let table =document.createElement("table");
let tr =document.createElement("tr");
let td=document.createElement("td");
let td2=document.createElement("td");

let text=document.createTextNode("table one");
let text2=document.createTextNode("table two");

td2.appendChild(text2);
td.appendChild(text);


tr.appendChild(td);
tr.appendChild(td2);

table.appendChild(tr);


console.log(table)



let arr= [1,2,3,4];

arr.shift();


let arrs =['a','b','c','e'];

delete arrs [0];
console.log(arrs)

var w = window.screen.width

var h = window.screen.height


console.log(w);
console.log(h);


function volume_sphere()
 {
  var volume;
  var radius = document.getElementById('radius').value;
  radius = Math.abs(radius);
  volume = (4/3) * Math.PI * Math.pow(radius, 3);
  volume = volume.toFixed(4);
  document.getElementById('volume').value = volume;
  return false;
 } 
window.onload = document.getElementById('Form').onsubmit = volume_sphere;
