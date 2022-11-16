let email = "";
let _name = "";

document.querySelector('#emailBtn').addEventListener("click", ()=>{
    if (document.querySelector('#emailCancel').classList.contains('d-none')) {
        email = document.querySelector('#newmail').value;
        document.querySelector('#newmail').disabled = false;
        document.querySelector('#emailEditIkon').classList.add('d-none');
        document.querySelector('#emailCancel').classList.remove('d-none');
    }
    else{
        document.querySelector('#newmail').disabled = true;
        document.querySelector('#emailEditIkon').classList.remove('d-none');
        document.querySelector('#emailCancel').classList.add('d-none');
        document.querySelector('#newmail').value = email;
    }
})



document.querySelector('#nameBtn').addEventListener("click", ()=>{
    if (document.querySelector('#nameCancel').classList.contains('d-none')) {
        _name = document.querySelector('#newname').value;
        document.querySelector('#newname').disabled = false;
        document.querySelector('#nameEditIkon').classList.add('d-none');
        document.querySelector('#nameCancel').classList.remove('d-none');
    }
    else{
        document.querySelector('#newname').disabled = true;
        document.querySelector('#nameEditIkon').classList.remove('d-none');
        document.querySelector('#nameCancel').classList.add('d-none');
        document.querySelector('#newname').value = _name;
    }
})
