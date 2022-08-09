const link = document.querySelectorAll(".idCompra");
const container = document.querySelector(".divDetallesVenta");
const closeBtn = document.querySelector(".cerrarDetalleVenta");
const detalleVentaTitulo = document.querySelector(".detalleVentaTitulo");
const detalleVentaCantidad = document.querySelector(".detalleVentaCantidad");
const detalleVentaPrecio = document.querySelector(".detalleVentaPrecio");



closeBtn.addEventListener("click", function() {
    container.style.display = "none"
})

link.forEach(link => {
    link.addEventListener("click", async function() {
        
        try {
            const res = await fetch("http://localhost:3000/perfil/api/"+this.id);
            const data = await res.json()
            console.log(data)
            var result = data
        } catch (error) {
            console.log(error)
        }

        container.style.display = "flex"

        detalleVentaTitulo.textContent = ""
        detalleVentaCantidad.textContent = ""
        detalleVentaPrecio.textContent = ""

        detalleVentaTitulo.textContent = result.producto
        detalleVentaCantidad.textContent = result.cantidad
        detalleVentaPrecio.textContent = result.precio
    })
})

