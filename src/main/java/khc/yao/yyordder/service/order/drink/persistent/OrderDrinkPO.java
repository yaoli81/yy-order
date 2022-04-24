package khc.yao.yyordder.service.order.drink.persistent;

import khc.yao.yyordder.common.YYOrderConstant;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = YYOrderConstant.TBL_ORDER_DRINK, schema = YYOrderConstant.DATABASE_SCHEMA)
public class OrderDrinkPO {
    @Column(name = "shopping_cart_id")
    private int shoppingCartID;

    @Id
    @Column(name = "order_number")
    private int orderNumber;

    @Column(name = "orderer")
    private String orderer;

    @Column(name = "meal_name")
    private String mealName;

    @Column(name = "size")
    private String size;

    @Column(name = "suger")
    private String suger;

    @Column(name = "ice")
    private String ice;

    @Column(name = "remark")
    private String remark;

    @Column(name = "money")
    private int money;

    @Column(name = "password")
    private String password;

    @Column(name = "paid_flag")
    private String paidFlag;

    @Column(name = "create_time")
    private LocalDateTime createTime;
}
