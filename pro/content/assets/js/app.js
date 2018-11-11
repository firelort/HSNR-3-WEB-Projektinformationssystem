var selected = [];

function createClickedRow(element) {
    var id = element.getAttribute("id");
    if (element.classList.contains("active-tr")) {
        element.classList.remove("active-tr");
        for (i = 0; i < selected.length; i++) {
            if (selected[i] === id) {
                selected.splice(i, 1);
            }
        }
    } else {
        element.classList.add("active-tr");
        selected.push(id);
    }
    toggleButtons();
}

function createClickedCard(element) {
    var id = element.getAttribute("id");
    if (element.classList.contains("card-active")) {
        element.classList.remove("card-active");
        for (i = 0; i < selected.length; i++) {
            if (selected[i] === id) {
                selected.splice(i, 1);
            }
        }
    } else {
        element.classList.add("card-active");
        selected.push(id);
    }
    toggleButtons();
}

function buttonView(type) {
    if (selected.length !== 1) {
        alert("Es kann nur genau ein Eintrag angesehen werden!");
    } else if(selected.length > 0) {
        window.location = type + "/?id=" + selected[0];
    }
}

function buttonEdit(type) {
    if (selected.length !== 1) {
        alert("Es kann nur genau ein Eintrag bearbeitet werden!");
    } else if(selected.length > 0) {
        window.location = "edit/" + type + "/?id=" + selected[0];
    }
}

function buttonDelete(type) {
    if (selected.length > 0  && confirm("Möchten Sie die ausgewählten Einträge wirklich löschen?") === true ) {
        var form = document.createElement("form");
                form.setAttribute("method", "post");
                form.setAttribute("action", "delete/" + type);
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "ids");
                hiddenField.setAttribute("value", selected);
                form.appendChild(hiddenField);
                document.body.appendChild(form);
                form.submit();
    }
}

function activeElements() {
    var active = document.getElementsByClassName("active-tr");
    for(i = 0; i < active.length; i++) {
        selected.push(active.getAttribute("name"));
    }
    toggleButtons();
}

function toggleButtons() {
    var element;
    if (selected.length === 0) {
        element = document.getElementById("view");
        if (element != null) {
            element.classList.remove("hidden");
        }
        element = document.getElementById("edit");
        if (element != null) {
            element.classList.remove("hidden");
        }
    } else if (selected.length === 1) {
        element = document.getElementById("view");
        if (element != null) {
            element.classList.remove("hidden");
        }
        element = document.getElementById("edit");
        if (element != null) {
            element.classList.remove("hidden");
        }
    } else {
        element = document.getElementById("view");
        if (element != null) {
            element.classList.add("hidden");
        }
        element = document.getElementById("edit");
        if (element != null) {
            element.classList.add("hidden");
        }
    }
}

window.onload = function () {
    activeElements();
};