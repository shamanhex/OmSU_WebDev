<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApp01.index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ОмГУ. Пример веб-приложения</title>
    <link rel="stylesheet" href="./main.css" />
    <script src="./Chart.min.js"></script>
    <script src="./jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        timeUpdate = function () {
            var timestamp = document.getElementById('time'),
                t = new Date();
            hours = t.getHours();
            min = t.getMinutes() + '';

            if (min.length == 1) min = '0' + min;

            timestamp.innerHTML = t.getDate() + '.' + t.getMonth() + '.' + t.getFullYear() + '<br />' + hours + ':' + min;
        };

        initChart = function () {
            var MONTHS = ['00:00', '01:00', '02:00', '03:00', '04:00', '05:00', '06:00', '07:00', '08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00'];
            var config = {
                type: 'line',
                data: {
                    labels: ['00:00', '01:00', '02:00', '03:00', '04:00', '05:00', '06:00', '07:00', '08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00'],
                    datasets: [{
                        label: 'CPU (%)',
                        backgroundColor: 'rgb(54, 162, 235)',
                        borderColor: 'rgb(54, 162, 235)',
                        data: [],
                        fill: false,
                    }]
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Загрузка CPU'
                    },
                    tooltips: {
                        mode: 'index',
                        intersect: false,
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        xAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Время'
                            }
                        }],
                        yAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: '%'
                            }
                        }]
                    }
                }
            };
            config.data.datasets[0].data = [];
            window.myConfig = config;

            var ctx = document.getElementById('cpu_chart').getContext('2d');
            window.myLine = new Chart(ctx, config);
            updateChart();
        }

        updateChart = function () {
            $.get("./api/MonitoringData.ashx?varname=CPU", function (monData) {
                window.myLine.data.datasets[0].data = monData;
                window.myLine.update();
            }, "json");
        }

        window.onload = function () {
            timeUpdate();

            initChart();            
        };

        setInterval(timeUpdate, 10000);
        setInterval(updateChart, 10000);
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="inline" style="width:75%;">
                <h1>Мониторинг производительности</h1>
            </div>
            <div id="time" class="inline" style="text-align:right; width:20%; text-align:right">
            </div>
        </div>
        <div class="wrapper clearfix">
            <div class="leftmenu">
                <form id="form1" runat="server">
                    <div style="text-align:right;">
                        <div>Форма отправки данных:</div>
                        <br />
                        <select id="ValueType" name="ValueType" class="form_input">
                            <option value="1" selected="selected">CPU (%)</option>
                            <option value="2">RAM (%)</option>
                            <option value="3">Log message (text)</option>
                        </select>
                        <br />
                        <input type="text" id="CPURate" name="CPURate" value="43" class="form_input" />
                        <br />
                        <input type="submit" class="form_input" />
                    </div>
                </form>
            </div>
            <div class="section">
                <canvas id="cpu_chart"></canvas>
            </div>
        </div>
        <div class="footer">
            <p>Шишкин Владимир</p>
        </div>
    </div>
</body>
</html>
