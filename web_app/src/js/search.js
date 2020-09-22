class SearchUser {
    constructor(nom, prenom, date_naissance) {
        this.nom = nom
        this.prenom = prenom
        this.date_naissance = data_naissance
    }
}

const renderUsers = (response) => {
    data = response.map(user => JSON.parse(user))
    users = data.map(user => new SearchUser(user.nom, user.prenom, user.date_naisance))
    const table = document.querySelector('#userTable')
    if (table.rows.length > 1) {
        for (let i = 1; i < table.rows.length; i++) {
            table.deleteRow(i)
        }
    }

    for (user of users) {
        const tr = table.insertRow()
        for (key in user) {
            let cell = tr.insertCell()
            cell.innerHTML = user[key]
        }
    }

}

const allUsers = async () => {
    response = await (await fetch('https://192.168.186.200:5000/api/users/')).json()
    renderUsers(response)
}

const searchUser = async () => {
    const user = document.querySelector("#searchInput").value
    if (user === "") {
        allUsers()
    }
    else {
        response = await (await fetch(`https://192.168.186.200:5000/api/users/${user}`)).json()
        renderUsers(response)
    }
}



document.querySelector("#search-btn").addEventListener('click', searchUser)
searchUser()
