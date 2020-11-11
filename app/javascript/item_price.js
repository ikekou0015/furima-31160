window.addEventListener('load', () => {
  const ItemPrice = document.getElementById("item-price");
  ItemPrice.addEventListener("input", () => {
   const Value = ItemPrice.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(Value / 10)
     
     
  const  ProFit = document.getElementById("profit");
  ProFit.innerHTML = Value - (addTaxDom.innerHTML)
     
});
});
 