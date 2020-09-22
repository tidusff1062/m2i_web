const send = (event) => {
    event.preventDefault()
    for (let i = 0; i < 6; i++) {
        console.log(event.target[i].value)
    }
}

document.querySelector('#formulaire').addEventListener('submit', send)

