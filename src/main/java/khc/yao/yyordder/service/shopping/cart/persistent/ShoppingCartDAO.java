package khc.yao.yyordder.service.shopping.cart.persistent;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShoppingCartDAO extends JpaRepository<ShoppingCartPO, Integer> {
    @Query(value = "SELECT shopping_cart_id, owner, kind, stroe_name, start_time, end_time, total_price FROM shopping_cart WHERE end_time > ?1 ORDER BY start_time", nativeQuery = true)
    List<ShoppingCartPO> getNotExpiredShoppingCart(String nowTime);

    @Query(value = "SELECT shopping_cart_id, owner, kind, stroe_name, start_time, end_time, total_price FROM shopping_cart WHERE end_time <= ?1 ORDER BY end_time DESC LIMIT 10", nativeQuery = true)
    List<ShoppingCartPO> get10ShoppingCartHistory(String nowTime);
}
