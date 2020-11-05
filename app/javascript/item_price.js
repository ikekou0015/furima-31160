window.addEventListener('load', () => {
  const ItemPrice = document.getElementById("item-price")
  ItemPrice.addEventListener("input", () => {
   const Value = ItemPrice.value;
    console.log(Value)
  
  const addTaxDom = document.getElementById("add-tax-price")
  addTaxDom.innerHTML = Math.floor(Value / 10)
     console.log(addTaxDom.innerHTML)
     
  const  ProFit = document.getElementById("profit")
  ProFit.innerHTML = Value - (addTaxDom.innerHTML)
     console.log(ProFit.innerHTML)
})
})
 