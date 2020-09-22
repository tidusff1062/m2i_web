const users = [
    { id: 1, login: 'Emile',},
    { id: 2, login: 'Yves', },
    { id: 3, login: 'Arthur', },
]

const deleteUser = event => {
    console.log(event.target.id)
}

const renderUsers = () => {
    const list = document.querySelector('#userList')
    for (user of users) {
        const li = document.createElement('li')
        const data = document.createTextNode(`Login : ${user.login}`)
        const button = document.createElement('button')
        const bre = document.createElement('p')
        button.setAttribute("id", user.id.toString())
        button.addEventListener('click', deleteUser)
        button.innerHTML = "Supprimer"
        li.appendChild(data)
        li.appendChild(button)
        li.appendChild(bre)
        list.appendChild(li)
    }
}

const getUsers = () => {
    const options= {
        method: 'GET',
        headers: {
            'Access-Control-Allow-Origin': '*'
        }
    }
    fetch('http://192.168.186.200:5000/api/todos/', options).then(resp => resp.json()).then(json => console.log(json))
}

renderUsers()

getUsers()
