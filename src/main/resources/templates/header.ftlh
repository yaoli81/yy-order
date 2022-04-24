<!doctype html>
<html lang="zh-Hant-TW">
    <head>
        <#include "/resource.ftlh"/>
        <script>
            $(document).ready(function() {
                $("#order").click(function(){
                    location.href = "/";
                });

                $("#historyOrder").click(function(){
                    location.href = "/history";
                });

                $(".card").click(function(){
                    location.href = "/history/order/" + $(this).attr("data-shoppingCartID");
                });
            });
        </script>

        <title>YYOrder</title>
    </head>
    <body>
        <div style="text-align:center;margin-top:3%;margin-bottom:3%;" class="container-fluid">
            <div class="row">
                <div class="col-1"></div>
                <div id="order" class="button col-4">
                    <h3>訂單</h3>
                </div>
                <div class="col-2"></div>
                <div id="historyOrder" class="button col-4">
                    <h3>歷史訂單</h3>
                </div>
                <div class="col-1"></div>
            </div>
        </div>
    </body>
</html>
