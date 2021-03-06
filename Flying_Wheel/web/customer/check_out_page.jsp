<%-- 
    Document   : checkout
    Created on : Dec 22, 2019, 3:31:21 AM
    Author     : Bellarina C
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<%
    float grandtotal = (Float) request.getAttribute("grand_total");
    int total_item = (Integer) request.getAttribute("total_item");
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Check out</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="https://bootswatch.com/4/minty/bootstrap.min.css">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>

        <!--navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="CustomerControllerServlet">Flying-Wheel</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01"
                    aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="CustomerControllerServlet">Home<span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="CustomerControllerServlet?command=VIEW-BOOKING">Booking</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="CustomerControllerServlet?command=VIEW-SHOP">Shop</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="CustomerControllerServlet?command=VIEW-CART">Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="CustomerControllerServlet?command=VIEW-ORDER">Order</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="CustomerControllerServlet?command=TOP-UP">Top-Up</a>
                    </li>
                </ul>

                <form action="CustomerControllerServlet" method="GET">
                    <input type="hidden" name="command" value="LOGOUT" />
                    <button class="btn btn-secondary my-2 my-sm-0 rounded-pill text-white" name="logout" style="background-color: rgb(255, 60, 0);" >logout</button>
                </form>
            </div>
        </nav>

        <!--Table-->
        <br>
        <br>
        <div class="container">

            <br>
            <br>
            <form method="POST" action="CustomerControllerServlet">
                <input type="hidden" name="command" value="ADD-ORDER"/>
                <input type="hidden" name="grandtotal" value="<%=grandtotal%>"/>

                <div class="card" style="margin-bottom: 30px;"> 
                    <div class="card-body">
                        <h3 style="color: #78C2AD;">Collection Address</h3>
                        <p><span>UTM Bicycle Shop</span> Student Mall, Jalan Meranti, UTM Skudai</p>
                    </div>
                </div>

                <div class="card" style="margin-bottom: 20px;">
                    <table class="table table-hover text-center">
                        <thead class="card-header" style="background-color: #78C2AD; width: 100%;">    
                            <tr>
                                <th scope="col" width="30">Product</th>
                                <th scope="col" align="left"></th>
                                <th scope="col">Brand</th>
                                <th scope="col">Cost</th>
                                <th scope="col" >Quantity</th>                        
                                <th scope="col">Item Subtotal</th> 
                            </tr>
                        </thead>

                        <tbody class="card-body">
                            <c:forEach var="product" items="${cart_item}">     

                                <tr style="margin:2px 5px 2px 5px;">                 

                                    <td style="max-height:30px;"><img src="ImageLoaderServlet?id=${product.item.id}&name='item'" class="card-img-top" alt="bicycle"></td>
                                    <td align="left">${product.item.name}</td>
                                    <td>${product.item.brand}</td>
                                    <td>RM ${product.item.cost}</td>
                                    <td>${product.quantity}</td>                                                                               
                                    <td>RM ${product.total}
                                        <input type="hidden" name="quantity[]" value="${product.quantity}"/>
                                        <input type="hidden" name="itemID[]" value="${product.item.id}"/>
                                        <input type="hidden" name="total[]" value="${product.total}"/>
                                    </td>                         
                                </tr>                               


                            </c:forEach>   

                            <tr style="padding: 50px 0px 10px 0px;">                                
                                <td colspan="5" style="text-align: right;">Order Total (<%= total_item%> items)</td>
                                <td>RM <%= grandtotal%></td>
                            </tr>                               
                        </tbody>
                    </table>
                </div>

                <div class="card" style="margin-bottom: 30px;"> 
                    <div class="card-body" style="width: 100%">
                        <h3 style="color: #78C2AD;">Payment Method:</h3>
                        <p>E-wallet</p>
                        <input type="submit" value="Place Order" class="btn btn-primary" style="width: 100%;">

                    </div>
                </div>
            </form>
        </div>        
    </body>

</html>

