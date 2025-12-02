function init() {
    var fieldset = document.getElementsByTagName('input');
    for (var i = 0; i < fieldset.length; i++) {
        fieldset[i].addEventListener('click', toggle, false);
    }
}

function toggle() {
    var id = this.id;
    switch (id) {
        case "personToggle": {
            var persons = document.getElementsByClassName("person");
            for (var i = 0; i < persons.length; i++) {
                persons[i].classList.toggle("on")
            }
        };
        break;
        case "locationToggle": {
            var locations = document.getElementsByClassName("location");
            for (var i = 0; i < locations.length; i++) {
                locations[i].classList.toggle("on")
            }
        };
       
        break;
            case "unitToggle": {
            var units = document.getElementsByClassName("unit");
            for (var i = 0; i < units.length; i++) {
                units[i].classList.toggle("on")
            }
        }
        
        }
        
        }

window.onload = init;
