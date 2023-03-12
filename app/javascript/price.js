const url = location.href;
if(url.includes('/items/new')){
  function price() {
    const priceForm = document.getElementById('item-price');
    priceForm.addEventListener('keyup', () => {
        const taxElement = document.getElementById('add-tax-price');
        const profitElement = document.getElementById('profit');
        const price = Math.floor(priceForm.value);
        const tax = Math.floor(price * 0.1);
        const profit = price - tax;
        taxElement.innerHTML = tax;
        profitElement.innerHTML = profit;
    });
  };

  window.addEventListener('load', price);
};