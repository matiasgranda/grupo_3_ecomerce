
const buttonDatos = document.querySelector("#gestionarDatosPersonalesBtn");

var nombre = document.querySelector("#nombre");
var apellido = document.querySelector("#apellido")
var telefono = document.querySelector("#telefono")
var fechanac = document.querySelector("#fechanac")
var email = document.querySelector("#email")

buttonDatos.addEventListener("click", function() {

    var formData = {
        nombre: nombre.value,
        apellido: apellido.value,
        telefono: telefono.value,
        fechanac: fechanac.value,
        email: email.value,
    };
    console.log(formData)
    $.ajax({
        type: "put",
        url: 'http://localhost:3000/api/usuarios/modificardatos',
        data: formData,
        dataType: "json",
        encode: true,
    });
    console.log(formData)
    location.reload();

})