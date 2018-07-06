
window.onload=function(){
    const f = SecureForm.create('Rails-4.1', function(state) {
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
    defaultValue: document.getElementById('guest-name').value,
});

f.field('#guest-email-address #guest-email_address', {
    type: 'text',
    name: 'guest-email_address',
    defaultValue: document.getElementById('guest-email_address').value,
});

f.field('#cc-exp-month .fake-input', {
    type: 'text',
    name: 'guest-expiration_month',
});

f.field('#cc-exp-year .fake-input', {
    type: 'text',
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
    type: 'text',
    name: 'listing_id',
    defaultValue: document.getElementById("listing_id").value,
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
          headers: {},
          data: {}
      }, function(status, data) {
          window.location.href = '/rentals';
      });
  }, false);

};
