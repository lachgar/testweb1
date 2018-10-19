function f (a, b){
    console.log('f');
    var nom = document.getElementById("nom");
    var save = document.getElementById("save");
    var idupdate = document.getElementById("idupdate");
    save.value = "Modifier";
    nom.value = b;
    idupdate.value = a;
}

function f2 (a, b, c, d){
    console.log('f');
    var nom = document.getElementById("nom");
    var prenom = document.getElementById("prenom");
    var date = document.getElementById("dateNaissance");
    
    var save = document.getElementById("save");
    var idupdate = document.getElementById("idupdate");
    save.value = "Modifier";
    nom.value = b;
    prenom.value = c;
    date.value = d;
    
    idupdate.value = a;
}

//var s = function (){
//    console.log('f');
//    var u = document.getElementById("update");
//    u.addEventListener('click', f);
//}
//
//window.addEventListener('load', s);



