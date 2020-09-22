
// function generate_table {

// var array = [["Emile","MIKULI"],
//         ["Yves","B2",],
//         ["Arthur","B3"],


// for(var i = 0; i < array.length; i++)
//         {
//             // create a new row
//             var newRow = table.insertRow(table.length);
//             for(var j = 0; j < array[i].length; j++)
//             {
//                 // create a new cell
//                 var cell = newRow.insertCell(j);

//                 // add value to the cell
//                 cell.innerHTML = array[i][j];
//             }
//         }
// }

// function generate_table(){

//     var options = {
//         valueNames: [ 'name', 'born' ],
//         // Since there are no elements in the list, this will be used as template.
//         item: '<li><h3 class="name"></h3><p class="born"></p></li>'
//     };
      
//       var values = [
//         {
//           name: 'Emile Mikuli ',
//           born: 1987
//         },
//         {
//           name: 'Yves',
//           born: 1985
//         },
//     ];
      
//       var userList = new List('users', options, values);
      
//       userList.add({
//         name: 'Arthur',
//         born: 1983
//     });
// }

const users = [
    { lastname: 'Mikuli', firstname: 'Emile', birth: "12/10/1989", },
    { lastname: 'Henot', firstname: 'Yves', birth: "99/99/9999", },
    { lastname: 'Marsy', firstname: 'Arthur', birth: "99/99/9999", },
]

const searchUser = () => {
    const user = document.querySelector("#searchInput").value
    console.log('user : ', user)
}

const renderUsers = () => {
    const table = document.querySelector('#userTable')
    for (user of users) {
        const tr = table.insertRow()
        for (key in user) {
            let cell = tr.insertCell()
            cell.innerHTML = user[key]
        }
    }

}

document.querySelector("button.search-btn").addEventListener('click', searchUser)
renderUsers()


