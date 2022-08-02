let button = document.querySelector(".gestionarDireccionBtn");
let closeButton = document.querySelector(".closeBtn");
let form = document.querySelector(".gestionarDireccionForm");

let submitButton = document.querySelector(".confirmSubmitButton")
let inputPais = document.querySelector(".direccionPais")
let inputProvincia = document.querySelector(".direccionProvincia")
let inputCalle = document.querySelector(".direccionCalle")
let inputAlturaCalle = document.querySelector(".direccionAltura")
let inputPiso = document.querySelector(".direccionPiso")
let inputDepto = document.querySelector(".direccionDepto")
let inputCodigoPostal = document.querySelector(".direccionCp")

let errorMessage = document.querySelector(".errorMessage")

button.addEventListener("click", function() {
    form.style.display = "flex"
})

closeButton.addEventListener("click", function() {
    form.style.display = "none"
})

submitButton.addEventListener("click", function(e) {
    e.preventDefault();
    if(inputCalle.value == "" || inputAlturaCalle == "" || inputPiso == "" || inputDepto == "" || inputCodigoPostal == "") {
        errorMessage.textContent = "Los campos marcados con * son obligatorios"
    } else {
        form.submit();
    }
})