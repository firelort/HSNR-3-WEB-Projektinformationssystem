function buttonView(type, id) {
    switch (type) {
        case "customer":
            window.location = "customer/?id=" + id;
            break;
        case "employee":
            window.location = "employee/?id=" + id;
            break;
        case "project":
            window.location = "project/?id=" + id;
            break;
        default:
            alert("Es fand eine HTML-Manipluation statt.");
    }
};

function buttonEdit(type, id) {
    switch (type) {
        case "customer":
            window.location = "edit/customer/?id=" + id;
            break;
        case "employee":
            window.location = "edit/employee/?id=" + id;
            break;
        case "project":
            window.location = "edit/project/?id=" + id;
            break;
        default:
            alert("Es fand eine HTML-Manipluation statt.");
    }
};

function buttonDelete(type, id) {
    switch (type) {
        case "customer":
            if (confirm("Möchten Sie den Kunden wirklich löschen?") == true) {
                var form = document.createElement("form");
                form.setAttribute("method", "post");
                form.setAttribute("action", "delete/customer");
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "id");
                hiddenField.setAttribute("value", id);
                form.appendChild(hiddenField);
                document.body.appendChild(form);
                form.submit();
            }
            break;
        case "employee":
            if (confirm("Möchten Sie den Mitarbeiter wirklich löschen?") == true) {
                var form = document.createElement("form");
                form.setAttribute("method", "post");
                form.setAttribute("action", "delete/employee");
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "id");
                hiddenField.setAttribute("value", id);
                form.appendChild(hiddenField);
                document.body.appendChild(form);
                form.submit()
            }
            break;
        case "project":
            if (confirm("Möchten Sie das Projekt wirklich löschen?") == true) {
                var form = document.createElement("form");
                form.setAttribute("method", "post");
                form.setAttribute("action", "delete/project");
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "id");
                hiddenField.setAttribute("value", id);
                form.appendChild(hiddenField);
                document.body.appendChild(form);
                form.submit()
            }
            break;
        default:
            alert("Es fand eine HTML-Manipluation statt.");
    }
}