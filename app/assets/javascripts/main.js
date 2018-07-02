window.onload=function(){
const f = SecureForm.create('Rails-4.1', function(state) {
    document.getElementById('').innerText = JSON.stringify(state, null, '  ');
  });

const field = f.field('#cc-name .fake-input', {
    type: 'text',
    name: 'cc-name',
    color: '#000000',
    placeholder: 'John Smith',
    validations: ['required'],
});

f.field('#guest #guest-name', {
    type: 'text',
    name: 'guest-name',
    value: document.getElementById('guest-name').innerText,
});

f.field('#guest-email-address #guest-email_address', {
    type: 'text',
    name: 'guest-email_address',
    value: document.getElementById('guest-email_address').innerText,
});

f.field('#cc-exp-month .fake-input', {
    type: 'card-expiration-month',
    name: 'guest-expiration_month',
});

f.field('#cc-exp-year .fake-input', {
    type: 'card-expiration-year',
    name: 'guest-expiration_year',
});

f.field('#cc-number .fake-input', {
    type: 'card-number',
    name: 'guest-number',
    successColor: 'green',
    errorColor: 'red',
    placeholder: '4111 1111 1111 1111',
    validations: ['required', 'validCardNumber'],
});

f.field('#cc-cvc .fake-input', {
    type: 'card-security-code',
    name: 'guest-cvv',
    placeholder: '344',
    validations: ['required', 'validCardSecurityCode'],
});

f.field('#listing #listing_id', {
    type: 'number',
    name: 'listing_id',
    value: document.getElementById('listing_id').innerText,
});

document.querySelectorAll('label')
    .forEach(function(el) {
        el.addEventListener('click', function(t) {
        field.focus();
        });
    });

document.getElementById('cc-form')
    .addEventListener('submit', function(e) {
        e.preventDefault();
        f.submit('/rentals', {
        headers: {
            'x-custom-header': 'Used SecureForm, you have',
        },
        data: {
            type: 'card',
        },
        }, function(status, data) {
        document.getElementById('').innerText = JSON.stringify(data, null, '  ');
        });
    }, false);
}
