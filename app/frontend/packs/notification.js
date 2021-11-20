let notificationList = document.getElementById("notifications-dropdown-list");
let notificationCount = document.getElementById("notifications-count");
let notificationDropdownBtn = document.getElementById("notifications-dropdown");

const notifications = () => {
    let url = '/notifications.json';

    fetch(url, {
        method: 'GET',
        headers: {
            'X-CSRF-Token': document.getElementsByName('csrf-token')[0].getAttribute('content'),
            'X-Requested-With': 'XMLHttpRequest',
            'Content-Type': 'application/html',
            'Accept': 'application/html'
        },
        credentials: 'same-origin'
    }).then((response) => {
        return response.json()
    }).then((data) => {
        notificationList.innerHTML = ""
        if (data.length > 0) { notificationCount.innerHTML = data.length }

        data.forEach((notification) => {
            notificationList.innerHTML += `<a class='dropdown-item' href='${notification.url}'>${notification.actor} ${notification.action} ${notification.notifiable.type}</a>`
        });
    });
}

const handleNotificationRead = () => {
    let url = '/notifications/mark_as_read'

    fetch(url, {
        method: 'POST',
        headers: {
            'X-CSRF-Token': document.getElementsByName('csrf-token')[0].getAttribute('content'),
            'X-Requested-With': 'XMLHttpRequest',
            'Content-Type': 'application/html',
            'Accept': 'application/html'
        },
        credentials: 'same-origin'
    }).then((response) => {
        if (response.status == 200) { notificationCount.innerHTML = "" }
    })
}

window.addEventListener("load", function () {
    notifications();
}, false);