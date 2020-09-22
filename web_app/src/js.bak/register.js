const submit = (event) => {
    event.preventDefault()
    const user = {}
    const form = event.target
    for (input of form) {
        if (input.id !== "") {
            user[input.id] = input.value
        }
    }
    fetch('http://192.168.186.200:5000/api/users', {
        method: 'POST',
        body: JSON.stringify(user)
    }).then(resp => resp.json()).then(user => console.log(user))

}
//     console.log(user)
// }

document.querySelector('#formulaire').addEventListener('signin-btn', submit)
