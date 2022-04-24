package khc.yao.yyordder.service.order.meal.persistent;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMealDAO extends JpaRepository<OrderMealPO, Integer> {
    List<OrderMealPO> getAllByShoppingCartIDOrderByMealName(Integer shoppingCartID);
}
