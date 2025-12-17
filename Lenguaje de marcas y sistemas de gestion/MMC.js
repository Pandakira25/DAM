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
        document.write('<p>'+numB + ' es mayor que ' + numA + '</p>');
    }
}

let n;
let text;

function pedNyTyM(){
    n = eval(prompt('Ingrese el tamaño de la cabecera'));
    text = prompt('Ingrese el texto de cabecera');

    document.write('<h' + n + '>' + text + '</h' + n);
}
