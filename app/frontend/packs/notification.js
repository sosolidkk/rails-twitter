let notificationList = document.getElementById("notifications-dropdown-list");
let notificationCount = document.getElementById("notifications-count");
let notificationDropdownBtn = document.getElementById("notifications-dropdown");

// Helper method
function on(eventType, selector, callback) {
    document.body.addEventListener(eventType, function (event) {
        if (event.target.matches(selector)) {
            callback.call(event.target);
        }
    });
}

const headers = {
    'X-CSRF-Token': document.getElementsByName('csrf-token')[0].getAttribute('content'),
    'X-Requested-With': 'XMLHttpRequest',
    'Content-Type': 'application/html',
    'Accept': 'application/html'
}

const handleNotificationRead = () => {
    const url = '/notifications/mark_as_read'

    fetch(url, {
        method: 'POST',
        headers: headers,
        credentials: 'same-origin'
    }).then((response) => {
        if (response.status == 200) {
            notificationCount.innerHTML = "";
            notificationList.innerHTML = "";
        }
    })
}

const notifications = () => {
    const url = '/notifications.json';

    fetch(url, {
        method: 'GET',
        headers: headers,
        credentials: 'same-origin'
    }).then((response) => {
        return response.json()
    }).then((data) => {
        notificationList.innerHTML = ""
        if (data.length > 0) {
            notificationCount.innerHTML = data.length

            data.forEach((notification) => {
                notificationList.innerHTML += `<li><a class='dropdown-item' href='${notification.url}'>${notification.actor} ${notification.action} ${notification.notifiable.type}</a></li>`
            });

            notificationList.innerHTML += '<li><hr class="dropdown-divider"></li>'
            notificationList.innerHTML += '<li><a class="dropdown-item" id="handle-notifications" href="#">Clear notifications</a></li>'
        }
    });
}

window.addEventListener("load", function () {
    notifications();
}, false);

on("click", "#handle-notifications", function () {
    handleNotificationRead()
});
