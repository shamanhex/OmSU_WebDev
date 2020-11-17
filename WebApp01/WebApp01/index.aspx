<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApp01.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ОмГУ. Пример веб-приложения</title>
    <link rel="stylesheet" href="./main.css" />
</head>
<body>
    <table>
        <tr> <!-- Заголовок -->
            <td colspan="2">
                <div>
                    <div class="inline" style="width:75%;">
                        <h1>Мониторинг производительности</h1>
                    </div>
                    <div class="inline" style="text-align:right; width:20%; text-align:right">
                        10.11.2020
                        <br />
                        15:45 МСК
                    </div>
                </div>
            </td>
        </tr>
        <tr> <!-- Основная часть -->
            <td> <!-- Левое меню -->
                <form id="form1" runat="server">
                    <div style="text-align:right;">
                        <div>Форма отправки данных:</div>
                        <br />
                        <select id="ValueType" name="ValueType" class="form_input">
                            <option value="1" selected="1">CPU (%)</option>
                            <option value="2">RAM (%)</option>
                            <option value="3">Log message (text)</option>
                        </select>
                        <br />
                        <input type="text" id="CPURate" name="CPURate" value="43" class="form_input" />
                        <br />
                        <input type="submit" class="form_input" />
                    </div>
                </form>
            </td>
            <td> <!-- Рабочая область -->
                <img src="./img/CPUChart.png" alt="CPU load chart" />
            </td>
        </tr>
        <tr> <!-- Подвал/Footer -->
            <td colspan="2">
                <p>Шишкин Владимир</p>
            </td>
        </tr>
    </table>



    <h1>Заголок 1</h1>
    <p>Текст <b>текст <i>текст</i></b> текст</p>
    <h2>Заголок 2</h2>
    Перечисления.
    <br />
    <br />
    Нумерованные:
    <ol>
        <li>Элемент</li>
        <li>Элемент</li>
    </ol>

    Ненумерованные:
    <ul>
        <li>Элемент</li>
        <li>Элемент</li>
    </ul>
    <h3>Заголок 3</h3>
    <h4>Заголок 4</h4>
    
</body>
</html>
