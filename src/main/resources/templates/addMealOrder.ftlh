<#include "/resource.ftlh"/>
<link rel="stylesheet" href="${rootPath}/css/index.css">
<script>
    $(document).ready(function() {
        if ("${status}" === "notOpen") {
            alert('時間還沒到');
            location.href = "/";
        } else if ("${status}" === "end") {
            location.href = "/history/order/" + ${shoppingCartPO.shoppingCartID};
        }

        $("#cancelBtn").click(function(){
            location.href = "/";
        });

        $("#orderBtn").click(function(){
            if ("${shoppingCartPO.kind}" === 'meal') {
                let orderer = $("#floatingMealOrderer").val();
                let meal = $("#floatingMeal").val();
                let money = $("#floatingMealMoney").val();
                let password = $("#floatingMealPassword").val();
                if (orderer.trim() === '') {
                    $.alert('請輸入訂購人');
                    return;
                }
                if (meal.trim() === '') {
                    $.alert('請輸入餐點');
                    return;
                }
                if (money.trim() === '') {
                    $.alert('請輸入金額');
                    return;
                }
                if (password.trim() === '') {
                    $.alert('請輸入密碼');
                    return;
                }
                $.ajax({
                    url: "/api/order/meal",
                    type: "POST",
                    dataType: "json",
                    data: {
                        shoppingCartID: ${shoppingCartPO.shoppingCartID},
                        orderer: orderer,
                        meal: meal,
                        remark: $("#floatingMealRemark").val(),
                        money: money,
                        password: password
                    },
                    success: function (response) {
                        if (response.success === "true") {
                            location.href = "/history/order/" + ${shoppingCartPO.shoppingCartID};
                        } else {
                            alert("失敗");
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status + "\n" + thrownError);
                    },
                    complete: function () {
                    }
                });
            } else {
                let orderer = $("#floatingDrinkOrderer").val();
                let drink = $("#floatingDrink").val();
                let money = $("#floatingDrinkMoney").val();
                let password = $("#floatingDrinkPassword").val();
                if (orderer.trim() === '') {
                    $.alert('請輸入訂購人');
                    return;
                }
                if (drink.trim() === '') {
                    $.alert('請輸入飲料');
                    return;
                }
                if (money.trim() === '') {
                    $.alert('請輸入金額');
                    return;
                }
                if (password.trim() === '') {
                    $.alert('請輸入密碼');
                    return;
                }
                $.ajax({
                    url: "/api/order/drink",
                    type: "POST",
                    dataType: "json",
                    data: {
                        shoppingCartID: ${shoppingCartPO.shoppingCartID},
                        orderer: orderer,
                        drink: drink,
                        size: $("input[name='selectSizeBtnRadio']:checked").attr("data-value"),
                        sugar: $("input[name='selectSugarBtnRadio']:checked").attr("data-value"),
                        ice: $("input[name='selectIceBtnRadio']:checked").attr("data-value"),
                        remark: $("#floatingDrinkRemark").val(),
                        money: money,
                        password: password
                    },
                    success: function (response) {
                        if (response.success === "true") {
                            location.href = "/history/order/" + ${shoppingCartPO.shoppingCartID};
                        } else {
                            alert("失敗");
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status + "\n" + thrownError);
                    },
                    complete: function () {
                    }
                });
            }
        });

        $(".btnFollow").click(function(){
            if ("${shoppingCartPO.kind}" === 'meal') {
                $("#floatingMeal").val($(this).attr("data-mealName"));
                $("#floatingMealRemark").val($(this).attr("data-remark"));
                $("#floatingMealMoney").val($(this).attr("data-money"));
            } else {
                $("#floatingDrink").val($(this).attr("data-mealName"));
                $("#floatingDrinkRemark").val($(this).attr("data-remark"));
                $("#floatingDrinkMoney").val($(this).attr("data-money"));
                let size = $(this).attr("data-size");
                let sugar = $(this).attr("data-sugar");
                let ice = $(this).attr("data-ice");
                $("input[name='selectSizeBtnRadio'][data-value=" + size + "]").attr("checked", "true");
                $("input[name='selectSugarBtnRadio'][data-value=" + sugar + "]").attr("checked", "true");
                $("input[name='selectIceBtnRadio'][data-value=" + ice + "]").attr("checked", "true");
            }
        });

        $(".btnDelete").click(function(){
            let orderNumber = $(this).attr("data-orderNumber");
            let thisPassword = $(this).attr("data-password");
            // 彈出 jquery-confirm 訊息
            $.confirm({
                title: "請輸入密碼",
                content: '<form action="" class="formRemark">' +
                    '<div class="form-group">' +
                    '<input type="text" placeholder="密碼" class="password form-control" required />' +
                    '</div>' +
                    '</form>',
                theme: 'supervan',
                buttons: {
                    確認: function () {
                        var password = this.$content.find('.password').val();
                        if (password === thisPassword) {
                            if ("${shoppingCartPO.kind}" === 'meal') {
                                $.ajax({
                                    url: "/api/order/meal/" + orderNumber,
                                    type: "DELETE",
                                    dataType: "json",
                                    success: function (response) {
                                        if (response.success === "true") {
                                            location.href = "/order/" + ${shoppingCartPO.shoppingCartID};
                                        } else {
                                            alert("失敗");
                                        }
                                    },
                                    error: function (xhr, ajaxOptions, thrownError) {
                                        alert(xhr.status + "\n" + thrownError);
                                    },
                                    complete: function () {
                                    }
                                });
                            } else {
                                $.ajax({
                                    url: "/api/order/drink/" + orderNumber,
                                    type: "DELETE",
                                    dataType: "json",
                                    success: function (response) {
                                        if (response.success === "true") {
                                            location.href = "/order/" + ${shoppingCartPO.shoppingCartID};
                                        } else {
                                            alert("失敗");
                                        }
                                    },
                                    error: function (xhr, ajaxOptions, thrownError) {
                                        alert(xhr.status + "\n" + thrownError);
                                    },
                                    complete: function () {
                                    }
                                });
                            }
                        } else {
                            $.alert('密碼錯誤');
                        }
                    },
                    取消: function () {
                    }
                }
            });
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
    <br/>
    <div class="row">
        <div class="col-1"></div>
        <div class="col-10">
            <div style="text-align: center; margin-bottom: 10px">
                <h1>
                    <span class="badge bg-success">${shoppingCartPO.stroeName}
                        <#if storePO.menuURL != ''>
                            <a href="${storePO.menuURL}" target="_blank" style="color:white">(菜單連結)</a>
                        </#if>
                    </span>
                </h1>
                <h4><span class="badge bg-danger">結束時間：${shoppingCartPO.endTime.toLocalDate()} ${shoppingCartPO.endTime.toLocalTime()}</span></h4>
                <h4><span class="badge bg-warning text-dark">開團人：${shoppingCartPO.owner}</span></h4>
                <button type="button" class="btn btn-dark" id="copyUrlBtn">複製本頁連結</button>
            </div>
            <#if shoppingCartPO.kind == 'meal'>
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="text" class="form-control" id="floatingMealOrderer">
                    <label for="floatingMealOrderer">訂購人</label>
                </div>
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="text" class="form-control" id="floatingMeal">
                    <label for="floatingMeal">餐點</label>
                </div>
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="text" class="form-control" id="floatingMealRemark">
                    <label for="floatingMealRemark">備註</label>
                </div>
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="number" min="0" class="form-control" id="floatingMealMoney">
                    <label for="floatingMealMoney">金額</label>
                </div>
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="text" class="form-control" id="floatingMealPassword">
                    <label for="floatingMealPassword">密碼 (刪單時使用)</label>
                </div>
            <#else>
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="text" class="form-control" id="floatingDrinkOrderer">
                    <label for="floatingDrinkOrderer">訂購人</label>
                </div>
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="text" class="form-control" id="floatingDrink">
                    <label for="floatingDrink">飲料</label>
                </div>
                <div style="margin-bottom: 10px" class="btn-group btn-group-lg" role="group" >
                    <input type="radio" class="btn-check selectSizeBtnRadio" name="selectSizeBtnRadio" id="SizeLargeRadio" autocomplete="off" data-value="大杯" checked>
                    <label class="btn btn-outline-warning" for="SizeLargeRadio">大杯</label>

                    <input type="radio" class="btn-check selectSizeBtnRadio" name="selectSizeBtnRadio" id="SizeMiddleRadioRadio" autocomplete="off" data-value="中杯">
                    <label class="btn btn-outline-warning" for="SizeMiddleRadioRadio">中杯</label>
                </div>
                <br/>
                <div style="margin-bottom: 10px" class="btn-group btn-group-lg" role="group" >
                    <input type="radio" class="btn-check selectSugarBtnRadio" name="selectSugarBtnRadio" id="SugarNormalRadio" autocomplete="off" data-value="正常" checked>
                    <label class="btn btn-outline-warning" for="SugarNormalRadio">正常</label>

                    <input type="radio" class="btn-check selectSugarBtnRadio" name="selectSugarBtnRadio" id="SugarLessRadioRadio" data-value="少糖" autocomplete="off">
                    <label class="btn btn-outline-warning" for="SugarLessRadioRadio">少糖</label>

                    <input type="radio" class="btn-check selectSugarBtnRadio" name="selectSugarBtnRadio" id="SugarHalfRadio" data-value="半糖" autocomplete="off">
                    <label class="btn btn-outline-warning" for="SugarHalfRadio">半糖</label>

                    <input type="radio" class="btn-check selectSugarBtnRadio" name="selectSugarBtnRadio" id="SugarLowRadio" data-value="微糖" autocomplete="off">
                    <label class="btn btn-outline-warning" for="SugarLowRadio">微糖</label>

                    <input type="radio" class="btn-check selectSugarBtnRadio" name="selectSugarBtnRadio" id="NoSugarRadio" data-value="無糖" autocomplete="off">
                    <label class="btn btn-outline-warning" for="NoSugarRadio">無糖</label>
                </div>
                <br/>
                <div style="margin-bottom: 10px" class="btn-group btn-group-lg" role="group" >
                    <input type="radio" class="btn-check selectIceBtnRadio" name="selectIceBtnRadio" id="IceNormalRadio" autocomplete="off" data-value="正常" checked>
                    <label class="btn btn-outline-warning" for="IceNormalRadio">正常</label>

                    <input type="radio" class="btn-check selectIceBtnRadio" name="selectIceBtnRadio" id="IceLessRadio" autocomplete="off" data-value="少冰">
                    <label class="btn btn-outline-warning" for="IceLessRadio">少冰</label>

                    <input type="radio" class="btn-check selectIceBtnRadio" name="selectIceBtnRadio" id="IceLowRadio" autocomplete="off" data-value="微冰">
                    <label class="btn btn-outline-warning" for="IceLowRadio">微冰</label>

                    <input type="radio" class="btn-check selectIceBtnRadio" name="selectIceBtnRadio" id="NoIceRadio" autocomplete="off" data-value="去冰">
                    <label class="btn btn-outline-warning" for="NoIceRadio">去冰</label>

                    <input type="radio" class="btn-check selectIceBtnRadio" name="selectIceBtnRadio" id="WarmRadio" autocomplete="off" data-value="溫">
                    <label class="btn btn-outline-warning" for="WarmRadio">溫</label>

                    <input type="radio" class="btn-check selectIceBtnRadio" name="selectIceBtnRadio" id="HotRadio" autocomplete="off" data-value="熱">
                    <label class="btn btn-outline-warning" for="HotRadio">熱</label>
                </div>
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="text" class="form-control" id="floatingDrinkRemark">
                    <label for="floatingDrinkRemark">備註</label>
                </div>
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="number" min="0" class="form-control" id="floatingDrinkMoney">
                    <label for="floatingDrinkMoney">金額</label>
                </div>
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="text" class="form-control" id="floatingDrinkPassword">
                    <label for="floatingDrinkPassword">密碼 (刪單時使用)</label>
                </div>
            </#if>
            <br/>
            <div style="display: flex;justify-content: center;align-items: center; margin-top: 10px; margin-bottom: 50px" class="form-floating">
                <input style="float:left;margin-right: 3%" type="button" value="訂購" class="btn btn-success btn-lg" id="orderBtn"/>
                <input type="button" value="取消" class="btn btn-danger btn-lg" id="cancelBtn"/>
            </div>
        </div>
        <div class="col-1"></div>
    </div>

    <div class="row">
        <div class="col-1"></div>
        <div class="col-10 border border-3 rounded">
            <br/>
            <h3 style="color: white; font-size: large; text-align: center">其他人點了...</h3>
            <#if shoppingCartPO.kind == 'meal'>
                <table style="color: white; min-width: 100%; display: block; overflow-x: auto; white-space: nowrap;" class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th style="width: 20%">訂購人 </th>
                        <th style="width: 20%">餐點</th>
                        <th style="width: 50%">備註</th>
                        <th style="width: 10%">金額</th>
                        <th style="width: 10%">刪單</th>
                        <th style="width: 10%">跟單</th>
                    </tr>
                    </thead>
                    <tbody>
                        <#list orderMealPOList as orderMealPO>
                            <tr>
                                <td>${orderMealPO.orderer}</td>
                                <td>${orderMealPO.mealName}</td>
                                <td>${orderMealPO.remark}</td>
                                <td>${orderMealPO.money}</td>
                                <td>
                                    <input type="button" value="刪單" class="btnDelete btn btn-success btn-sm" data-orderNumber="${orderMealPO.orderNumber}" data-password="${orderMealPO.password}" />
                                </td>
                                <td>
                                    <input type="button" value="跟單" class="btnFollow btn btn-success btn-sm" data-mealName="${orderMealPO.mealName}" data-remark="${orderMealPO.remark}" data-money="${orderMealPO.money}" />
                                </td>
                            </tr>
                        </#list>
                    </tbody>
                </table>
            <#else>
                <table style="color: white; min-width: 100%; display: block; overflow-x: auto; white-space: nowrap;" class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th style="width: 15%">訂購人</th>
                        <th style="width: 20%">飲料</th>
                        <th style="width: 10%">尺寸</th>
                        <th style="width: 10%">甜度</th>
                        <th style="width: 10%">冰塊</th>
                        <th style="width: 25%">備註</th>
                        <th style="width: 5%">金額</th>
                        <th style="width: 5%">刪單</th>
                        <th style="width: 5%">跟單</th>
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
                            <td>
                                <input type="button" value="刪單" class="btnDelete btn btn-success btn-sm" data-orderNumber="${orderDrinkPO.orderNumber}" data-password="${orderDrinkPO.password}" />
                            </td>
                            <td>
                                <input type="button" value="跟單" class="btnFollow btn btn-success btn-sm" data-mealName="${orderDrinkPO.mealName}" data-size="${orderDrinkPO.size}" data-sugar="${orderDrinkPO.suger}" data-ice="${orderDrinkPO.ice}" data-remark="${orderDrinkPO.remark}" data-money="${orderDrinkPO.money}" />
                            </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </#if>
            <br/><br/>
        </div>
        <div class="col-1"></div>
    </div>
</body>

