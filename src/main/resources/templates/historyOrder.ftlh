<#include "/header.ftlh"/>
<link rel="stylesheet" href="${rootPath}/css/index.css">
<script>
    $(document).ready(function() {
        $("#cancelBtn").click(function(){
            location.href = "/";
        });

        $("#copyUrlBtn").click(function(){
            var content = window.location.href;
            navigator.clipboard.writeText(content)
                .then(() => {
                    $.alert("複製成功");
                })
                .catch((err) => {
                    // do nothing
                });
        });
    });
</script>
<body style="background-color:rgba(0,121,191);">
    <div style="text-align: center; margin-bottom: 10px">
        <h1><span class="badge bg-success">${shoppingCartPO.stroeName}</span></h1>
        <h4><span class="badge bg-secondary">開團時間：${shoppingCartPO.startTime.toLocalDate()} ${shoppingCartPO.startTime.toLocalTime()}</span></h4>
        <h4><span class="badge bg-secondary">結束時間：${shoppingCartPO.endTime.toLocalDate()} ${shoppingCartPO.endTime.toLocalTime()}</span></h4>
        <h4><span class="badge bg-warning text-dark">開團人：${shoppingCartPO.owner}</span></h4>
        <button type="button" class="btn btn-dark" id="copyUrlBtn">複製本頁連結</button>
    </div>
    <div class="row">
        <div class="col-1"></div>
        <div class="col-10 border border-3 rounded">
            <br/>
            <#if shoppingCartPO.kind == 'meal'>
                <table style="color: white; min-width: 100%; display: block; overflow-x: auto; white-space: nowrap;" class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th style="width: 25%">訂購人</th>
                        <th style="width: 25%">餐點</th>
                        <th style="width: 50%">備註</th>
                        <th style="width: 25%">金額</th>
                    </tr>
                    </thead>
                    <tbody>
                        <#list orderMealPOList as orderMealPO>
                            <tr>
                                <td>${orderMealPO.orderer}</td>
                                <td>${orderMealPO.mealName}</td>
                                <td>${orderMealPO.remark}</td>
                                <td>${orderMealPO.money}</td>
                            </tr>
                        </#list>
                    </tbody>
                </table>
            <#else>
                <table style="color: white; min-width: 100%; display: block; overflow-x: auto; white-space: nowrap;" class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th style="width: 20%">訂購人</th>
                        <th style="width: 25%">飲料</th>
                        <th style="width: 10%">尺寸</th>
                        <th style="width: 10%">甜度</th>
                        <th style="width: 10%">冰塊</th>
                        <th style="width: 30%">備註</th>
                        <th style="width: 10%">金額</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list orderDrinkPOList as orderDrinkPO>
                        <tr>
                            <td>${orderDrinkPO.orderer}</td>
                            <td>${orderDrinkPO.mealName}</td>
                            <td>${orderDrinkPO.size}</td>
                            <td>${orderDrinkPO.suger}</td>
                            <td>${orderDrinkPO.ice}</td>
                            <td>${orderDrinkPO.remark}</td>
                            <td>${orderDrinkPO.money}</td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </#if>
            <span style="color: white; text-align: center; display:block;">總筆數：${totalSize}</span>
            <span style="color: white; text-align: center; display:block;">總金額：${totalPrice}</span>
            <br/>
        </div>
        <div class="col-1"></div>
    </div>
</body>

