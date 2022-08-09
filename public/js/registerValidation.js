

    let inputName = document.querySelector("#nombre");

    function validation(obj, min, max) {
        if (obj.value.length <= min || obj.value.length >= max) {
            obj.classList.add("error")
            let label = obj.previousElementSibling
            label.textContent = obj.dataset.mensaje + " debe tener entre " + min + "-" + max + " caracteres"
        }
        if (obj.value.length >= min && obj.value.length <= max) {
            obj.classList.remove("error")
            let label = obj.previousElementSibling
            label.textContent = obj.dataset.mensaje
        }
    }

    function validateEmail(inputText) {
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (inputText.value.match(mailformat)) {
            inputText.classList.remove("error");
            let label = inputText.previousElementSibling
            label.textContent = inputText.dataset.mensaje
        } else {
            inputText.classList.add("error")
            let label = inputText.previousElementSibling
            label.textContent = "La direccion de Email no es valida"
        }
    }


    let password = document.querySelector("#password");
    let passwordConfirm = document.querySelector("#confPassword");

    passwordConfirm.addEventListener("change", function() {
        if (passwordConfirm.value != password.value) {
            let label = passwordConfirm.previousElementSibling
            label.textContent = "Las contraseñas no coinciden."
            password.classList.add("error")
            passwordConfirm.classList.add("error")
        } else {
            let label = passwordConfirm.previousElementSibling
            passwordConfirm.classList.remove("error");
            password.classList.remove("error")
            label.textContent = "Confirme su contraseña"
        }
    })

