# 點餐 / 點飲料系統

這是一個簡單的點餐 / 點飲料系統，提供一個簡單快速的團體點餐服務。

## 動機
- 若很多人要一起訂午餐或飲料時，要正確記錄每個人點的餐點是一件麻煩事。
- 像是透過 LINE 這種聊天群組進行訂餐時，每個人將要訂的餐點 PO 在群組中，但過程中可能一不小心就漏掉某人的餐點，造成麻煩。
- 以此為動機，想開發一套方便透過 LINE 群組溝通時來訂餐的系統。



## 開始使用

目前在 Google 雲端平台中的 Google App Engine 服務上架設個 Demo 網站 (如下連結)，可直接使用。

https://yy-order-dot-gcp-various-demo.uc.r.appspot.com


P.S. 第一次進入可能需要等待 10 餘秒雲端 Tomcat 的啟動

## 使用技術

| 類別          | 技術               |
| ----------------- |:----------------------- |
| 後端               | Java (Spring Boot)   |
| 前端               | Bootstrap、jQuery、FreeMarker (類似 Thymeleaf 的模版引擎)     |
| 資料庫               | MySQL (使用 JPA)     |
| 架設平台           | Google雲端平台(GCP) - Google App Engine     |

## 系統畫面展示 (以手機開 Chrome 瀏覽器為範例)

- 首頁預設顯示訂單畫面 (顯示現在或未來可開放點餐的訂單)

  ![](https://i.imgur.com/XdDjS4K.png)

- 點擊歷史訂單 (顯示過去的訂單)

  ![](https://i.imgur.com/3UQhC94.png)

- 點擊右下角購物車，進入新增訂單畫面

  ![](https://i.imgur.com/rBHyrPe.png)

- 美食/飲料分別記錄不同的店家，亦可選擇新增新店家

  ![](https://i.imgur.com/xEmTpjX.png)

- 建立一筆訂單 - 快閃團 (快閃團表示立即開放點餐，時間到收攤)

  ![](https://i.imgur.com/E75JeB5.png)

- 建立一筆訂單 - 自訂時間 (除了快閃團，也可設定開放時間)

  ![](https://i.imgur.com/BROWV36.png)

- 開團成功，點擊卡片即可進入點餐畫面

  ![](https://i.imgur.com/iO7GTei.png)

- 點餐畫面 - 美食介面

  ![](https://i.imgur.com/O7qVkGH.png)

- 點餐畫面 - 飲料介面

  ![](https://i.imgur.com/FVEHngB.png)

- 點餐完畢 (顯示總金額)

  ![](https://i.imgur.com/WWYdjbQ.png)

## 未來延伸
- 未來希望結合 LINE 的 Bot，以提升在 LINE 群組上使用的便利性。LINE 的 Bot 預計提供以下功能：
    - 訂單開放點餐時，自動通知到 LINE 群組，並提供點餐連結。
    - 訂單快結束前，自動通知到 LINE 群組，提醒尚未點餐的人，並提供點餐連結。
    - 群組中有人輸入“訂飲料” / “訂餐” 或 Bot 名稱等關鍵字時，會彈出 Bot 的回覆 (如右示意圖，此示意圖為台新銀行 LINE 通知)
