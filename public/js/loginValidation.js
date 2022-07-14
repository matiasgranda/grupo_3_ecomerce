

function validation(obj, min, max) {
    if (obj.value.length < min || obj.value.length > max) {
        obj.classList.add("inputError")
        let label = obj.previousElementSibling
        label.textContent = obj.dataset.mensaje + " debe tener entre " + min + "-" + max + " caracteres"
    }
    if (obj.value.length >= min && obj.value.length <= max) {
        obj.classList.remove("inputError")
        let label = obj.previousElementSibling
        label.textContent = obj.dataset.mensaje
    }
}