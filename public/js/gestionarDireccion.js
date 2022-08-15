//const { setdefault } = require("../../src/controllers/apiDomicilioController");

var button = document.querySelector(".gestionarDireccionBtn");

var closeButton = document.querySelector(".closeBtn");

var form = document.querySelector("#formDatos");

var inputAlias = document.querySelector(".direccionAlias");
var submitButton = document.querySelector(".confirmSubmitButton")
var inputPais = document.querySelector(".direccionPais")
var inputProvincia = document.querySelector(".direccionProvincia")
var inputCalle = document.querySelector(".direccionCalle")
var inputAlturaCalle = document.querySelector(".direccionAltura")
var inputPiso = document.querySelector(".direccionPiso")
var inputDepto = document.querySelector(".direccionDepto")
var inputCodigoPostal = document.querySelector(".direccionCp")
var codigoDomicilio = document.querySelector(".codigoDomicilio");
var checkboxSetDefault = document.querySelector(".checkboxSetDefault");

var errorMessage = document.querySelector(".errorMessage")

button.addEventListener("click", function () {
    form.style.display = "flex"
})

closeButton.addEventListener("click", function () {
    form.style.display = "none"
})

submitButton.addEventListener("click", function (e) {
    if (inputCalle.value.length < 1 || inputAlturaCalle.length < 1 || inputPiso.length < 1 || inputDepto.length < 1 || inputCodigoPostal.length < 1) {
        errorMessage.textContent = "Los campos marcados con * son obligatorios"
        e.preventDefault();
    }
})

async function getDomicilio(id) {

    form.style.display = "flex"
    const res = await fetch("http://localhost:3000/api/usuarios/domicilio/" + id);
    const data = await res.json()
    console.log(data)

    if (data.entregadefault === 1) {
        checkboxSetDefault.checked = true
    } else {
        checkboxSetDefault.checked = false
    }

    codigoDomicilio.value = data.iddomicilios
    inputAlias.value = data.alias
    inputPais.value = data.idpais
    inputProvincia.value = data.idprovincia
    inputCalle.value = data.calle
    inputAlturaCalle.value = data.altura
    inputPiso.value = data.piso
    inputDepto.value = data.depto
    inputCodigoPostal.value = data.cp

}

async function modificarDireccion() {
    console.log(checkboxSetDefault.value)

    var formData = {
        codigoDomicilio: codigoDomicilio.value,
        inputAlias: inputAlias.value,
        inputProvincia: inputProvincia.value,
        inputPais: inputPais.value,
        inputCalle: inputCalle.value,
        inputAlturaCalle: inputAlturaCalle.value,
        inputPiso: inputPiso.value,
        inputDepto: inputDepto.value,
        inputCodigoPostal: inputCodigoPostal.value,
        checkboxSetDefault: checkboxSetDefault.value
    };
    if(codigoDomicilio.value !== "") {
       
        $.ajax({
            type: "put",
            url: 'http://localhost:3000/api/usuarios/domicilio/',
            data: formData,
            dataType: "json",
            encode: true,
    
        });
    
        if (checkboxSetDefault.value === "on") {
            let id=parseInt( codigoDomicilio.value)
            var formDataDefault = {
                codigoDomicilio: codigoDomicilio.value,
               
            };
            $.ajax({
                type: "put",
                url: "http://localhost:3000/api/usuarios/domicilio/" + id + "/setdefault",
                data: formDataDefault,
                dataType: "json",
                encode: true,
        
            });

        }
    } else {
        $.ajax({
            type: "post",
            url: 'http://localhost:3000/api/usuarios/domicilio/',
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data, status, xhr) {// success callback function
            }
        })
    
        setTimeout(() => {
            location.reload();
        }, 1000)

}
}



