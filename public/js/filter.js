

function filterCategory(categoria) {
    const items = document.getElementsByClassName("product-box");
    for (let i = 0; i < items.length; i++) {
        items[i].style.display ='none';
    }
    const itemsAmostrar = document.getElementsByClassName(categoria);
    for (let i = 0; i < itemsAmostrar.length; i++) {
        itemsAmostrar[i].style.display ='flex';
    }
    if (categoria==="todos"){
        const items = document.getElementsByClassName("product-box");
        for (let i = 0; i < items.length; i++) {
            items[i].style.display ='flex';
        } 
    }

}