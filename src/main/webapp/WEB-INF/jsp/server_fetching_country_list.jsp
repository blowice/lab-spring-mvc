<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>

    <link href="css/demo_page.css" rel="stylesheet" type="text/css" />
    <link href="css/demo_table.css" rel="stylesheet" type="text/css" />
    <link href="css/demo_table_jui.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" media="all" />


    <script type="text/javascript" language="javascript" src="js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8">
        $(document).ready(function() {
            $('#example').dataTable( {
                "bServerSide": true,
                "sAjaxSource": "serverFetchingCountryList.do",
                "bProcessing": true,
                "sPaginationType": "full_numbers",
                "bJQueryUI": true
            } );
        } );
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
    </tbody>
</table>
</body>
</html>