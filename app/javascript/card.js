const pathName = location.pathname
const payReg = /orders/;
if (pathName.match(payReg)){
function pay() {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById('button');
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#card-number');
  expiryElement.mount('#card-expiry');
  cvcElement.mount('#card-cvc');

  submit.addEventListener('click', (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if(response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById('charge-form');
        const tokenObj = `<input value=${token} type="hidden" name="token">`;
        renderDom.insertAdjacentHTML('beforeend', tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById('charge-form').submit();
    });
  });
};

window.addEventListener('load', pay);
};