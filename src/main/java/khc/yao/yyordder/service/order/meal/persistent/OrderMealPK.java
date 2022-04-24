package khc.yao.yyordder.service.order.meal.persistent;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor @AllArgsConstructor
public class OrderMealPK implements Serializable {
    private int shoppingCartID;
    private int orderNumber;
}
