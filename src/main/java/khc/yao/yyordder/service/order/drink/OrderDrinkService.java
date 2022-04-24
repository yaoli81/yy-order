package khc.yao.yyordder.service.order.drink;

import khc.yao.yyordder.common.enumeration.YNFlagEnum;
import khc.yao.yyordder.common.util.TimeUtil;
import khc.yao.yyordder.service.order.drink.persistent.OrderDrinkDAO;
import khc.yao.yyordder.service.order.drink.persistent.OrderDrinkPO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDrinkService {
    private final OrderDrinkDAO orderDrinkDAO;

    public OrderDrinkService(OrderDrinkDAO orderDrinkDAO) {
        this.orderDrinkDAO = orderDrinkDAO;
    }

    public List<OrderDrinkPO> getOrderByID(Integer id) {
        return orderDrinkDAO.getAllByShoppingCartIDOrderByMealName(id);
    }

    public OrderDrinkPO saveOrderDrink(int shoppingCartID, String orderer, String drink, String size, String sugar, String ice, String remark, String password, int money) {
        OrderDrinkPO po = new OrderDrinkPO();
        po.setShoppingCartID(shoppingCartID);
        po.setOrderer(orderer);
        po.setMealName(drink);
        po.setSize(size);
        po.setSuger(sugar);
        po.setIce(ice);
        po.setRemark(remark);
        po.setMoney(money);
        po.setPassword(password);
        po.setPaidFlag(YNFlagEnum.N.name());
        po.setCreateTime(TimeUtil.getNow());
        return orderDrinkDAO.save(po);
    }

    public void deleteOrderMeal(int orderNumber) {
        orderDrinkDAO.deleteById(orderNumber);
    }
}
