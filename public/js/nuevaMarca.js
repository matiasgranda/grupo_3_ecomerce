
const marcaSelect = document.querySelector("#marca");
const marcaInput = document.querySelector(".marcaInputDiv");

marcaSelect.addEventListener("change", function() {
    if(this.value == "otra") {
        marcaInput.style.display = "flex";
        marcaInput.style.opacity = "1"
    } else {
        marcaInput.style.display = "none";
        marcaInput.style.opacity = "0"
    }
})