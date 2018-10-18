function f (a, b){
    console.log('f');
    var nom = document.getElementById("nom");
    var save = document.getElementById("save");
    var idupdate = document.getElementById("idupdate");
    save.value = "Modifier";
    nom.value = b;
    idupdate.value = a;
}


//var s = function (){
//    console.log('f');
//    var u = document.getElementById("update");
//    u.addEventListener('click', f);
//}
//
//window.addEventListener('load', s);



