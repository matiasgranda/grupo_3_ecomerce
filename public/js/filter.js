

function filterCategory(categoria) {
    const items = document.getElementsByClassName("product-box");
    console.log(items)
    for (let i = 0; i < items.length; i++) {
        if(items[i].contains(categoria)) {
            items.classList.remove("hidden")
        } else {
            items.classList.add("hidden")
        }
    }

}