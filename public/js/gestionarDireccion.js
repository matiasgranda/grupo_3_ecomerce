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
    if(inputCalle.value.length < 1 || inputAlturaCalle.length < 1 || inputPiso.length < 1 || inputDepto.length < 1|| inputCodigoPostal.length < 1 ) {
        errorMessage.textContent = "Los campos marcados con * son obligatorios"
        e.preventDefault();
    }
})