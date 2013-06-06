<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/demo_page.css"/>
    <link rel="stylesheet" type="text/css" href="./css/demo_table.css"/>

    <script type="text/javascript" language="javascript" src="js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            $('#example').dataTable({
                "bJQueryUI": true,
                "oLanguage": {
                    "sLengthMenu": "Display _MENU_ records per page",
                    "sZeroRecords": "Nothing found - sorry",
                    "sInfo": "Showing _START_ to _END_ of _TOTAL_ records",
                    "sInfoEmpty": "Showing 0 to 0 of 0 records",
                    "sInfoFiltered": "(filtered from _MAX_ total records)"
                }
            });
        });
    </script>
    <title>Country List</title>
</head>
<body>
<table id="example" style="width: 100%;font-family: Calibri; font-size:100%" cellspacing="0"
       cellpadding="0" border="0">
    <thead>
    <tr>
        <th align="centre">#</th>
        <th align="center">COUNTRY CODE</th>
        <th align="center">COUNTRY NAME</th>
        <th align="center">NATIONALITY NAME</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${countryList}" var="country">
        <tr>
            <td>${country.id}</td>
            <td>${country.code}</td>
            <td>${country.description}</td>
            <td>${country.nationalityName}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>