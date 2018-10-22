function f(a, b) {
    var nom = document.getElementById("nom");
    var save = document.getElementById("save");
    var idupdate = document.getElementById("idupdate");
    save.innerHTML = "Modifier";
    nom.value = b;
    idupdate.value = a;
}

function f2(a, b, c, d, e, f, g) {
    var nom = document.getElementById("nom");
    var prenom = document.getElementById("prenom");
    var date = document.getElementById("dateNaissance");
    var service = document.getElementById("service");
    var dateD = document.getElementById("dateDebut");
    var dateF = document.getElementById("dateFin");

    var hidden_date = document.getElementById("hiddenDate");
    var save = document.getElementById("save");
    var idupdate = document.getElementById("idupdate");
    save.innerHTML = "Modifier";
    nom.value = b;
    prenom.value = c;
    date.value = d.replace(/(\d\d)\/(\d\d)\/(\d{4})/, "$3-$1-$2");

    for (var i = 0; i < service.options.length; i++) {
        if (service.options[i].text == e) {
            service.options.selectedIndex = i;
        }
    }
    dateD.value = f.replace(/(\d\d)\/(\d\d)\/(\d{4})/, "$3-$1-$2");

    if (f != "-----") {
        dateF.value = g.replace(/(\d\d)\/(\d\d)\/(\d{4})/, "$3-$1-$2");
    }

    idupdate.value = a;

    if (hidden_date.hidden && save.innerHTML == "Modifier") {
        hidden_date.hidden = false;
    }

}





