<#include "/header.ftlh"/>
<link rel="stylesheet" href="${rootPath}/css/index.css">
<script>
    $(document).ready(function() {
        // 需要倒數的自動新增
        $('span.countdown').each(function() {
            countdown($(this).attr('id'));
        });
        function countdown(elementName) {
            var minutes = parseInt($("#" + elementName).attr('data-countdownMinute'), 10);
            var seconds = parseInt($("#" + elementName).attr('data-countdownSecond'), 10);
            var message = $("#" + elementName).attr('data-message');
            var endTime, hours, mins, msLeft, time;
            function twoDigits( n ) {
                return (n <= 9 ? "0" + n : n);
            }
            function updateTimer() {
                msLeft = endTime - (+new Date);
                if ( msLeft < 1000 ) {
                    location.href = "/";
                } else {
                    time = new Date( msLeft );
                    hours = time.getUTCHours();
                    mins = time.getUTCMinutes();
                    $("#" + elementName).text(message + " " + (hours ? hours + ':' + twoDigits( mins ) : mins) + ':' + twoDigits( time.getUTCSeconds() ));
                    setTimeout( updateTimer, time.getUTCMilliseconds() + 500 );
                }
            }
            endTime = (+new Date) + 1000 * (60*minutes + seconds) + 500;
            updateTimer();
        }

        $(".card").click(function(){
            location.href = "/order/" + $(this).attr("data-shoppingCartID");
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
                        訂單
                    </div>
                    <#list shoppingCartVOList as shoppingCartVO>
                        <div class="card img-box" data-shoppingCartID="${shoppingCartVO.shoppingCartID}">
                            <#if shoppingCartVO.kind == 'meal'>
                                <div class="tag">美食</div>
                            <#else>
                                <div class="tag">飲料</div>
                            </#if>
                            <#if shoppingCartVO.openFlag == 'N'>
                                <h2>
                                    <span style="position: relative" class="badge rounded-pill bg-primary">${shoppingCartVO.storeName}</span>
                                    <span style="position: relative" class="badge rounded-pill bg-secondary">尚未開團</span>
                                </h2>
                                <h2>
                                    <#if shoppingCartVO.countdownFlag == 'Y'>
                                        <span style="position: relative" class="badge rounded-pill bg-danger text-white countdown" id="countdown-${shoppingCartVO.shoppingCartID}" data-countdownMinute="${shoppingCartVO.countdownMinute}" data-countdownSecond="${shoppingCartVO.countdownSecond}" data-message="開團倒數"></span>
                                    <#else>
                                        <span style="position: relative" class="badge rounded-pill bg-success">開團時間：${shoppingCartVO.startTime.toLocalDate()} ${shoppingCartVO.startTime.toLocalTime()}</span>
                                    </#if>
                                </h2>
                            <#else>
                                <h2>
                                    <span style="position: relative" class="badge rounded-pill bg-primary">${shoppingCartVO.storeName}</span>
                                    <span style="position: relative" class="badge rounded-pill bg-danger">開團中</span>
                                </h2>
                                <h2>
                                    <#if shoppingCartVO.countdownFlag == 'Y'>
                                        <span style="position: relative" class="badge rounded-pill bg-secondary text-white countdown" id="countdown-${shoppingCartVO.shoppingCartID}" data-countdownMinute="${shoppingCartVO.countdownMinute}" data-countdownSecond="${shoppingCartVO.countdownSecond}" data-message="結束倒數"></span>
                                    <#else>
                                        <span style="position: relative" class="badge rounded-pill bg-success">結束時間：${shoppingCartVO.endTime.toLocalDate()} ${shoppingCartVO.endTime.toLocalTime()}</span>
                                    </#if>
                                </h2>
                            </#if>
                        </div>
                    </#list>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
    </div>

    <#include "/add-shopping-cart-button.ftlh"/>
</body>

