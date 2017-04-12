// js

const x = 1;



// list the properties of a JavaScript object
var myObject = 'foo';
var keys = Object.keys(myObject);


// determine the class of an object
Object.prototype.toString.call(myObject);


// JavaScript has function scope;
// functions get their own scope but other blocks do not.
if (true){
    var i = 5;
}
i;
// not undefined as you'd expect in a block-scoped language


// closures
// the inner function has access to all the outer function's variables, even after the outer function exits
