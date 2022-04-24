package khc.yao.yyordder.controller.freemarker.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class ShoppingCartVO {
    private int shoppingCartID;
    private String kind;
    private String storeName;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    private int totalPrice;
    private String openFlag;
    private String countdownFlag;
    private String countdownMinute;
    private String countdownSecond;
}
