var url='https://test.api.meshedu.com/api/students/payments/charges/';

fetch(url, {
    method: 'POST',
    mode: 'cors',
    headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token b0184600abbb924f273f4d091f6945db8759bff3',
        'Access-Control-Allow-Credentials': true,
        'Access-Control-Allow-Origin': 'https://meshedu.com',
    },
    body: JSON.stringify({
        stripe_token: "tok_1CZHnvGbJT0IjfCEbTwdKGcP",
    })
})
    .then(function (a) {
        return a.json(); // call the json method on the response to get JSON
    })
    .then(function (json) {
        console.log(json)
    })
