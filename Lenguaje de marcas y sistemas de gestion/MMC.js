let numA;
let numB;

function pedirNs(){
    numA = eval(prompt('Ingrese el número A'));
    numB = eval(prompt('Ingrese el número B'));
}

function nAnB(){
    return numA * numB;
}

function nAmayB(){
    if(numA > numB){
        document.write('<p>'+numA + ' es mayor que ' + numB + '</p>');
    }else{
        document.write('<p>'+numB + ' es mayor que ' + numB + '</p>');
    }
}
