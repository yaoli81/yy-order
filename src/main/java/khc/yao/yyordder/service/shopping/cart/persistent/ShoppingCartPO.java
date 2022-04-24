package khc.yao.yyordder.service.shopping.cart.persistent;

import khc.yao.yyordder.common.YYOrderConstant;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = YYOrderConstant.TBL_SHOPPING_CART, schema = YYOrderConstant.DATABASE_SCHEMA)
public class ShoppingCartPO {
    @Id
    @Column(name = "shopping_cart_id")
    private int shoppingCartID;

    @Column(name = "owner")
    private String owner;

    @Column(name = "kind")
    private String kind;

    @Column(name = "stroe_name")
    private String stroeName;

    @Column(name = "start_time")
    private LocalDateTime startTime;

    @Column(name = "end_time")
    private LocalDateTime endTime;

    @Column(name = "total_price")
    private int totalPrice;
}
