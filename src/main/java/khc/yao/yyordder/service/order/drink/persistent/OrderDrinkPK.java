package khc.yao.yyordder.service.order.drink.persistent;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor @AllArgsConstructor
public class OrderDrinkPK implements Serializable {
    private int shoppingCartID;
    private int orderNumber;
}
