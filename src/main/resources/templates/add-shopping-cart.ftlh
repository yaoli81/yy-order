<#include "/resource.ftlh"/>
<link rel="stylesheet" href="${rootPath}/css/add-shopping-cart.css">
<script>
    $(document).ready(function() {
        $("#storeInfo").hide();
        var mealType = 'meal';
        $("#drinkSelect").hide();
        var nowTime = new Date();
        // 設定 +8 時區
        nowTime.setHours(nowTime.getHours() + 8);
        $("#floatingOpenTime").attr('value', nowTime.toISOString().substr(0, 16));
        $("#floatingEndTime").attr('value', nowTime.toISOString().substr(0, 16));
        // 新增購物車
        $(".option").click(function(){
            if ($(this).attr('data-select') === 'meal') {
                mealType = 'meal';
                $("#mealSelect").show();
                $("#drinkSelect").hide();
            } else {
                mealType = 'drink';
                $("#mealSelect").hide();
                $("#drinkSelect").show();
            }
            $("#mealSelect").val('選擇店家');
            $("#drinkSelect").val('選擇店家');
            $("#storeInfo").hide();
        });

        $(".selectTypeBtnRadio").click(function(){
            var type = $("input[name='selectTypeBtnRadio']:checked").attr("id");
            if (type === 'quickRadio') {
                $("#quickTime").show();
                $("#customizeTime").hide();
            } else {
                $("#quickTime").hide();
                $("#customizeTime").show();
            }
        });

        $("#openBtn").click(function(){
            var store = "";
            var menuLink = $("#floatingMenu").val();
            var timeType;
            var quickTime;
            var customizeOpenTime;
            var customizeEndTime;
            var owner = $("#floatingOwner").val();
            if (owner.trim() === '') {
                $.alert('請輸入開團人');
                return;
            }
            if (mealType === 'meal') {
                if ($("#mealSelect").val() === '選擇店家') {
                    $.alert('請選擇店家');
                    return;
                } else {
                    store = $("#mealSelect").val();
                }
            } else {
                if ($("#drinkSelect").val() === '選擇店家') {
                    $.alert('請選擇店家');
                    return;
                } else {
                    store = $("#drinkSelect").val();
                }
            }
            if ($("input[name='selectTypeBtnRadio']:checked").attr("id") === 'quickRadio') {
                timeType = 'quick';
            } else {
                timeType = 'customize';
            }
            quickTime = $("input[name='quickBtnRadio']:checked").attr("data-time");
            customizeOpenTime = $("#floatingOpenTime").val();
            customizeEndTime = $("#floatingEndTime").val();

            if ((mealType === 'meal' && $("#mealSelect").val() === "add") ||
                (mealType === 'drink' && $("#drinkSelect").val() === "add")) {
                store = $("#floatingStoreName").val();
                if (store.trim() === '') {
                    $.alert('請輸入店家名稱');
                    return;
                }
                // 新增店家到資料庫
                $.ajax({
                    url: "/api/store/add",
                    type: "POST",
                    dataType: "json",
                    data: {
                        mealType: mealType,
                        store: store,
                        menuLink: menuLink
                    },
                    success: function (response) {
                        if (response.success === "true") {
                            // do nothing
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

            $.ajax({
                url: "/api/shopping/cart/add",
                type: "POST",
                dataType: "json",
                data: {
                    mealType: mealType,
                    owner: owner,
                    store: store,
                    timeType: timeType,
                    quickTime: quickTime,
                    customizeOpenTime: customizeOpenTime,
                    customizeEndTime: customizeEndTime
                },
                success: function (response) {
                    if (response.success === "true") {
                        location.href = "/";
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
        });

        $("#cancelBtn").click(function(){
            location.href = "/";
        });

        $(".storeSelect").change(function(){
            if ((mealType === 'meal' && $("#mealSelect").val() === "add") ||
                (mealType === 'drink' && $("#drinkSelect").val() === "add")) {
                $("#storeInfo").show();
            } else {
                $("#storeInfo").hide();
            }
        });
    });
</script>
<body style="background-color:rgba(0,121,191);">
    <div style="margin-top: 10px; margin-bottom: 10px;" class="row">
        <div class="col-2"></div>
        <div class="col-8">
        <div class="wrapper">
            <input type="radio" name="select" id="option-1" checked>
            <label for="option-1" class="option option-1" data-select="meal">
                <div class="dot"></div>
                <span>美食</span>
            </label>
            <input type="radio" name="select" id="option-2">
            <label for="option-2" class="option option-2" data-select="drink">
                <div class="dot"></div>
                <span>飲料</span>
            </label>
        </div>
        </div>
        <div class="col-2"></div>
    </div>
    <div class="row">
        <div class="col-1"></div>
        <div class="col-10">
            <div style="margin-bottom: 10px" class="form-floating">
                <input type="text" class="form-control" id="floatingOwner">
                <label for="floatingOwner">開團人</label>
            </div>
            <div style="margin-bottom: 10px" class="form-floating">
                <select class="form-select storeSelect" id="mealSelect" aria-label="Floating label select example">
                    <option selected>選擇店家</option>
                    <option style="background-color: yellow;" value="add">---新增美食店家---</option>
                    <#assign storeList = kindMapStoreList['meal']>
                    <#list storeList as store>
                        <option value="${store.storeName}">${store.storeName}</option>
                    </#list>
                </select>
                <select class="form-select storeSelect" id="drinkSelect" aria-label="Floating label select example">
                    <option selected>選擇店家</option>
                    <option style="background-color: yellow;" value="add">---新增飲料店---</option>
                    <#assign storeList = kindMapStoreList['drink']>
                    <#list storeList as store>
                        <option value="${store.storeName}">${store.storeName}</option>
                    </#list>
                </select>
                <label for="floatingSelect">店家</label>
            </div>
            <div id="storeInfo">
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="text" class="form-control" id="floatingStoreName">
                    <label for="floatingStoreName">店家名稱</label>
                </div>
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="text" class="form-control" id="floatingMenu">
                    <label for="floatingMenu">菜單連結</label>
                </div>
            </div>
            <div style="margin-bottom: 10px" class="btn-group btn-group-lg" role="group" >
                <input type="radio" class="btn-check selectTypeBtnRadio" name="selectTypeBtnRadio" id="quickRadio" autocomplete="off" checked>
                <label class="btn btn-danger" for="quickRadio">快閃團</label>

                <input type="radio" class="btn-check selectTypeBtnRadio" name="selectTypeBtnRadio" id="customizeRadio" autocomplete="off">
                <label class="btn btn-danger" for="customizeRadio">自訂時間</label>
            </div>
            <br/>
            <div id="quickTime">
                <div class="btn-group" role="group" >
                    <input type="radio" class="btn-check" name="quickBtnRadio" id="quickBtn10" data-time="10" autocomplete="off" checked>
                    <label class="btn btn-outline-warning" for="quickBtn10">快閃10分鐘</label>

                    <input type="radio" class="btn-check" name="quickBtnRadio" id="quickBtn20" data-time="20" autocomplete="off">
                    <label class="btn btn-outline-warning" for="quickBtn20">快閃20分鐘</label>

                    <input type="radio" class="btn-check" name="quickBtnRadio" id="quickBtn30" data-time="30" autocomplete="off">
                    <label class="btn btn-outline-warning" for="quickBtn30">快閃30分鐘</label>
                </div>
            </div>
            <div id="customizeTime" style="display: none">
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="datetime-local" class="form-control" id="floatingOpenTime">
                    <label for="floatingOpenTime">開放時間</label>
                </div>
                <div style="margin-bottom: 10px" class="form-floating">
                    <input type="datetime-local" class="form-control" id="floatingEndTime">
                    <label for="floatingEndTime">截止時間</label>
                </div>
            </div>
            <div style="display: flex;justify-content: center;align-items: center; margin-top: 10px" class="form-floating">
                <input style="float:left;margin-right: 3%" type="button" value="開團" class="btn btn-success btn-lg" id="openBtn"/>
                <input type="button" value="取消" class="btn btn-danger btn-lg" id="cancelBtn"/>
            </div>
        </div>
        <div class="col-1"></div>
    </div>
</body>

