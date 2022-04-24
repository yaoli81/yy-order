package khc.yao.yyordder.service.order.meal;

import khc.yao.yyordder.common.enumeration.YNFlagEnum;
import khc.yao.yyordder.common.util.TimeUtil;
import khc.yao.yyordder.service.order.meal.persistent.OrderMealDAO;
import khc.yao.yyordder.service.order.meal.persistent.OrderMealPO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderMealService {
    private final OrderMealDAO orderMealDAO;

    public OrderMealService(OrderMealDAO orderMealDAO) {
        this.orderMealDAO = orderMealDAO;
    }

    public List<OrderMealPO> getOrderByID(Integer id) {
        return orderMealDAO.getAllByShoppingCartIDOrderByMealName(id);
    }

    public OrderMealPO saveOrderMeal(int shoppingCartID, String orderer, String meal, String remark, String password, int money) {
        OrderMealPO po = new OrderMealPO();
        po.setShoppingCartID(shoppingCartID);
        po.setOrderer(orderer);
        po.setMealName(meal);
        po.setRemark(remark);
        po.setMoney(money);
        po.setPassword(password);
        po.setPaidFlag(YNFlagEnum.N.name());
        po.setCreateTime(TimeUtil.getNow());
        return orderMealDAO.save(po);
    }

    public void deleteOrderMeal(int orderNumber) {
        orderMealDAO.deleteById(orderNumber);
    }
}
