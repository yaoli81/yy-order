<#include "/header.ftlh"/>
<link rel="stylesheet" href="${rootPath}/css/index.css">
<script>
    $(document).ready(function() {
        $(".card").click(function(){
            location.href = "/history/order/" + $(this).attr("data-shoppingCartID");
        });
    });
</script>
<body style="background-color:rgba(0,121,191);">
    <div class="base">
        <div class="row">
            <div class="col-1"></div>
            <div class="board-lists col-10">
                <div class="board-list">
                    <div style="text-align:center;" class="list-title">
                        歷史訂單
                    </div>
                    <#list shoppingCartVOList as shoppingCartVO>
                        <div class="card img-box" data-shoppingCartID="${shoppingCartVO.shoppingCartID}">
                            <#if shoppingCartVO.kind == 'meal'>
                                <div class="tag">美食</div>
                            <#else>
                                <div class="tag">飲料</div>
                            </#if>
                            <h2><span style="position: relative" class="badge rounded-pill bg-primary">${shoppingCartVO.storeName}</span></h2>
                            <h2><span style="position: relative" class="badge rounded-pill bg-secondary">結束時間：${shoppingCartVO.endTime.toLocalDate()} ${shoppingCartVO.endTime.toLocalTime()}</span></h2>
                        </div>
                    </#list>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
    </div>

    <#include "/add-shopping-cart-button.ftlh"/>
</body>

