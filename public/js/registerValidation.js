



    function validation(obj, min, max) {

        if (obj.value.length < min || obj.value.length > max) {
            obj.classList.add("error")
        }
        if (obj.value.length > min && obj.value.length < max) {
            obj.classList.remove("error")
        }
    }

    function validateEmail(inputText) {
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (inputText.value.match(mailformat)) {
            inputText.classList.remove("error");
        } else {
            inputText.classList.add("error")
        }
    }
