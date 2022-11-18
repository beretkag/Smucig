let startcapital = 0;

document.querySelector('#configBtn').addEventListener('click', ()=>{
    document.querySelector('#cancelBtn').classList.remove('d-none');
    document.querySelector('#capitalBtn').classList.remove('d-none');
    document.querySelector('#configBtn').classList.add('d-none');
    document.querySelector('#startcapital').disabled = false;
    startcapital = document.querySelector('#startcapital').value;
});

document.querySelector('#cancelBtn').addEventListener('click', ()=>{
    document.querySelector('#cancelBtn').classList.add('d-none');
    document.querySelector('#capitalBtn').classList.add('d-none');
    document.querySelector('#configBtn').classList.remove('d-none');
    document.querySelector('#startcapital').disabled = true;
    document.querySelector('#startcapital').value = startcapital;
});