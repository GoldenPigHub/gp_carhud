window.addEventListener('message', (event) => {
    if (event.data.action == "ui") {
        if (event.data.show) {
            $(".container").fadeIn();
        } else {
            $(".container").fadeOut();
        }
    } else if (event.data.action == 'tick') {
        $("#heal").css("width", event.data.heal+"%")
        $("#stamina").css("width", event.data.stamina+"%")
        $("#hunger").css("width", event.data.hunger+"%")
        $("#thirst").css("width", event.data.thirst+"%")

        $("#horsestamina").css("width", event.data.horsestamina+"%")
    } else if (event.data.action == 'horseui') {
        if (event.data.show) {
            $(".container-horse").fadeIn();
        } else {
            $(".container-horse").fadeOut();
        }
    }
});