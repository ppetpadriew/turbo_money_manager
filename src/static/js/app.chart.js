(function () {
    var expenseCtx = document.getElementById("expenseSummaryChart").getContext('2d');
    var expenseSummaryChart = new Chart(expenseCtx, {
        type: "doughnut",
        data: {
            labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(222, 12, 0, 1)',
                    'rgba(21, 140, 186, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(40, 182, 44, 1)',
                    'rgba(156, 39, 176, 1)',
                    'rgba(245, 122, 0, 1)'
                ]
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    });

    var incomeCtx = document.getElementById("incomeSummaryChart").getContext('2d');
    var expenseSummaryChart = new Chart(incomeCtx, {
        type: "doughnut",
        data: {
            labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(222, 12, 0, 1)',
                    'rgba(21, 140, 186, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(40, 182, 44, 1)',
                    'rgba(156, 39, 176, 1)',
                    'rgba(245, 122, 0, 1)'
                ]
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    });
})();


