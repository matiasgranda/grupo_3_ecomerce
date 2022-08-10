const link = document.querySelectorAll(".idCompra");
const container = document.querySelector(".divDetallesVenta");
const closeBtn = document.querySelector(".cerrarDetalleVenta");
const wrapper = document.querySelector(".wrapper");

wrapper.addEventListener("click", function() {
    container.style.display = "none";
    wrapper.style.display = "none";
})

closeBtn.addEventListener("click", function() {
    container.style.display = "none";
    wrapper.style.display = "none";
})

link.forEach(link => {
    link.addEventListener("click", async function() {
        
        wrapper.style.display = "flex"
        container.style.display = "flex"
        try {
            const res = await fetch("http://localhost:3000/perfil/api/"+this.id);
            const data = await res.json()
            console.log(data)

            data.forEach(compra => {
                const producto = document.createElement("p")
                const cantidad = document.createElement("p")
                const precio = document.createElement("p")
                const subContainer = document.createElement("div")
                subContainer.classList.add("subContainer")
                producto.classList.add("itemContainerDetalle")
                producto.style.fontWeight = 600
                cantidad.classList.add("itemContainerDetalle")
                precio.classList.add("itemContainerDetalle")
                producto.textContent = compra.producto
                cantidad.textContent = "Cantidad: "+compra.cantidad
                precio.textContent = "Precio unitario: "+compra.precio
                
                container.appendChild(subContainer)
                subContainer.appendChild(producto)
                subContainer.appendChild(cantidad)
                subContainer.appendChild(precio)
            })

        } catch (error) {
            console.log(error)
        }

        
        

    })
})

